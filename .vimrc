"                 88
"                 ''
"    8b       d8  88  88,dPYba,,adPYba,   8b,dPPYba,   ,adPPYba,
"    `8b     d8'  88  88P'   '88'    '8a  88P'   'Y8  a8'     ''
"     `8b   d8'   88  88      88      88  88          8b
" 888  `8b,d8'    88  88      88      88  88          '8a,   ,aa
" 888    '8'      88  88      88      88  88           `'Ybbd8''

" ================================= PLUGINS ================================== "

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'rakr/vim-one'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ctrlp/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'wincent/terminus'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ap/vim-css-color'
Plugin 'junegunn/goyo.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on

" ================================= SETTINGS ================================= "

" ---------------------------------- Basics ---------------------------------- "

set encoding=utf8
syntax on

" Relative line numbering
set number
set rnu

" Tab settings
set shiftwidth=4
set tabstop=4

" Split below and to the right
set splitbelow
set splitright

" Show tab indentations and trailing spaces
set list
set listchars=tab:\|\ ,trail:•

" Show statusbar
set laststatus=2

" Hide buffers
set hidden

" Auto-read file when changed from outside
set autoread

" Show current command
set showcmd

" Highlight current line
set cursorline

" Highlight column 80
set colorcolumn=80

" Centralize swapfiles and backups (Make sure the directories exist!)
set directory=~/.vim/swaps//
set backupdir=~/.vim/backups//

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Enable mouse for focusing, selecting and scrolling
" (hold alt/option in iTerm2 to disable temporarily)
set mouse=a

" Only show cursorline in current window
augroup cursorline
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END

" ---------------------------------- Colors ---------------------------------- "

" Enable true colors
set t_Co=256

if (has("termguicolors"))
	set termguicolors
endif

let &t_8f = "[38;2;%lu;%lu;%lum"
let &t_8b = "[48;2;%lu;%lu;%lum"

" Colorscheme
set background=dark
colorscheme one

" --------------------------------- Plugins ---------------------------------- "

" vim-airline/vim-airline
let g:airline_section_z = '%l:%c'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'one'
let g:airline#extensions#tabline#enabled = 0

" ctrlp/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_show_hidden = 1

" scrooloose/nerdtree
let g:NERDTreeShowHidden = 1

" tiagofumo/vim-nerdtree-syntax-highlight
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeLimitedSyntax = 1

" ryanoasis/vim-devicons
let g:WebDevIconsNerdTreeAfterGlyphPadding = '' " Better alignment
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:DevIconsEnableFoldersOpenClose = 1 " Causes padding issues
" execute webdevicons#hardRefresh()

" ================================= BINDINGS ================================= "

" ---------------------------------- Basics ---------------------------------- "

map <silent> <C-n> :NERDTreeFocus<CR>

" Window navigation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-ö> :TmuxNavigatePrevious<cr>

" Multiple cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" ---------------------------------- Leader ---------------------------------- "

let mapleader=","

nmap <leader>q :q<cr>
nmap <leader>d :bd<cr>
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader>et :tabedit ~/.tmux.conf<cr>

" Find in files (type search term, change **, run the command and then :lw)
nmap <leader>f :lvimgrep //gj **<Left><Left><Left><Left><Left><Left>

" tpope/vim-fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gw :Gbrowse<cr>
nmap <leader>hn <Plug>GitGutterNextHunk
nmap <leader>hp <Plug>GitGutterPrevHunk
nmap <leader>hs <Plug>GitGutterStageHunk
nmap <leader>hu <Plug>GitGutterUndoHunk
nmap <leader>hv <Plug>GitGutterPreviewHunk

" junegunn/goyo.vim
nnoremap <leader>z :Goyo<cr>

" ------------------------------- Text objects ------------------------------- "

omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

" ============================ SESSION MANAGEMENT ============================ "

" function! MakeSession()
" 	let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
" 	if (filewritable(b:sessiondir) != 2)
" 		exe 'silent !mkdir -p ' b:sessiondir
" 		redraw!
" 	endif
" 	let b:filename = b:sessiondir . '/session.vim'
" 	exe "mksession! " . b:filename
" endfunction

" function! LoadSession()
" 	let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
" 	let b:sessionfile = b:sessiondir . "/session.vim"
" 	if (filereadable(b:sessionfile))
" 		exe 'source ' b:sessionfile
" 	else
" 		echo "No session loaded."
" 	endif
" endfunction
" au VimEnter * nested :call LoadSession()
" au VimLeave * :call MakeSession()

" ======================== AUTO-SOURCE .VIMRC ON SAVE ======================== "

augroup autosourcing
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
