" Line Numbers
set number
set relativenumber

" Indentation and Wrapping
set autoindent
set smarttab
set cindent
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
" colorscheme habamax


" Filetype Specific Settings 
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

autocmd FileType typescriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

autocmd FileType javascriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab


" Exit insert mode with 'j+k'
inoremap jk <ESC>


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

" Use Ctrl+` to open terminal
nnoremap <S-n> :belowright split<CR>:terminal<CR>

" Remap terminal exit shortcut
tnoremap <Esc> <C-\><C-n>

" Resize splits using Shift + Arrow keys
nnoremap <S-Left>  :vertical resize -5<CR>
nnoremap <S-Right> :vertical resize +5<CR>
nnoremap <S-Up>    :resize +5<CR>
nnoremap <S-Down>  :resize -5<CR>

" Browser-sync (works like live server)
nnoremap <leader>bs :!browser-sync start --server --files "*.html, css/*.css, js/*.js" &<CR>

call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-tree/nvim-tree.lua'  	" File tree

Plug 'nvim-tree/nvim-web-devicons'  	" File Icons

Plug 'airblade/vim-gitgutter'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdcommenter'

Plug 'christoomey/vim-tmux-navigator'

Plug 'nvim-lua/plenary.nvim' 

Plug 'nvim-lua/popup.nvim' 

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'dense-analysis/ale'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'folke/tokyonight.nvim'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'neovim/nvim-lspconfig'          " Core LSP support

Plug 'williamboman/mason.nvim'        " Easy LSP installation

Plug 'williamboman/mason-lspconfig.nvim' " Bridge between Mason and lspconfig

Plug 'hrsh7th/nvim-cmp'               " Autocompletion engine

Plug 'hrsh7th/cmp-nvim-lsp'           " LSP completion source

Plug 'hrsh7th/cmp-buffer'             " Buffer completion

Plug 'hrsh7th/cmp-path'               " Path completion

Plug 'saadparwaiz1/cmp_luasnip'       " Snippet completion

Plug 'L3MON4D3/LuaSnip'               " Snippet engine

Plug 'numToStr/Comment.nvim'          " Code Comments

Plug 'glepnir/lspsaga.nvim'           " UI Enhancements for LSP

Plug 'lewis6991/hover.nvim'

Plug 'lukas-reineke/indent-blankline.nvim' " Indentation Guides

Plug 'NvChad/nvim-colorizer.lua'      " Highlight Tailwind CSS colors

" TailwindCSS Autocompletion

Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'neovim/nvim-lspconfig'

Plug 'roobert/tailwindcss-colorizer-cmp.nvim' " Show colors in preview

Plug 'rafamadriz/friendly-snippets'   " Django Snippets

Plug 'tweekmonster/django-plus.vim'   " Django Template Syntax Highlighting

call plug#end()


" COC CONFIG
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]


" NVIM TREE & NVIM WEB ICONS
lua << EOF
-- Disable netrw (recommended)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Setup nvim-web-devicons
require("nvim-web-devicons").setup({
  override = {
    js = { icon = "", color = "#cbcb41", name = "Js" },
    ts = { icon = "", color = "#519aba", name = "Ts" },
    py = { icon = "", color = "#3572A5", name = "Py" },
    java = { icon = "", color = "#cc3e44", name = "Java" },
    html = { icon = "", color = "#e34c26", name = "Html" },
    css = { icon = "", color = "#563d7c", name = "Css" },
--    json = { icon = "", color = "#cbcb41", name = "Json" },
    lock = { icon = "󰌾", color = "#ff0000", name = "Lock" },
    yml = { icon = "פּ", color = "#6d8086", name = "Yml" },
    yaml = { icon = "פּ", color = "#6d8086", name = "Yaml" },
    txt = { icon = "", color = "#6d8086", name = "Txt" },
    sh = { icon = "", color = "#4d5a5e", name = "Sh" },
    sql = { icon = "", color = "#ffd700", name = "Sql" },
    db = { icon = "", color = "#ffd700", name = "Db" },
    sqlite = { icon = "", color = "#ffd700", name = "Sqlite" },
    sqlite3 = { icon = "", color = "#ffd700", name = "Sqlite3" },
    postgresql = { icon = "", color = "#336791", name = "Postgresql" },
    mysql = { icon = "", color = "#00758f", name = "Mysql" },
    mongodb = { icon = "", color = "#589636", name = "Mongodb" },
    map = { icon = "󰆑", color = "#cbcb41", name = "Map" },
    md = { icon = "󰽛", color = "#519aba", name = "Md" },
  },
  default = true,
})

-- Setup nvim-tree
require("nvim-tree").setup({
  view = {
    width = 30,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
--  filters = {
--    custom = { "^node_modules$" },
--  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
    },
  },
})
EOF

" Keybinding to toggle the file tree
nnoremap <C-b> :NvimTreeToggle<CR>


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


" TELESCOPE
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
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1


" ALE (Asynchronous Lint Engine)
let g:ale_enabled = 1

let g:ale_linters = {
\   'python': ['flake8', 'pylint', 'mypy'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'html': ['htmlhint'],
\   'javascript': ['eslint', 'tsserver'],
\   'typescript': ['eslint', 'tsserver'],
\   'typescriptreact': ['eslint', 'tsserver'],
\   'javascriptreact': ['eslint', 'tsserver'],
\}

let g:ale_fixers = {
\   'python': ['black', 'autopep8'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\   'typescriptreact': ['eslint', 'prettier'],
\   'javascriptreact': ['eslint', 'prettier'],
\}

" Enable fixing on save
let g:ale_fix_on_save = 1

" Set Python linters
let g:ale_python_flake8_options = '--max-line-length=88'
let g:ale_python_pylint_options = '--disable=C0114,C0115,C0116'

" Use globally installed ESLint and Prettier
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_prettier_use_global = 1
let g:ale_javascript_eslint_options = '--config ~/.eslintrc.js'


" TREESITTER
lua << EOF
require('nvim-treesitter.configs').setup({
    ensure_installed = { "python", "javascript", "typescript", "tsx", "lua", "bash", "json", "html", "css" }, -- Add your languages here
    highlight = {
        enable = true, -- Enable syntax highlighting
    },
})
EOF


" TOKYONIGHT COLORSHCEME
lua << EOF
require("tokyonight").setup({
    style = "night",  -- Options: "night", "storm", "day", "moon"
})
EOF

colorscheme tokyonight


" LSP
lua << EOF
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "ts_ls", "html", "cssls", "lua_ls" },
    automatic_installation = true,
})

local lspconfig = require("lspconfig")
local servers = { "pyright", "ts_ls", "html", "cssls", "lua_ls" }

for _, server in pairs(servers) do
    lspconfig[server].setup({
        handlers = {
            ["textDocument/publishDiagnostics"] = function() end,
            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "rounded",
                max_width = 80,
                max_height = 20
            })
        },
        on_attach = function(client, bufnr)
            vim.keymap.set('n', 'K', require("hover").hover, { desc = "hover.nvim" })
            vim.keymap.set('n', 'gK', require("hover").hover_select, { desc = "hover.nvim (select)" })
        end
    })
end

require("hover").setup({
    init = function()
        require("hover.providers.lsp")
        require("hover.providers.gh")
        require("hover.providers.man")
    end,
    preview_opts = {
        border = 'rounded',
        title = true
    }
})

-- Exit hover more easily
vim.keymap.set('n', '<leader>q', function()
    vim.api.nvim_win_close(0, true)
end, { desc = "Close hover window" })

-- Django LSP Setup
lspconfig.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        jedi_completion = { enabled = true },
        jedi_definition = { enabled = true },
        pyflakes = { enabled = true },
        pylint = { enabled = false },  -- Set to true if you want Pylint
        django_lsp = { enabled = true }
      }
    }
  }
}
EOF


" LSP Autocompletion
lua << EOF
local cmp = require("cmp")
cmp.setup({
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
})
EOF


" COMMENTS NVIM
lua << EOF
require('Comment').setup()
EOF

" Map Ctrl + / to comment a line in Normal mode
nnoremap <C-/> :lua require('Comment.api').toggle.linewise.current()<CR>

" Map Ctrl + / to comment selected lines in Visual mode
vnoremap <C-/> :lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>

" Map Ctrl + / to comment the current line in Insert mode
inoremap <C-/> <Esc>:lua require('Comment.api').toggle.linewise.current()<CR>gi


autocmd CursorHold * lua vim.lsp.buf.hover()
set updatetime=1000  " Reduce delay for hover popup (default is 4000ms)


lua << EOF
require("lspsaga").setup({})
EOF


" INDENT-BLACKLINE
lua << EOF
require("ibl").setup {
    indent = { char = "│" },  -- Use the vertical line character
    scope = { show_start = false, show_end = false } -- Remove underline under parent
}
EOF


" NVIM-COLORIZER
lua require'colorizer'.setup()


" TailwindCSS Autocompletion
lua << EOF
require'lspconfig'.tailwindcss.setup{}
EOF


" TAILWINDCSS-COLORIZER-CMP
lua require'tailwindcss-colorizer-cmp'.setup()


" Enable Tab to navigate completion
lua << EOF
local cmp = require'cmp'
cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Esc>'] = cmp.mapping.close(),
  },
})
EOF


" FRIENDLY-SNIPPETS
lua << EOF
require("luasnip.loaders.from_vscode").lazy_load()
EOF


" DJANGO-PLUS
autocmd BufNewFile,BufRead *.html set filetype=htmldjango
