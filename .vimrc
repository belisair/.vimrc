" plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'
Plug 'vim-scripts/indentpython.vim'
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'godlygeek/tabular'
call plug#end()

filetype plugin indent on
syntax on

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

"Set mapleader
let mapleader=','                           "Replace escape char by ,

""Source the vimrc file after saving it
if has("autocmd")
autocmd bufwritepost .vimrc source $MYVIMRC 
endif 
nmap <leader>v :tabedit $MYVIMRC<CR>

"Always show the status bar
set laststatus=2

"Enable 256 colors
set t_Co=256
set t_ut=

"File encoding
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix

"Editing setup
set nu                                     "Set numbers on line
set nosol                                  "Avoid going to first column
set tabstop=4 shiftwidth=4 expandtab       "Set tab eq 4 space

"Disable backup
set nobackup
set nowritebackup
set noswapfile

" Comment/Uncomment
vnoremap cp :norm i#<CR>gv
vnoremap cs :norm i--<CR>gv
vnoremap up :norm ^x<CR>gv
vnoremap us :norm ^xx<CR>gv

"Shortcut to paste without changing registery
vmap <Leader>p "0p<CR>    

"Open NERDTree and tagbar
nmap <Leader>nt :NERDTree<CR>
nmap <Leader>tb :TagbarToggle<CR>

" ale
map <C-e> <Plug>(ale_next_wrap)
map <C-r> <Plug>(ale_previous_wrap)

" Press two time leader to exit mod (avoid leaving keyboard) nnoremap <Leader><Leader> <Esc> vnoremap <Leader><Leader> <Esc>gV onoremap <Leader><Leader> <Esc> inoremap <Leader><Leader> <Esc>`^

" tab navigation like firefox
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap to  :tabnew<CR>

" Press two time leader to exit mod (avoid leaving keyboard) nnoremap <Leader><Leader> <Esc> vnoremap <Leader><Leader> <Esc>gV onoremap <Leader><Leader> <Esc> inoremap <Leader><Leader> <Esc>`^

"Tabulize based on symbole
vmap <Leader>l= :Tabularize /=<CR>
vmap <Leader>l: :Tabularize /:\zs<CR>
vmap <Leader>ll :Tabularize /<Bar><CR>

" Move block code
vnoremap < <gv
vnoremap > >gv

" mouse
" set mouse=a
" let g:is_mouse_enabled = 1
" noremap <silent> <Leader>m :call ToggleMouse()<CR> " function ToggleMouse()
"     if g:is_mouse_enabled == 1
"         echo "Mouse OFF"
"         set mouse=
"         let g:is_mouse_enabled = 0
"     else
"         echo "Mouse ON"
"         set mouse=a
"         let g:is_mouse_enabled = 1
"     endif
" endfunction

" color scheme
syntax on
colorscheme onedark
filetype on
filetype plugin indent on

" lightline
set noshowmode
let g:lightline = { 'colorscheme': 'onedark' }

" code folding
set foldmethod=indent
set foldlevel=99

nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(-1)
