" Tabs and Indentation
" set tabstop=2
" set shiftwidth=2
" set expandtab
" set softtabstop=2

" Line Numbers
set number
set relativenumber

" Indentation and Wrapping
set autoindent
" set smarttab
" set cindent
set textwidth=80

" Display
set cmdheight=2
set signcolumn=yes

" Performance
set updatetime=300
set shortmess+=c

" Files
set nobackup
set nowritebackup

" Search
set hidden
set incsearch
set hlsearch

" Syntax
syntax on

" Color Scheme
colorscheme habamax

" Filetype Specific Settings (Example for Python)
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab

" Every new tab to start with a vertical split
" autocmd TabNewEntered * vsplit

" Use Ctrl + Tab / Ctrl + Shift + Tab to switch tabs
nnoremap <C-t>   :tabnext<CR>
nnoremap <C-A-t> :tabprevious<CR>

" Open a new tab quickly
nnoremap <C-n> :tabnew<CR>

" Close the current tab
nnoremap <C-w> :tabclose<CR>

" Use Alt + Arrow Keys to move between splits
nnoremap <A-Left>  :leftabove vsplit<CR>
nnoremap <A-Down>  :split<CR>
nnoremap <A-Up>    :aboveleft split<CR>
nnoremap <A-Right> :vsplit<CR>

" Resize splits using Shift + Arrow keys
nnoremap <S-Left>  :vertical resize -5<CR>
nnoremap <S-Right> :vertical resize +5<CR>
nnoremap <S-Up>    :resize +5<CR>
nnoremap <S-Down>  :resize -5<CR>


call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'scrooloose/nerdtree'

" Plug 'tsony-tsonev/nerdtree-git-plugin'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'ryanoasis/vim-devicons'

Plug 'airblade/vim-gitgutter'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdcommenter'

Plug 'christoomey/vim-tmux-navigator'

Plug 'nvim-lua/plenary.nvim' 

Plug 'nvim-lua/popup.nvim' 

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

call plug#end()


" COC CONFIG
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]


" NERDTREE
inoremap jk <ESC>
nmap <C-b> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
" open NERDTree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
    "\ }                         


let g:NERDTreeIgnore = ['^node_modules$']

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()


" VIM-PRETTIER
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" CTRLP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']



" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


" Remap for rename current word
nmap <F2> <Plug>(coc-rename)


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" VIM-AIRLINE
" let g:airline_theme='jellybeans'
let g:airline_theme='luna'
