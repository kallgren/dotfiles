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
Plugin 'tpope/vim-fireplace'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'wincent/terminus'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ap/vim-css-color'
Plugin 'junegunn/goyo.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'mxw/vim-jsx'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'lervag/vimtex'
Plugin 'guns/vim-clojure-static'
Plugin 'posva/vim-vue'
Plugin 'wavded/vim-stylus'

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

" Show ruler (see rulerformat)
set ruler

" Show statusbar when more than one window
set laststatus=1

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
colorscheme kallgren

" -------------------------------- Cursorline -------------------------------- "

" Change color based on mode
function! CursorLineColor(mode)
  if a:mode == 'i'
    return g:base16_gui0Dt
  elseif a:mode == 'r'
    return g:base16_gui08t
  else
    return g:base16_gui01
  endif
endfunction

au! InsertEnter
au! InsertLeave
au InsertEnter * execute 'hi CursorLine guibg=#' . CursorLineColor(v:insertmode)
au InsertLeave * execute 'hi CursorLine guibg=#' . g:base16_gui01

" -------------------------------- Statusline -------------------------------- "

" Returns current git branch (if the active file is in a git repository)
function! GetGitBranch()
	if exists('*fugitive#head')
		let head = fugitive#head()

		if empty(head) && exists('*fugitive#detect') && !exists('b:git_dir')
			call fugitive#detect(getcwd())
			let head = fugitive#head()
		endif

		if !empty(head)
			return ' ' . head
		endif
	endif

	return ''
endfunction

" Left
set statusline=%<%f\ %{WebDevIconsGetFileTypeSymbol()}\  " Relative file path

set statusline +=%h " Help buffer flag
set statusline +=%w " Preview window flag
set statusline +=%m " Modified flag
set statusline +=%r " Readonly flag
set statusline +=\  " Space

" Syntastic statusline (TODO: Fix background color)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*\ 

" Space
set statusline +=%=

" Right
set statusline +=%{GetGitBranch()}\  " Git branch
set statusline +=%9.(%l,%c%) " Line and column number (9 char width)

" Ruler (for when statusline is hidden)
set rulerformat=%= " Align right
set rulerformat +=%{GetGitBranch()}\  " Git branch
set rulerformat +=%l,%c " Line and column number

" --------------------------------- Plugins ---------------------------------- "

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
execute webdevicons#hardRefresh()

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

" Toggles between laststatus 1 and 2
let s:show_statusline = 0
function! ToggleStatusLine()
    if s:show_statusline == 0
        let s:show_statusline = 1
        set laststatus=2
    else
        let s:show_statusline = 0
        set laststatus=1
    endif
endfunction

let mapleader=","

nmap <leader>q :q<cr>
nmap <leader>d :bd<cr>
nmap <leader>t :tabnew<cr>
" nmap <Leader>s :let &laststatus = ( &laststatus == 1 ? 2 : 1 )<CR>
nmap <leader>s :call ToggleStatusLine()<cr>
nmap <Leader>bl :set background=light<CR>:colorscheme kallgren<CR>
nmap <Leader>bk :set background=dark<CR>:colorscheme kallgren<CR>

" Check/uncheck todo-list items
nmap <leader>x mm_rx`m
nmap <leader>- mm_r-`m

" Open .vimrc (Bypass symlink to make fugitive work properly)
nmap <leader>ev :execute 'tabedit ' . resolve(expand($MYVIMRC))<cr>

" Open .tmux.conf
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

" scrooloose/nerdtree
map <leader>n :NERDTreeFind<cr>

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
	autocmd BufWritePost *vimrc source $MYVIMRC
augroup END
