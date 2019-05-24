" NERDTREE 
map <C-n> :NERDTreeToggle<CR>

" vim-test
map <C-a> :TestNearest<CR>
map <C-f> :TestFile<CR>
map <F2> :TestSuite<CR>

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

" Status Line configuration - LightLine 
Plug 'itchyny/lightline.vim'

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

" AutoClose
Plug 'Townk/vim-autoclose'

" Eunuch
Plug 'tpope/vim-eunuch'

" Fuzzy Filter Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git Commands
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'

" Initialize plugin system
call plug#end()
