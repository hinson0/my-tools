" ===== 基础显示 =====
set number              " 显示行号
set cursorline          " 高亮当前行

" ===== 编辑体验 =====
set tabstop=2
set shiftwidth=2
set expandtab           " tab 转空格
set smartindent

" ===== 搜索 =====
set ignorecase
set smartcase
set incsearch
set hlsearch

" ===== 撤销持久化（非常重要） =====
set undofile
set undodir=~/.vim/undo//

" ===== 剪贴板（和系统互通） =====
set clipboard=unnamedplus

" ===== 其他小但实用 =====
set nowrap              " 不自动换行（看日志更舒服）
set scrolloff=5

" json
syntax on
filetype plugin indent on

" JSON 文件设置
autocmd FileType json setlocal tabstop=2
autocmd FileType json setlocal shiftwidth=2
autocmd FileType json setlocal expandtab
autocmd FileType json setlocal autoindent
autocmd FileType json setlocal smartindent
