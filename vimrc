set ic
set incsearch
set shell=\"cmd.exe\"   
set softtabstop=2
set expandtab
set nu
set smartcase
set scrolloff=2
"set nowrap
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set guifont=Courier
set gfn=Envy_Code_R:h12:cANSI
set ts=2
set sw=2
set sts=4
syntax on
set path=\"c:\program\ files\"
au GUIEnter * simalt ~x
colorscheme pablo

" Enable for spell check
" setlocal spell spelllang=en_us

"set viminfo='50,<1000,s100,n~/vim/viminfo

set softtabstop=2
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt
map <C-5> 5gt
map <C-n> :tabn<CR>
map <C-p> :tabp<CR>
map <C-t> :tabnew<CR>
map <C-]>:tab split<CR>gT:q<CR>gt 
map <C-tab> :tabp<CR>

" the backup extension

" the backup directories
set nobackup

" display incomplete commands
set showcmd
set incsearch

"Tag files
set tags=$VIM/tagfiles/fulltagfile shiftwidth=2 omnifunc=cppomnicomplete#Complete

source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
source $VIMRUNTIME/macros/matchit.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" To open new files in a tab
" autocmd VimEnter * tab all
" autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"' 
