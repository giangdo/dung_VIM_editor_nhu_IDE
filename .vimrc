set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
" Plugin 'gmarik/vundle'

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'

" plugin to help me search file quickly
Plugin 'kien/ctrlp.vim'

"to tab efficiency
Plugin 'godlygeek/tabular'

" To use taglist
Plugin 'tisyang/taglist'

"To use the_silver_searcher (ag)
Plugin 'rking/ag.vim'

"To do ag search in normal mode"
Plugin 'chun-yang/vim-action-ag'

"Solarized color
Plugin 'altercation/vim-colors-solarized.git'

"Enhance c/c++ highligh syntax
" this plugin make vim slow -> disable this plugin
" about syntax highlight: there are some idea say that it is really painful for professional guys read code
" reference: http://www.linusakesson.net/programming/syntaxhighlighting/
" if you want, you can try to use: https://github.com/xolox/vim-easytags
" or use :
" http://stackoverflow.com/questions/736701/class-function-names-highlighting-in-vim
" or use:
" http://www.cgtk.co.uk/vim-scripts/taghighlight
"Plugin 'octol/vim-cpp-enhanced-highlight'

"Directory diff plugin:
Plugin 'will133/vim-dirdiff'

"ingo-library for AdvancedDiffOptions plugin
Plugin 'vim-scripts/ingo-library'

"AdvancedDiffOptions plugin
Plugin 'vim-scripts/AdvancedDiffOptions'

"Manage three-way merges
Plugin 'sjl/splice.vim'

" This Plugin is used for debug vim only
"Plugin 'vim-scripts/SyntaxAttr.vim'

"Get current mecurial branch in status line
"Plugin 'vim-scripts/hgrev'

"Mecurial in vim
Plugin 'ludovicchabant/vim-lawrencium'

"Git in vim
Plugin 'tpope/vim-fugitive'

"Smart-tabs, There is a bug in in this script and It can be fix following "http://vim.wikia.com/wiki/Script:231"
"do not use original 'vim-scripts/Smart-Tabs', use fixed version instead:
Plugin 'dpc/vim-smarttabs'

"AsyncCommand -> execute shell commands without waiting for them to complete,
"need to run vim with command: $ vim --servername vim
"Plugin 'idbrii/AsyncCommand'

"Make vimdiff better
Plugin 'vim-scripts/diffchar.vim'

"Plugin to help write fish script
Plugin 'dag/vim-fish'

"Plugin to help Highlighting qml resource file syntax"
Plugin 'peterhoeg/vim-qml'

"Plugin for motions based on indent depths or levels it is really good for browsing python or html source code"
Plugin 'jeetsukumaran/vim-indentwise'

"Plugin for see man page in vim:
Plugin 'nhooyr/neoman.vim'

"Plugin to show tabnumber in tabline -> jump between tab by "number+gt" easily
Plugin 'mkitt/tabline.vim'

" all plugins that are not appear in github, should appear in your git repo"
" And we need to commit add plugins in that local git repo before run
" VundleInstall
"Plugin 'file:///home/giang/.vim/myPlugin'
Plugin 'giangdo/vimPlugin'

call vundle#end()
" Now we can turn our filetype functionality back on
filetype plugin on

if has('gui_running')
"SET UP FOR GVIM
   set guioptions-=m  "remove menu bar
   set guioptions-=T  "remove toolbar
   set guioptions-=r  "remove right-hand scroll bar
   set guioptions-=L  "remove left-hand scroll bar
   set guifont=Droid\ Sans\ Mono\ 11

   map <silent> <F11>
            \    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

   " MAP SHORTCUT KEY FOR MANIPULATE X-11 BUFFER
   vnoremap <C-Insert> "+y
   noremap <S-Insert> "+gP
   imap <S-Insert> <C-r><C-p>+

   " SET FOR CURRENT SOURCE CODE DIRECTORY
   cd /home/giang/code

   " SET FOR AUTOMAXIMIZE WHEN OPEN GVIM WINDOW
   set lines=999 columns=999

   " SET UP TO SAVE BUFFER BY HOT KEY
   nmap <silent> <C-s> :w<CR>
   imap <C-s> <C-[>:w<CR>

   "SET GUICURSOR COLOR AND SHAPE
   " to know the current config of guicursor:
   " set guicursor
   " to make guicursor become default value:"
   set guicursor&
   set guicursor-=i-ci:ver25-Cursor/lCursor
   highlight aCursor guifg=NONE guibg=Green
   highlight bCursor guifg=NONE guibg=Yellow
   set guicursor+=i-ci:ver25-aCursor/bCursor

else
"SET UP FOR XTERM
" if $COLORTERM != 'gnome-terminal'
"      if &term =~ '^xterm'
"         "SET CURSOR SHAPE, http://vim.wikia.com/wiki/Configuring_the_cursor
"         " blinking vertial bar
"         let &t_SI .= "\<Esc>[6 q"
"         "       " solid block
"         let &t_EI .= "\<Esc>[2 q"
"         " 1 or 0 -> blinking block
"         " 3 -> blinking underscore
"         " Recent versions of xterm (282 or above) also
"         " support
"         " 4 -> solid underscore
"         " 5 -> blinking vertical bar
"         " 6 -> solid vertical bar
"
"         "SET UP FOR DISPLAY NERDTREE ARROW, BECAUSE XTERM CAN NOT DISPLAY UNICODE SYMBOL WELL
"         use "+" and "-" character instead of arrow to specify folder in nerdtree window
"         let g:NERDTreeDirArrows=0 
"      endif
"   endif
endif

"SETUP FOR hgrev PLUGIN
let g:hgrevFlags = '-nbtB'
let g:hgrevAddStatus = 0
let g:hgrevAutoUpdate = 0
let g:hgrevNoRepoChar = ''

"SETUP FOR lawrencium PLUGIN
let g:lawrencium_define_mappings = 0
let g:lawrencium_status_win_split_even = 1

"DISABLE BEEP and FLASH with an autocmd:
set vb t_vb=

"DEFINE TAB EQUAL SOME NUMBER OF SPACE
"set tabstop=3 shiftwidth=3 expandtab
set tabstop=3 shiftwidth=3 noexpandtab sts=0
set cindent
set cinoptions=(0,u0,U0

"SET UP TO VIM READS THE FILE WHEN IT CHANGES
set autoread
"-- reload when entering the buffer or gaining focus
au FocusGained,BufEnter * :silent! !
"-- save when exiting the buffer or losing focus
"au FocusLost,WinLeave * :silent! w


"DEFINE IGNORECASE FEATURE IN SEARCHING/REPLACE
set ignorecase
"DEFINE HIGH LIGHT IN SEACHING FEATURE
set hlsearch incsearch

"SHOW COMMAND IN COMMAND MODE
set showcmd
set wildmode=longest:full,list:full
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
set cedit=<C-Y>

"Highlight whole current line
"because highligh syntax and cursor line can make vim slower
"reference:
"http://stackoverflow.com/questions/19030290/syntax-highlighting-causes-terrible-lag-in-vim
"http://stackoverflow.com/questions/4775605/vim-syntax-highlight-improve-performance
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256
function! CursorChangeNormal()
	highlight CursorLine ctermbg=0 cterm=NONE
endfunction
function! CursorChangeUnderline()
	highlight CursorLine cterm=underline ctermbg=NONE
endfunction
function! CursorChangeNone()
	highlight CursorLine cterm=NONE ctermbg=NONE
endfunction
command! CursorChangeNormal :call CursorChangeNormal()
command! CursorChangeUnderline :call CursorChangeUnderline()
command! CursorChangeNone :call CursorChangeNone()

"SET STATUS LINE
set laststatus=2
set statusline=%<%t
set statusline+=\ \ 
" show current function name at the cursor
set statusline+=[%{Tlist_Get_Tagname_By_Line()}]
"white space
set statusline+=\ \ 
" show current buffer revision in mecurial reposity
" -> I see this plugin not work well so I disable that
" set statusline+=[%{HGRev()}] 
"white space
set statusline+=\ 
" show current buffer revision in git reposity
" This plugin work well but I don't think this is "must need" information -> just disable this!
"set statusline+=[%{fugitive#statusline()}]
set statusline+=%=
set statusline+=%m "modified flag
set statusline+=%r "readonly flag
set statusline+=%y "filetype
"white space
set statusline+=\ \  
set statusline+=%l
set statusline+=/
set statusline+=%L
set statusline+=(
set statusline+=%p
set statusline+=%%
set statusline+=)-
set statusline+=%c

"change status line color in insert mode!
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermbg=0
    hi statusline ctermfg=red
  elseif a:mode == 'r'
    hi statusline ctermbg=0
    hi statusline ctermfg=red
  else
    hi statusline ctermbg=0
    hi statusline ctermfg=red
  endif
endfunction
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermbg=0 ctermfg=14

"SETUP FOR QUICKFIX WINDOW
autocmd Filetype qf call SettingQF()
function! SettingQF()
   "setup for status line of quickfix window
   "Note: status line of quickfix window is different with another window
   "      To know information about current status line we use: 
   "      :setlocal statusline<CR>
   setlocal statusline=%t%{w:quickfix_title}%=%l/%L(%p%%)-%c
   "setup default heigh of quickfix window
   7wincmd _
   "setup default position of quickfix window is the most bottom window.
   wincmd J
endfunction
"mapkey to scroll through last 10 quickfix list 
nmap <C-@>n :cnewer<CR>
nmap <C-@>p :colder<CR>

" MAP LEADER KEY to , (Because real leader hurt my finger)
let mapleader = ","

"BIND KEY TO MOVE BETWEEN WINDOW
" map in normal mode
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-Tab> <C-w>p

" map in insert mode
imap <C-Tab> <C-[><C-w>p

"SET CAPLOCK FEATURE
" Use Ctrl-^ to toggle Caps Lock" and turn off this special mode when exiting insert mode:
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
   execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
   execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
    " Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

"SET FOR CTRLP PLUGIN
"ctrlp will ignore .so .zip ...
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/sourceCodeDoxygen/*    " Linux/MacOSX
"map key for ctrlp plugin
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
nmap <silent> <Leader>w :CtrlP /home/giang/Dropbox<CR>
nmap <silent> <Leader>c :CtrlP /home/giang/o<CR>
nmap <silent> <Leader>j :CtrlP /home/giang/w/saf<CR>
nmap <silent> <Leader>b :CtrlPBuffer<CR>

"SET UP FOR AUTOMATICALLY JUMP TO CURRENT DIRECTORY , exept /tmp
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

"SET FOR TAGLIST PLUGIN
let Tlist_Show_One_File = 1 "show tags of only one file
let Tlist_GainFocus_On_ToggleOpen = 1 "automatically switch to taglist window
let Tlist_Highlight_Tag_On_BufEnter = 1 "highlight current tag in taglist window
let Tlist_Process_File_Always = 1 "even without taglist window, create tags file, required for displaying tag in statusline
											 "But, maybe this feature reduce vim's performance, so that I should disable it
											 "Use :TlistUpdate command to create tag file
											 
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Compact_Format = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_WinWidth = 29
nmap <silent> <F5> :TlistToggle<CR>

"SET FOR NERDTREE PLUGIN
nmap <silent> <F6> :NERDTreeToggle<CR>

"SET FOR MOVE SLOWLY WITH C-f, C-b
"IN NORMAL MODE AND VISUAL MODE
nnoremap <C-f> 3j
vnoremap <C-f> 3j
nnoremap <C-b> 3k
vnoremap <C-b> 3k

"SET FOR TABULARIZE PLUGIN
nmap <silent> <Leader>t :Tabularize/'<CR>

" SET FOR SWITCH BETWEEN SOURCE FILE AND CODE FILE IN C AND C++ LANGUAGE PROGRAMING"
" note: we should check two type:
"        - two type: type 1:  .h in /include and .c in /src (so we have src?include? for .h ; ?include?src? for .c)
"                    type 2:  .h and .c in the same directory 
function! OpenOther()
   if expand("%:e") == "c"
      if findfile(expand("%:p:r:s?src?include?").".h", ".") == expand("%:p:r:s?src?include?").".h"
         " if we don't want open in the same buffer, we can use exe "split" instead of exe "e"
         "exe "write"
         exe "e" fnameescape(expand("%:p:r:s?src?include?").".h")
      elseif findfile(expand("%:p:r:s?src?").".h", ".") == expand("%:p:r:s?src?").".h"
         "exe "write"
         exe "e" fnameescape(expand("%:p:r:s?src?").".h")
      else
         echo "there is not an appropriate .h file"
      endif

   elseif expand("%:e") == "h"
      if findfile(expand("%:p:r:s?include?src?").".c", ".") == expand("%:p:r:s?include?src?").".c"
         "exe "write"
         exe "e" fnameescape(expand("%:p:r:s?include?src?").".c")
      else
         echo "there is not an appropriate .c file"
      endif

   elseif expand("%:e") == "cxx"
      if findfile(expand("%:p:r:s?src?include?").".hxx", ".") == expand("%:p:r:s?src?include?").".hxx"
         exe "e" fnameescape(expand("%:p:r:s?src?include?").".hxx")
         "exe "write"
      elseif findfile(expand("%:p:r:s?src?").".hxx", ".") == expand("%:p:r:s?src?").".hxx"
         "exe "write"
         exe "e" fnameescape(expand("%:p:r:s?src?").".hxx")
      else
         echo "there is not an appropriate .hxx file"
      endif

   elseif expand("%:e") == "hxx"
      if findfile(expand("%:p:r:s?include?src?").".cxx", ".") == expand("%:p:r:s?include?src?").".cxx"
         "exe "write"
         exe "e" fnameescape(expand("%:p:r:s?include?src?").".cxx")
      else
         echo "there is not an appropriate .cxx file"
      endif

   elseif expand("%:e") == "cc"
      if findfile(expand("%:p:r:s?src?include?").".hh", ".") == expand("%:p:r:s?src?include?").".hh"
         exe "e" fnameescape(expand("%:p:r:s?src?include?").".hh")
         "exe "write"
      elseif findfile(expand("%:p:r:s?src?").".hh", ".") == expand("%:p:r:s?src?").".hh"
         "exe "write"
         exe "e" fnameescape(expand("%:p:r:s?src?").".hh")
      else
         echo "there is not an appropriate .hh file"
      endif

   elseif expand("%:e") == "hh"
      if findfile(expand("%:p:r:s?include?src?").".cc", ".") == expand("%:p:r:s?include?src?").".cc"
         "exe "write"
         exe "e" fnameescape(expand("%:p:r:s?include?src?").".cc")
      else
         echo "there is not an appropriate .cc file"
      endif
   endif
endfunction
" Map key to switch between source code file and header file
nmap <silent> <Leader>x :call OpenOther()<CR>

" SET UP FOR THE_SILVER_SEARCHER or (AG)
" Do not change mapping key in quickfix list and location list when show result of Ag command
let g:ag_apply_qmappings=0 
let g:ag_apply_lmappings=0

" SET UP FOR vim-dirdiff:
let g:DirDiffExcludes="*.hg,*.o,*.la,*.so,*.a"

" SET UP FOR DIFFTOGGLE
nnoremap <silent> <Leader>d :call DiffToggle()<CR>
function! DiffToggle()
   if &diff
      diffoff
   else
      diffthis
   endif
:endfunction

" SET UP FOR THE CSCOPE
set cscopetag
set csto=0
cscope add /home/giang/.cscopeDatabase/o/cscope.out
"set cscopeverbose
set cscopequickfix=s-!,g-!,c-!,t-!,e-!,f-!,i-,d-!

function! IgnoreCaseCscope()
   exe "set csprg=~/.vim/ignoreCaseCscope.sh"
   exe "set csprg?"
   exe "cs reset"
   "echo "Cscope change mode to Ignore Case in searching, you can not use CAPITALIZE CHARACTER in searching"
endfunction

function! SensitiveCaseCscope()
   exe "set csprg=/usr/bin/cscope"
   exe "set csprg?"
   exe "cs reset"
   "echo "Cscope change mode to Sensitive Case in searching"
endfunction

function! GenerateCscopeDatabase()
   exe "!/home/giang/.vim/cscopeGenerate.sh"
   exe "cs reset"
   "echo "Cscope change mode to Sensitive Case in searching"
endfunction

" map key for cscope
nmap <silent> <Leader>i :call IgnoreCaseCscope()<CR>
nmap <silent> <Leader>I :call SensitiveCaseCscope()<CR>
command! GenerateCscopeDatabase :call GenerateCscopeDatabase()

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" MAP IN INSERT MODE for CTRL-C will act as Ctrl+[ -> for modify multiple line in insert mode easily
imap <C-c> <C-[>

" SETUP FOR  SYNC CODE BETWEEN MACHINE
function! Sync2lub()
   exe "!/home/giang/.vim/sync2lub.sh"
endfunction
command! Sync2lub :call Sync2lub()

"DEFINE COLOR AND FONT TO DISPLAY
filetype on
filetype indent on
syntax on
syntax enable
set background=dark
colorscheme solarized
set t_Co=256

"DEFINE COLOR FOR HIGHLIGHT SEARCH
hi Search cterm=NONE ctermbg=White ctermfg=black

"BOOST VIM http://nvie.com/posts/how-i-boosted-my-vim/
set hidden
set pastetoggle=<F2>
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set nobackup
set noswapfile
set nowritebackup
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
set backspace=indent,eol,start
set autoindent
set formatoptions=

"SETUP FOR vim-cpp-enhanced-highlight PLUGIN, 
"highlight class name
"let g:cpp_class_scope_highlight = 1
"highlight tempplate class name
"let g:cpp_experimental_template_highlight = 1

"Map key to work with tab
nmap <C-n> :tabnext<CR>
nmap <C-p> :tabprevious<CR>

"Vim slow because of highlight feature!
"http://jchain.github.io/blog/2012/12/26/vim-gets-slow-when-editing-latex/
"http://vimrc-dissection.blogspot.com/2006/09/vim-7-re-turn-off-parenparenthesiswhat.html
let g:loaded_matchparen=1

"Map key to know fullpath of current file
nmap <C-g> :echo expand('%:p')<CR>

"Setup color for tabline:
hi TabLine      ctermfg=White  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

"Setup hotkey to turn of highlighting until the next-search
nmap <silent> <Leader>e :noh<CR>
