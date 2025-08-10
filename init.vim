" BASE SETTINGS
let mapleader = "\<Space>"

" Line Numbers set number
set number
set relativenumber
set cursorline

" Display, indentation and Wrapping
set autoindent
set smarttab
set cindent
set textwidth=80
set cmdheight=2
set wrap
set linebreak
set termguicolors
set scrolloff=8
set colorcolumn=80
set signcolumn=yes

" Performance
set shortmess+=c

" Files
set nobackup
set nowritebackup
set noswapfile
let &undodir = expand("$HOME/.vim/undodir")
set undofile
set isfname+=@-@

" Search
set hidden
set incsearch
set nohlsearch

" Syntax
syntax on

" Color Scheme
" colorscheme habamax

" Filetype Specific Settings 
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType html,css,javascript,typescript,typescriptreact,javascriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab


"SYSTEM REMAPS
" Exit mode with 'j+k'
inoremap jk <ESC>l       " Works in insert mode"
vnoremap jk <ESC>l       " Works in Visual Mode
tnoremap jk <C-\><C-n>  " Works in Terminal Mode 

nnoremap K :lua require("hover").hover()<CR>
nnoremap gK :lua require("hover").hover_select()<CR>
nnoremap <leader>d :lua require("hover.providers.dictionary").hover()<CR>

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
nnoremap <C-p> :belowright split<CR>:terminal<CR>

" Remap terminal exit shortcut
tnoremap <Esc> <C-\><C-n>

" Resize splits using Shift + Arrow keys
nnoremap <S-Left>  :vertical resize -5<CR>
nnoremap <S-Right> :vertical resize +5<CR>
nnoremap <S-Up>    :resize +5<CR>
nnoremap <S-Down>  :resize -5<CR>

" Browser-sync (works like live server)
nnoremap <leader>bs :!browser-sync start --server --files "*.html, css/*.css, js/*.js" &<CR>

" Move highlighted block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keeps cursor at line start 
nnoremap J mzJ`z

" Keeps cursor centered on the screen
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap n nzzzv
nnoremap N Nzzzv

" Pastes the yanked text over the highlighted one without the highlighted one storing in the buffer
xnoremap <leader>p "_dP

" Seperate vim clipboard and system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

" Open a new tmux session silently
nnoremap <C-f> :silent !tmux neww tmux-sessionizer<CR>

" Disable the Q command
nnoremap Q <nop>

" Format using LSP
nnoremap <leader>f :lua vim.lsp.buf.format()<CR>

" initiates a search-and-replace operation in the whole file
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left>


" PLUGINS
call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'nvim-tree/nvim-tree.lua'        " File tree
Plug 'nvim-tree/nvim-web-devicons'    " Icons
Plug 'airblade/vim-gitgutter'         " Displays git diff markers in the gutter
Plug 'preservim/nerdcommenter'        " Enables quick commenting in code
Plug 'christoomey/vim-tmux-navigator' " Navigation between Vim and Tmux splits 
Plug 'nvim-lua/plenary.nvim'          " Lua utility library
Plug 'nvim-lua/popup.nvim'            " Popup API for Neovim
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' } " Fuzzy File Finder
Plug 'vim-airline/vim-airline'        " Status bar customization
Plug 'vim-airline/vim-airline-themes' " Vim Airline themes
Plug 'dense-analysis/ale'             " Linting Engine
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax Highlighting
Plug 'folke/tokyonight.nvim'          " Tokyonight colorscheme
Plug 'tpope/vim-fugitive'             " Git Wrapper Plugin
Plug 'neovim/nvim-lspconfig'          " Core LSP support
Plug 'mason-org/mason.nvim'           " Easy LSP installation
Plug 'mason-org/mason-lspconfig.nvim' " Bridge between Mason and lspconfig
Plug 'hrsh7th/nvim-cmp'               " Core autocompletion engine
Plug 'hrsh7th/cmp-nvim-lsp'           " Integrates nvim-cmp with Neovim's built-in LSP
Plug 'hrsh7th/cmp-buffer'             " Buffer completion
Plug 'hrsh7th/cmp-path'               " Path completion
Plug 'saadparwaiz1/cmp_luasnip'       " Snippet completion
Plug 'L3MON4D3/LuaSnip'               " Snippet engine
Plug 'glepnir/lspsaga.nvim'           " UI Enhancements for LSP
Plug 'lewis6991/hover.nvim'           " Add hover properties
Plug 'lukas-reineke/indent-blankline.nvim' " Indentation Guidelines
Plug 'NvChad/nvim-colorizer.lua'      " Highlight colors
Plug 'roobert/tailwindcss-colorizer-cmp.nvim' " Show TailwindCSS colors in preview
Plug 'rafamadriz/friendly-snippets'   " Django Snippets
Plug 'tweekmonster/django-plus.vim'   " Django Template Syntax Highlighting
Plug 'ThePrimeagen/harpoon'           " Harpoon File Navigator
Plug 'mbbill/undotree'                " Undo Tree
Plug 'ThePrimeagen/vim-be-good'       " Vim Practice Game
Plug 'github/copilot.vim'	      " AI Copilot
Plug 'CopilotC-Nvim/CopilotChat.nvim' " Copilot Chat integration
Plug 'MeanderingProgrammer/render-markdown.nvim' " Render markdown syntax
Plug 'code-biscuits/nvim-biscuits'    " Show code context in the gutter
Plug 'epwalsh/obsidian.nvim'          " Obsidian integration for Neovim
Plug 'stevearc/conform.nvim'	      " Code formatting plugin
Plug 'folke/zen-mode.nvim'	      " Zen mode
Plug 'folke/twilight.nvim'	      " Dim inactive portions of the code
Plug 'folke/todo-comments.nvim'	      " Highlight TODO comments
Plug 'jiangmiao/auto-pairs'	      " Auto close pairs like brackets, quotes, etc.
Plug 'mracos/mermaid.vim'		" Render mermaid syntax in neovim
Plug '3rd/image.nvim', { 'do': 'make' }   " render images in terminal buffers
Plug '3rd/diagram.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug '0x100101/lab.nvim', { 'do': 'cd js && npm ci' }

call plug#end()


"NVIM TREE
lua << EOF
require("nvim-tree").setup({
  view = {
    width = 30,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
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

nnoremap <C-b> :NvimTreeToggle<CR>


" NVIM WEB ICONS
lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-web-devicons").setup({
  override = {
    js = { icon = "", color = "#cbcb41", name = "Js" },
    ts = { icon = "", color = "#519aba", name = "Ts" },
    css = { icon = "", color = "#336791", name = "Css" },
    py = { icon = "", color = "#3572A5", name = "Py" },
    java = { icon = "", color = "#cc3e44", name = "Java" },
    lock = { icon = "󰌾", color = "#ff0000", name = "Lock" },
    yml = { icon = "פּ", color = "#6d8086", name = "Yml" },
    yaml = { icon = "פּ", color = "#6d8086", name = "Yaml" },
    sh = { icon = "", color = "#4d5a5e", name = "Sh" },
    sql = { icon = "", color = "#ffd700", name = "Sql" },
    db = { icon = "", color = "#ffd700", name = "Db" },
    sqlite = { icon = "", color = "#ffd700", name = "Sqlite" },
    sqlite3 = { icon = "", color = "#ffd700", name = "Sqlite3" },
    postgresql = { icon = "", color = "#336791", name = "Postgresql" },
    mysql = { icon = "", color = "#00758f", name = "Mysql" },
    mongodb = { icon = "", color = "#589636", name = "Mongodb" },
    map = { icon = "󰆑", color = "#cbcb41", name = "Map" },
  },
  default = true,
})
EOF


" TELESCOPE
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


" VIM-AIRLINE
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
    ensure_installed = { "python", "javascript", "typescript", "tsx", "lua", "bash", "json", "html", "css", "markdown", "markdown_inline" },
    highlight = {
        enable = true, 
    },
})
EOF


" TOKYONIGHT COLORSHCEME
lua << EOF
require("tokyonight").setup({
    style = "night",  -- Options: "night", "storm", "day", "moon"
    transparent = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent",
    },
})

-- Ensure background transparency for UI elements
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
EOF

colorscheme tokyonight


" MASON
lua << EOF
require("mason").setup()


-- MASON-LSP
require("mason-lspconfig").setup {
    ensure_installed = { "pyright", "ts_ls", "html", "cssls", "lua_ls", "vimls" },
    automatic_installation = false,
}

local lspconfig = require("lspconfig")
local servers = { "pyright", "ts_ls", "html", "cssls", "lua_ls", "vimls" }

for _, server in ipairs(servers) do
  require("lspconfig")[server].setup {
        handlers = {
            ["textDocument/publishDiagnostics"] = function() end,
            ["textDocument/hover"] = function() end,
        },
    }
end

-- Python LSP Setup
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

-- LSP Autocompletion
local cmp = require("cmp")
cmp.setup({
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
	['<Tab>'] = cmp.mapping.select_next_item(),
    	['<S-Tab>'] = cmp.mapping.select_prev_item(),
    	['<Esc>'] = cmp.mapping.close(),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
	{ name = "path" },
        { name = "buffer" },
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
})
EOF

"autocmd CursorHold * lua vim.lsp.buf.hover()
"set updatetime=5000  " Reduce delay for hover popup


" LSPSAGA
lua << EOF
require("lspsaga").setup({})
EOF


" HOVER NVIM
lua << EOF
require("hover").setup {
            init = function()
                -- Require providers
                require("hover.providers.lsp")
                -- require('hover.providers.gh')
                -- require('hover.providers.gh_user')
                -- require('hover.providers.jira')
                -- require('hover.providers.dap')
                -- require('hover.providers.fold_preview')
                -- require('hover.providers.diagnostic')
                -- require('hover.providers.man')
                require('hover.providers.dictionary')
                -- require('hover.providers.highlight')
            end,
            preview_opts = {
                border = 'rounded'
            },
            -- Whether the contents of a currently open hover window should be moved
            -- to a :h preview-window when pressing the hover keymap.
            preview_window = false,
            title = true,
            mouse_providers = {
                'LSP'
            },
            mouse_delay = 000
}
EOF


" INDENT-BLACKLINE
lua << EOF
require("ibl").setup {
    indent = { char = "│" },
    scope = { show_start = false, show_end = false }
}
EOF


" NVIM-COLORIZER
lua <<EOF
require'colorizer'.setup()
EOF


" TailwindCSS Autocompletion
lua << EOF
require'lspconfig'.tailwindcss.setup{}
EOF


" TAILWINDCSS-COLORIZER-CMP
lua <<EOF
require'tailwindcss-colorizer-cmp'.setup()
EOF


" FRIENDLY-SNIPPETS
lua << EOF
require("luasnip.loaders.from_vscode").lazy_load()
EOF


" HARPOON
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>e :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>


" UNDOTREE
let g:undotree_SetFocusWhenToggle = 1
nnoremap <leader>u :UndotreeToggle<CR>


" GITHUB COPILOT
let g:copilot_enabled = v:true


" RENDER MARKDOWN
autocmd BufReadPost *.md :RenderMarkdown


" NVIM BISCUITS
lua <<EOF
require("nvim-biscuits").setup({
  default_config = {
    max_length = 50,
    min_distance = 5,
    prefix_string = " ⤷ ",
  },
  cursor_line_only = true,
})
EOF


" COPILOT CHAT
lua << EOF
require("CopilotChat").setup {
	 window = {
    layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace', or a function that returns the layout
    width = 0.3, -- fractional width of parent, or absolute width in columns when > 1
    height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
    -- Options below only apply to floating windows
    relative = 'win', -- 'editor', 'win', 'cursor', 'mouse'
    border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
    row = nil, -- row position of the window, default is centered
    col = nil, -- column position of the window, default is centered
    title = 'Copilot Chat', -- title of chat window
    footer = nil, -- footer of chat window
    zindex = 1, -- determines if window is on top or below other floating windows
  },
	 prompts = {
    Explain = {
      prompt = 'Write an explanation for the selected code as paragraphs of text.',
      system_prompt = 'COPILOT_EXPLAIN',
    },
    Review = {
      prompt = 'Review the selected code.',
      system_prompt = 'COPILOT_REVIEW',
    },
    Fix = {
      prompt = 'There is a problem in this code. Identify the issues and rewrite the code with fixes. Explain what was wrong and how your changes address the problems.',
    },
    Optimize = {
      prompt = 'Optimize the selected code to improve performance and readability. Explain your optimization strategy and the benefits of your changes.',
    },
    Docs = {
      prompt = 'Please add documentation comments to the selected code.',
    },
    Tests = {
      prompt = 'Please generate tests for my code.',
    },
    Commit = {
      prompt = 'Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block.',
      context = 'git:staged',
    },
  },
}
EOF


" OBSIDIAN NVIM
autocmd BufRead,BufNewFile ~/Desktop/sftw/obsidian/*/*.md setlocal conceallevel=2
nnoremap <leader>op :lua require("obsidianPreview").preview_link()<CR>

lua << EOF
require("obsidian").setup({
  workspaces = {
    {
      name = "gaitanos_mind",
      path = "~/Desktop/sftw/obsidian/gaitanos_mind",
    },
  }
})
EOF


" CONFORM
lua << EOF
require("conform").setup({
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
  formatters_by_ft = {
    javascript      = { "prettier" },
    javascriptreact = { "prettier" },
    typescript      = { "prettier" },
    typescriptreact = { "prettier" },
    mjs             = { "prettier" },
    css             = { "prettier" },
    less            = { "prettier" },
    scss            = { "prettier" },
    json            = { "prettier" },
    graphql         = { "prettier" },
    markdown        = { "prettier" },
    vue             = { "prettier" },
    yaml            = { "prettier" },
    html            = { "prettier" },
  },
})
EOF


" ZEN MODE
nnoremap <leader>z :lua require("zen-mode").toggle()<CR>

lua << EOF
require("zen-mode").setup({
  window = {
    width = .5
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
      laststatus = 0, -- turn off the statusline in zen mode
    },
    twilight = { enabled = false },
    gitsigns = { enabled = false },
    tmux = { enabled = false },
    todo = { enabled = false },
    kitty = {
      enabled = false,
      font = "+5",
    },
  }
})
EOF


" TWILIGHT
nnoremap <leader>t :lua require("twilight").toggle()<CR>

lua << EOF
require("twilight").setup({
  dimming = {
    alpha = 0.50,
    color = { "Normal", "#ffffff" }, -- fallback color
  },
  context = 20,
  treesitter = true, -- use Treesitter when available
  expand = {
    "function",
    "method",
    "table",
    "if_statement",
  },
  exclude = {},
})
EOF


" TODO COMMENTS
lua << EOF
require("todo-comments").setup {
  signs = true,
  sign_priority = 8,
  keywords = {
    FIX = {
      icon = " ",
      color = "error",
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
  gui_style = {
    fg = "NONE",
    bg = "BOLD",
  },
  merge_keywords = true,
  highlight = {
    multiline = true,
    multiline_pattern = "^.",
    multiline_context = 10,
    before = "",
    keyword = "wide",
    after = "fg",
    pattern = [[.*<(KEYWORDS)\s*:]],
    comments_only = true,
    max_line_len = 400,
    exclude = {},
  },
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
    info = { "DiagnosticInfo", "#2563EB" },
    hint = { "DiagnosticHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
    test = { "Identifier", "#FF00FF" },
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    pattern = [[\b(KEYWORDS):]],
  },
}
EOF
