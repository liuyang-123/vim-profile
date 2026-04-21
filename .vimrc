set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'mkitt/tabline.vim'
Plugin 'kshenoy/vim-signature'

" Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

packadd! matchit
syntax on
" colorscheme koehler
" highlight Title ctermfg=Green guifg=Green
" highlight Underlined ctermbg=DarkGray ctermfg=Black gui=bold
" highlight CursorLine ctermbg=DarkGreen ctermfg=Black guibg=#000050 guifg=fg
set nu
set showmode
set cursorline
set ruler
set showcmd
set wildmenu
set hlsearch
set incsearch
set smartindent
set autowriteall
set statusline+=%F
set backspace=indent,eol,start
set viminfo='30
set maxmempattern=2000000
set showmode

" by default, the indent is 4 spaces.
set shiftwidth=4
set softtabstop=4
set tabstop=4
" for xml files, 2 spaces
autocmd Filetype xml setlocal ts=2 sw=2 expandtab

set fileformat=unix
set selectmode+=mouse

" custom shortcuts
noremap <Leader><Leader>v <C-v>
noremap H ^
noremap L $
cnoremap <C-p> <C-r>0

" same to copying/pasting/selecting shortcuts of windows
noremap <C-c> "+y
noremap <C-v> "+p
inoremap <C-v> <Esc>"+pgaa
cnoremap <C-v> <C-r>+

" Convert camel case to snake case
noremap <Leader>cs :s/\(\<\u\l\+\\|\l\+\)\(\u\)/\l\1_\l\2/g<CR>
" Convert snake case to camel case
noremap <Leader>sc :s#_\(\l\)#\u\1#g<CR>

" 插入模式下的 CTRL-U 删除当前行所有输入的文本。使用 CTRL-G u 会先打断撤销，这样你可以在插入换行符后撤销 CTRL-U。
inoremap <C-U> <C-G>u<C-U>

" inoremap <C-space> <C-p>
" inoremap ,/ </<C-X><C-O>

noremap <Leader><Leader>d "=strftime("%Y-%m-%d %A")<CR>Po

noremap gs <Plug>(easymotion-s)
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First ErrorMsg
hi link EasyMotionTarget2Second ErrorMsg

set sessionoptions-=options
set sessionoptions+=unix,slash

if has("gui_running")
  if has("gui_win32")
	set guifont=Courier_New:h12:cANSI
	set guitablabel=%N\ %t
  endif
endif

" Use a vertical bar cursor in Insert mode, block in Normal mode
if &term =~ 'xterm-256color' || &term =~ 'screen-256color'
    let &t_SI = "\<Esc>[5 q" " Insert mode: blinking beam
    let &t_SR = "\<Esc>[3 q" " Replace mode: blinking underline
    let &t_EI = "\<Esc>[1 q" " Normal mode: blinking block
endif

" Ensure it resets on exit
autocmd VimLeave * silent !echo -ne "\e[1 q"
