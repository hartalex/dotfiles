set nowrap

" Theme
color atom-dark-256

" NERDTREE
map <C-n> :NERDTreeToggle<CR>
nmap <Leader>f :NERDTreeToggle<Enter>
nmap <Home> :NERDTreeToggle<Enter>

nnoremap <PageUp> <c-w>w
nnoremap <PageDown> <c-w>W

" Terminal key mappings
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" Surround
map <Leader>" ysiw"
map <Leader>' ysiw'

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1


" Tagbar
nmap <F8> :TagbarToggle<CR>

" Elite mode
let g:elite_mode=1

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
 nnoremap <Up>    :resize +2<CR>
 nnoremap <Down>  :resize -2<CR>
 nnoremap <Left>  :vertical resize +2<CR>
 nnoremap <Right> :vertical resize -2<CR>
endif

" jest test
let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
let g:test#strategy = 'neomake'

" Coverage
let g:coverage_json_report_path = 'coverage/coverage-final.json'

" PRETTIER
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" Autocomplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ['tern']
let g:tern#arguments = [' — persistent']

" fugitive gitlab integration
let g:fugitive_gitlab_domains = ['https://git.nmlv.nml.com']
" Ale
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = "\uf05e"
let g:airline#extensions#ale#warning_symbol = "\uf071"
let g:airline#extensions#ale#checking_symbol = "\uf110"
let g:airline_powerline_fonts = 1
let g:airline_section_x = '%{PencilMode()}'

" Rainbow closures
let g:rainbow_active = 1

" DevIcons
set encoding=UTF-8
set guifont=Hack\ Regular\ Nerd\ Font\ Complete

" Spelling
set spell spelllang=en_us

" Split below
set splitbelow

" Line Numbers
set number

" Folding
set foldmethod=syntax
set foldcolumn=1
let javaScript_fold=1
set foldlevelstart=99

" incremental search
set incsearch

" high light search
set hlsearch

" Javascript library syntax
let g:used_javascript_libs='react,underscore,requirejs,jasmine'

" ALE 
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

" ----  Plugins  ----
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

" Comments
Plug 'scrooloose/nerdcommenter'

" On-demand loading
"  Nerd Tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"  Nerd Tree GIT
Plug 'Xuyuanp/nerdtree-git-plugin'
" Nerd Tree syntax highlighting
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Surround
Plug 'tpope/vim-surround'

" Autocompletion
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'Shougo/deoplete.nvim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'

" Eunuch
Plug 'tpope/vim-eunuch'

" Fuzzy Filter Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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

" Javascript
Plug 'sheerun/vim-polyglot'

" Startify
Plug 'mhinz/vim-startify'

" Rooter
Plug 'airblade/vim-rooter'

" Emmet
Plug 'mattn/emmet-vim'

" Postgres
Plug 'lifepillar/pgsql.vim'

" Themes
Plug 'flrnprz/plastic.vim'
Plug 'gosukiwi/vim-atom-dark'

" Tag Bar
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'


" Package json
Plug 'meain/vim-package-info', { 'do': 'npm install' }

" Merginal
Plug 'idanarye/vim-merginal'

" Pencil
Plug 'reedes/vim-pencil'

" Commentary
Plug 'tpope/vim-commentary'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" Initialize plugin system
call plug#end()
