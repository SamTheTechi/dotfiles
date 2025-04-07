set nocompatible
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
syntax on
set mouse=a
set clipboard=unnamedplus

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', {'do': './install --all'}
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'vim-airline/vim-airline'

call plug#end()

let g:catppuccin_flavour = "mocha"

nnoremap <C-\> :NERDTreeToggle<CR>  " Toggle NERDTree
nnoremap <C-p> :Files<CR>           " Fuzzy find files
nnoremap <Leader>r :Rg<Space>  
