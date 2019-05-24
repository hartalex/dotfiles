" NERDTREE 
map <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1

" vim-test
map <C-a> :TestNearest<CR>
map <C-f> :TestFile<CR>
map <F2> :TestSuite<CR>

" jest test
let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
let g:test#strategy = 'neomake'

" Coverage
let g:coverage_json_report_path = 'coverage/coverage-final.json'

" PRETTIER
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0

" Don't show YCM's preview window 
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" fugitive gitlab integration
let g:fugitive_gitlab_domains = ['https://git.nmlv.nml.com']

" Airline
let g:airline#extensions#tabline#enabled = 1

" Rainbow closures
let g:rainbow_active = 1 

" DevIcons
set encoding=UTF-8
set guifont=Hack\ Regular\ Nerd\ Font\ Complete

" Plugins
call plug#begin('~/.vim/plugged')

" Test
Plug 'janko/vim-test'

" Coverage
Plug 'ruanyl/coverage.vim'

" Git Gutters
Plug 'airblade/vim-gitgutter'

" Editor Config
Plug 'editorconfig/editorconfig-vim'

" Status Line configuration   
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" ALE - Linting
Plug 'w0rp/ale'

" On-demand loading
"  NERDTREE
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"  NERDTREE GIT
Plug 'Xuyuanp/nerdtree-git-plugin'

" Surround
Plug 'tpope/vim-surround'

" Autocompletion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" Eunuch
Plug 'tpope/vim-eunuch'

" Fuzzy Filter Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git Commands
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'

" Hacker News
Plug 'adelarsq/vim-hackernews'

" Multi Cursors
Plug 'terryma/vim-multiple-cursors'

" Rainbow closures
Plug 'luochen1990/rainbow'

" CSS Color
Plug 'ap/vim-css-color'

" Jest 
Plug 'neomake/neomake'

" Solarized
Plug 'altercation/vim-colors-solarized'

" NPM
Plug 'neoclide/npm.nvim', {'do' : 'npm install'}

" DevIcons
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()
