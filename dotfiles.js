#! node
const fs = require("fs");
const util = require("util");
const path = require("path");
const colors = require("colors");
const crypto = require("crypto");
const git = require("nodegit");

const configFileName = "dotfilesrc.json";
const repoPath = ".";
const {
  env: { HOME: homePath }
} = process;

// Load Config
const fileContents = fs.readFileSync(configFileName);

const { files } = JSON.parse(fileContents);

// validate config
// TODO: validate Config

const errors = files.map(file => {
  const { name } = file;
  // Find destination File
  const filePath = findFile(file);
  if (!filePath) {
    return {
      message: "Could not find in locations",
      reason: "file-not-found",
      file
    };
  }
  const repoFilePath = path.join(repoPath, name);
  // Compare local files against filePath
  if (!filesAreSame(repoFilePath, filePath)) {
    //copy filePath to repoFilePath
    fs.copyFileSync(filePath, repoFilePath);
    return {
      message: "Files are different",
      reason: "file-diff",
      file
    };
  }

  return undefined;
});

const filteredErrors = errors.filter(error => error);

const fileDiffErrors = filteredErrors.filter(error => {
  const { reason } = error;
  return reason === "file-diff";
});

if (fileDiffErrors.length > 0) {
  const fileNameList = fileDiffErrors.reduce((acc, error, idx) => {
    const {
      file: { name }
    } = error;
    if (idx === 0) {
      return name;
    }
    return `${acc}, ${name}`;
  }, "");
  console.warn(
    colors.blue(
      `Found differences in file(s): ${fileNameList}. Please Review, Commit, and Push these to the repo.`
    )
  );
}
git.Repository.open(repoPath)
  .then(repo => {
    return repo.getStatus();
  })
  .then(statusList => {
    if (statusList.length > 0) {
      const fileNameList = statusList.reduce((acc, status, idx) => {
        if (idx === 0) {
          return status.path();
        }
        return `${acc}, ${status.path()}`;
      }, "");

      console.warn(
        colors.blue(
          `There are files that still need to be committed: ${fileNameList}`
        )
      );
      return undefined;
    }
    return repo;
  })
  .then(repo => {
    if (repo) {
      return repo.fetch();
    }
    filteredErrors.map(error => {
      const {
        message,
        reason,
        file: { name }
      } = error;
      if (reason !== "file-diff") {
        console.error(colors.red(`${message} : ${name}`));
      }
    });
  })
  .then(() => {})
  .catch(error => {
    console.error(colors.red(util.inspect(error)));
  });

function findFile(file) {
  const { name, locations } = file;
  const homeFilePath = path.join(homePath, name);
  if (!locations) {
    if (!fileExists(homeFilePath)) {
      return undefined;
    }

    return homeFilePath;
  }
  // search locations for files
  locations.push(homePath);
  const foundLocations = locations.filter(location => {
    const locationPath = path.join(location, name);
    return fileExists(locationPath);
  });
  if (foundLocations.length <= 0) {
    return undefined;
  }
  const foundLocationPath = path.join(foundLocations[0], name);
  return foundLocationPath;
}

function fileExists(filePath) {
  try {
    fs.accessSync(filePath, fs.constants.F_OK);
    return true;
  } catch (error) {
    // TODO: Change to debug log
    console.error(colors.red(util.inspect(error)));
  }
  return false;
}

function checksum(str, algorithm, encoding) {
  return crypto
    .createHash(algorithm || "sha512")
    .update(str, "utf8")
    .digest(encoding || "hex");
}

function filesAreSame(a, b) {
  const aData = fs.readFileSync(a);
  const aHash = checksum(aData);
  const bData = fs.readFileSync(b);
  const bHash = checksum(bData);
  if (aHash === bHash) {
    return true;
  }

  return false;
}
