#! node
const fs = require("fs");
const util = require("util");
const path = require("path");
const colors = require("colors");

const configFileName = "dotfilesrc.json";
const {
  env: { HOME: homePath }
} = process;

// Load Config
const fileContents = fs.readFileSync(configFileName);

const { files } = JSON.parse(fileContents);

// validate config
// TODO: validate Config

const errors = files.map(file => {
  // Find File
  const filePath = findFile(file);
  if (!filePath) {
    return { message: "Could not find file", reason: "file-not-found", file };
  }
  console.log(colors.blue(filePath));
  return undefined;
});

errors.map(error => {
  if (!error) {
    return;
  }
  const {
    message,
    file: { name }
  } = error;
  console.error(colors.red(`${message} : ${name}`));
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
