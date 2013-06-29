call pathogen#infect()
"=========================Editor switches
set mouse=a
let mapleader = ","
set secure
set encoding=utf-8
set exrc
set number			  "display line number
set ruler
set backspace=2
set ofu=syntaxcomplete#Complete
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set nobackup
set noswapfile
nmap <silent> ,h :nohlsearch<CR>
set completeopt=menu
nmap <leader>m :set completeopt=menu,preview<cr> :so ~/.vimrc<cr>
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
"nnoremap ; :
"nnoremap j gj
"nnoremap k gk
set noic
"Status bar
set laststatus=2
"Searching
set hidden            "using hidden buffer without warning
set hlsearch          "set highlight searching
set ignorecase
set smartcase
set incsearch         "While typing a search command, show where the pattern, as it was typed so far, matches.  The matched string is highlighted.
set showmatch         "hightlight matching braces
"set grepprg=ack       "use ack to do grepping, :grep xx do grep xx in current folder recursively

"white space handing
set tabstop=8 "use industry standard 8-char tabs
set shiftwidth=4    "use standard 4-char indention
set shiftround  "Indent/Dedent to nearest 4-char boundary
set expandtab
set smarttab
set autoindent
"set smartindent 
"set softtabstop=4

" Directories for swp files
"set backupdir=~/.vim/backup
"set directory=~/.vim/backup

" Show (partial) command in the status line
set showcmd

"enable gf to search for headers
"set path =.,.**,/usr/include/**,/usr/share/**,/opt/local/include/**
"=========================Auto save/load session
"map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
"map <F3> :source ~/vim_session <cr>     " And load session with F3

"=========================Theme and Color
"colorscheme delek
"if has("gui")
"The following is black-wite background.
"colorscheme desert
colorscheme molokai
"colorscheme railscasts
"colorscheme camo
"colorscheme eclm_wombat
"set transparency=15
"colorscheme evening
"endif

if !has("gui")
if version >= 700
    let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
    "highlight   clear
    highlight   Pmenu         ctermfg=0 ctermbg=2
    highlight   PmenuSel      ctermfg=0 ctermbg=7
    highlight   PmenuSbar     ctermfg=7 ctermbg=0
    highlight   PmenuThumb    ctermfg=0 ctermbg=7
endif
endif
"=========================Taglist 
"let Tlist_Use_SingleClick = 1
"let Tlist_Process_File_Always = 0
"let Tlist_Use_Right_Window=1
"set tags+=~/.vim/tags/xxx Load standard tag files, maybe opengl, std, check http://gergap.wordpress.com/2009/05/29/minimal-vimrc-for-cc-developers/
set tags+=./tags
"set tags+=~/.vim/tags/cpp_stl
""set tags+=~/.vim/tags/open_gl
"set tags+=~/.vim/tags/opencv
"set tags+=~/.vim/tags/openni
"set tags+=~/.vim/tags/nite

map <C-F5> :!ctags --extra=+f --field=+iaS -R *<CR><CR>
"map <F5> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
map <F5> :!ctags -R --sort=yes --fields=+iaS --extra=+q .<CR>
map <leader>l :TlistToggle<CR>
let Tlist_Process_File_Always=1
let Tlist_Show_One_File=1
map <C-\> :tnext<CR> 
"jump to next matching tag

"=========================OmniCPP
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main "use C++ completion function
let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 0
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview
"set omnifunc=pysmell#Complete
let g:pydiction_location = "~/.vim/bundle/pythondiction/complete-dict"
"=========================NerdTree
map <leader>e :NERDTreeToggle<CR>

"=========================Swtiches for Macvim, GUI
set guioptions-=T
set guifont=Menlo:h14.00

"=========================Key mapping
"map <leader>d dw
map <leader>r :reg<CR>
"map <leader>; gT
"map <leader>' gt
map <leader>/ :tabc<CR>
map <leader>B :buffers<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"map <C-,> <C-w><
map <leader>o <C-w>o
"map <leader>F :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
"map <leader>F :execute "vimgrep /" . expand("<cword>") . "/j %" <Bar> cw<CR>
"search in the directory
map <leader>f :Ack!<cr>
"search in the current file
map <leader>F :execute "Ack! " . expand("<cword>") . " %" <CR>
"search the copy string in the " register(default register) on the current file.
map <leader>g :Ack! <C-r>" % <CR>
map <leader>cn :cnext<CR>
map <leader>cp :cprevious<CR>
"map <C-u> :tabprevious<cr>
"map <C-m> :tabnext<cr>
map <leader>n :tabnew<cr>
"========compile program===
"python
map <leader>p :w<cr>:!python %<cr>
imap <leader>p <Esc>:w<cr>:!python %<cr>

"java
"map <leader>j :w<cr>:!javac %;java %:r<cr>
"imap <leader>j <Esc>:w<cr>:!javac %;java %:r<cr>
"====== add the absolute path of source files(*.java) to the javac and add
"binary file(*.class) to the java, (directories of java files).  
noremap <leader>j :w<cr>:execute "!javac -cp ".expand("%:p:h")." ".expand("%:p")." -d ".expand("%:p:h:h")."/bin;java -cp ".expand("%:p:h:h")."/bin ".expand("%:t:r")<cr>
imap <leader>j <Esc>:w<cr>:execute "!javac -cp ".expand("%:p:h")." ".expand("%:p")." -d ".expand("%:p:h:h")."/bin;java -cp ".expand("%:p:h:h")."/bin ".expand("%:t:r")<cr>
noremap <leader>J :w<cr>:execute "!javac -cp ".expand("%:p:h:h")." ".expand("%:p")." -d ".expand("%:p:h:h:h")."/bin;java -cp ".expand("%:p:h:h:h")."/bin ".expand("%:p:h:t")."/".expand("%:t:r")<cr>
imap <leader>J <Esc><leader>J

"c++
map <leader>c :!g++ % -o out;./out<cr>

set pastetoggle=<F6>
map <C-S-Tab> :tabprevious<CR>
nmap <C-S-Tab> :tabprevious<CR>
imap <C-S-Tab> <Esc>:tabprevious<CR>i

map <C-Tab> :tabnext<CR>
nmap <C-Tab> :tabnext<CR>
imap <C-Tab> <Esc>:tabnext<CR>i

map <leader>x :x<cr>
imap <leader>x <Esc>:x<cr>

map <leader>w :w<cr>
imap <leader>w <Esc>:w<cr>
"let g:vjde_completion_key='<leader><tab>'
imap <leader>u <C-x><C-u>
"map <leader>t :CommandT<cr>

"undo the last delete
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

inoremap <C-space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>
inoremap <C-l> <C-x><C-l>
imap <leader>; <CR><CR>end<Esc>-cc
map <F4> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
if (v:version >= 700) 
    highlight SpellBad      ctermfg=Red         term=Reverse        guisp=Red       gui=undercurl   ctermbg=White 
    highlight SpellCap      ctermfg=Green       term=Reverse        guisp=Green     gui=undercurl   ctermbg=White 
    highlight SpellLocal    ctermfg=Cyan        term=Underline      guisp=Cyan      gui=undercurl   ctermbg=White 
    highlight SpellRare     ctermfg=Magenta     term=underline      guisp=Magenta   gui=undercurl   ctermbg=White 
endif " version 7+ 
map j gj
map k gk
imap <leader>a {<cr>}<C-[>O
set background=dark
map <tab> gt
"nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
"nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
"nnoremap <C-j> <down>
"nnoremap <C-k> <up>
"==comments auto indent changes
autocmd FileType * setlocal formatoptions-=c formatoptions-=o formatoptions-=r

"hi StatusLine ctermfg=6 ctermbg=8
hi StatusLine ctermfg=0 ctermbg=7
hi MatchParen ctermbg=1
hi Search ctermfg=0 ctermbg=2 

"==change directory to the current file position
nnoremap cd :exe "cd ".expand("%:p:h")<cr>

"Underline, Overline, Strike Through,DoubleUnderline
" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction
"no auto-">"tag completion
let php_noShortTags=1
:ab syso System.out.println(
hi Visual  guifg=#000000 guibg=#FFFFFF gui=none
