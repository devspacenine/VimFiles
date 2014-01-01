filetype plugin on
filetype indent on

syntax on
set background=dark
""" Color Settings
colorscheme wombat
au BufNewFile,BufRead,BufEnter *.html colorscheme wombat
au BufNewFile,BufRead,BufEnter +.ino colorscheme blackboard
au BufNewFile,BufRead,BufEnter *.py colorscheme blackboard
au BufNewFile,BufRead,BufEnter *.pyc colorscheme blackboard
au BufNewFile,BufRead,BufEnter *.js colorscheme busybee
au BufNewFile,BufRead,BufEnter *.json colorscheme busybee
au BufNewFile,BufRead,BufEnter *.css colorscheme paintbox
au BufNewFile,BufRead,BufEnter *.sass colorscheme paintbox
au BufNewFile,BufRead,BufEnter *.scss colorscheme paintbox

""" Custom File Types
au BufNewFile,BufRead *.html set filetype=htmldjango 
""" Arduino File Types
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

""" Default Settings
set backspace=indent,eol,start
set guifont=Consolas:h10:cANSI
set t_Co=256
set nocompatible
set autoindent
set history=100
set wildmenu
set wildmode=list:longest
set ruler
set showcmd
set incsearch
set showmatch
set number
set showmode
set ruler
set iskeyword+=-
set clipboard+=unnamed
set hidden
set title
set ttyfast
set selectmode=mouse
set wildignore+=*.swp
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.psd
set wildignore+=*.pdf
set wildignore+=*.DS_STORE

""" Indention Settings
autocmd FileType xhtml set autoindent cindent shiftwidth=4 ts=4 foldmethod=marker wrap linebreak textwidth=0
autocmd FileType htmldjango set autoindent nocindent shiftwidth=4 ts=4 foldmethod=marker wrap linebreak textwidth=0
autocmd FileType html set autoindent nocindent shiftwidth=4 ts=4 foldmethod=marker wrap linebreak textwidth=0
"""let g:html_indent_script1 = "auto"
"""let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head,tbody"
autocmd FileType yaml set cindent shiftwidth=4 ts=4 foldmethod=indent
autocmd FileType python set nocindent shiftwidth=4 et sw=4 ts=4 foldmethod=marker
autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType c set autoindent cindent shiftwidth=4 ts=4 foldmethod=indent
autocmd FileType cpp set autoindent cindent shiftwidth=4 ts=4 foldmethod=indent
autocmd FileType cs set autoindent cindent shiftwidth=4 ts=4 foldmethod=syntax
autocmd FileType ascx set autoindent cindent shiftwidth=4 ts=4 foldmethod=syntax wrap linebreak textwidth=0
autocmd FileType lisp set autoindent nocindent shiftwidth=4 ts=4 foldmethod=indent
autocmd FileType java set autoindent cindent shiftwidth=4 ts=4 foldmethod=indent
autocmd FileType php set autoindent cindent shiftwidth=4 ts=4 foldmethod=marker expandtab nosmartindent
autocmd FileType php set cinwords=if,else,elseif,do,while,foreach,for,case,default,function,class,interface,abstract,private,public,protected,final
autocmd FileType php set cinwords-=0<?
autocmd FileType javascript set autoindent cindent shiftwidth=4 ts=4 sts=4 et foldmethod=marker wrap linebreak textwidth=0
autocmd FileType css set omnifunc=csscomplete#CompleteCSS autoindent nocindent shiftwidth=4 ts=4 foldmethod=marker wrap linebreak textwidth=0
autocmd FileType scss set omnifunc=csscomplete#CompleteCSS autoindent nocindent shiftwidth=4 ts=4 foldmethod=marker wrap linebreak textwidth=0
autocmd FileType sass set omnifunc=csscomplete#CompleteCSS autoindent nocindent shiftwidth=4 ts=4 foldmethod=marker wrap linebreak textwidth=0

""" Basic Mappings
imap {<CR> {<CR>}<ESC>k$a<CR>
nmap <C-T> :tabnew 
map <C-Q> :q<CR>
map <F4> :w<CR>
map <F5> :edit<CR>
map <S-F5> :edit!<CR>
map <S-P> :set paste<CR>
map <S-N> :set nopaste<CR>
map \y :'a,'b y<ENTER>
nmap <tab> <S-I><tab><esc>
autocmd Filetype php nmap <C-P> a<?php  ?><esc>hhi
autocmd Filetype php imap <C-P> <?php  ?><esc>hhi
autocmd FileType py map \c :'a,'bs/^/#/<ENTER>:noh<ENTER>
autocmd FileType py map \u :'a,'bs/^#//<ENTER>:noh<ENTER>
autocmd FileType py map <C-C> I##<esc>

""" Tab Mappings
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

""" Supertab Tab Literal Mapping
let g:SuperTabMappingTabLiteral = "<C-T>"

""" Plugin Alterations
let g:py_select_leading_comments = 0

""" Completion Dictionaries
autocmd FileType php set dictionary-=/home/corey.pauley/completion_dicts/php_funclist.txt dictionary+=/home/corey.pauley/completion_dicts/php_funclist.txt
autocmd FileType php set complete-=k complete+=k

""" Auto-completion Settings
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Remap the tab key to select action with InsertTabWrapper
autocmd FileType php inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" NerdTree
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
"

""" PHP Indent Script
" Options: 
let php_noindent_switch=0    " set this to '1' to not try to indent switch/case statements
set sw=3                     " default shiftwidth of 3 spaces


if exists("b:did_indent")
   finish
endif
let b:did_indent = 1 

setlocal indentexpr=GetPhpIndent()
"setlocal indentkeys+=0=,0),=EO
setlocal indentkeys+=0=,0),=EO,o,O,*<Return>,<>>,<bs>,{,}

" Only define the function once.
if exists("*GetPhpIndent")
   finish
endif

" Handle option(s)
if exists("php_noindent_switch")
   let b:php_noindent_switch=1
endif

if exists('g:html_indent_tags')
   unlet g:html_indent_tags
endif

function GetPhpIndent()
    " Find a non-empty line above the current line.
   let lnum = prevnonblank(v:lnum - 1)

   " Hit the start of the file, use zero indent.
   if lnum == 0
       return 0
   endif

   let line = getline(lnum)    " last line
   let cline = getline(v:lnum) " current line
   let pline = getline(lnum - 1) " previous to last line
   let ind = indent(lnum)

   let restore_ic=&ic
   let &ic=1 " ignore case

   let ind = <SID>HtmlIndentSum(lnum, -1)
   let ind = ind + <SID>HtmlIndentSum(v:lnum, 0)

   let &ic=restore_ic

   let ind = indent(lnum) + (&sw * ind)
   " Indent after php open tags 
   if line =~ '<?php' && line !~ '?>'
      let ind = ind + &sw
   endif
   if cline =~ '^\s*[?>]' " // Fix from Holger Dzeik <dzeik@nentec.de> Thanks!
      let ind = ind - &sw
   endif


   if exists("b:php_noindent_switch") " version 1 behavior, diy switch/case,etc
      " Indent blocks enclosed by {} or ()
      if line =~ '[{(]\s*\(#[^)}]*\)\=$'
         let ind = ind + &sw
      endif
      if cline =~ '^\s*[)}]'
         let ind = ind - &sw
      endif
      return ind
   else " Try to indent switch/case statements as well
      " Indent blocks enclosed by {} or () or case statements, with some anal requirements
      if line =~ 'case.*:\|[{(]\s*\(#[^)}]*\)\=$'
         let ind = ind + &sw
         " return if the current line is not another case statement of the previous line is a bracket open
         if cline !~ '.*case.*:\|default:' || line =~ '[{(]\s*\(#[^)}]*\)\=$'
            return ind
         endif
      endif
      if cline =~ '^\s*case.*:\|^\s*default:\|^\s*[)}]'
         let ind = ind - &sw
         " if the last line is a break or return, or the current line is a close bracket,
         " or if the previous line is a default statement, subtract another
         if line =~ '^\s*break;\|^\s*return\|' && cline =~ '^\s*[)}]' && pline =~ 'default:'
            let ind = ind - &sw
         endif
      endif

      if line =~ 'default:'
         let ind = ind + &sw
      endif
      return ind
   endif
endfunction


" [-- local settings (must come before aborting the script) --]
"setlocal indentexpr=HtmlIndentGet(v:lnum)
"setlocal indentkeys=o,O,*<Return>,<>>,<bs>,{,}


" [-- helper function to assemble tag list --]
fun! <SID>HtmlIndentPush(tag)
    if exists('g:html_indent_tags')
   let g:html_indent_tags = g:html_indent_tags.'\|'.a:tag
    else
   let g:html_indent_tags = a:tag
    endif
endfun


" [-- <ELEMENT ? - - ...> --]
call <SID>HtmlIndentPush('a')
call <SID>HtmlIndentPush('abbr')
call <SID>HtmlIndentPush('acronym')
call <SID>HtmlIndentPush('address')
call <SID>HtmlIndentPush('b')
call <SID>HtmlIndentPush('bdo')
call <SID>HtmlIndentPush('big')
call <SID>HtmlIndentPush('blockquote')
call <SID>HtmlIndentPush('button')
call <SID>HtmlIndentPush('caption')
call <SID>HtmlIndentPush('center')
call <SID>HtmlIndentPush('cite')
call <SID>HtmlIndentPush('code')
call <SID>HtmlIndentPush('colgroup')
call <SID>HtmlIndentPush('del')
call <SID>HtmlIndentPush('dfn')
call <SID>HtmlIndentPush('dir')
call <SID>HtmlIndentPush('div')
call <SID>HtmlIndentPush('dl')
call <SID>HtmlIndentPush('em')
call <SID>HtmlIndentPush('fieldset')
call <SID>HtmlIndentPush('font')
call <SID>HtmlIndentPush('form')
call <SID>HtmlIndentPush('frameset')
call <SID>HtmlIndentPush('h1')
call <SID>HtmlIndentPush('h2')
call <SID>HtmlIndentPush('h3')
call <SID>HtmlIndentPush('h4')
call <SID>HtmlIndentPush('h5')
call <SID>HtmlIndentPush('h6')
call <SID>HtmlIndentPush('i')
call <SID>HtmlIndentPush('iframe')
call <SID>HtmlIndentPush('ins')
call <SID>HtmlIndentPush('kbd')
call <SID>HtmlIndentPush('label')
call <SID>HtmlIndentPush('legend')
call <SID>HtmlIndentPush('map')
call <SID>HtmlIndentPush('menu')
call <SID>HtmlIndentPush('noframes')
call <SID>HtmlIndentPush('noscript')
call <SID>HtmlIndentPush('object')
call <SID>HtmlIndentPush('ol')
call <SID>HtmlIndentPush('optgroup')
call <SID>HtmlIndentPush('pre')
call <SID>HtmlIndentPush('q')
call <SID>HtmlIndentPush('s')
call <SID>HtmlIndentPush('samp')
call <SID>HtmlIndentPush('script')
call <SID>HtmlIndentPush('select')
call <SID>HtmlIndentPush('small')
call <SID>HtmlIndentPush('span')
call <SID>HtmlIndentPush('strong')
call <SID>HtmlIndentPush('style')
call <SID>HtmlIndentPush('sub')
call <SID>HtmlIndentPush('sup')
call <SID>HtmlIndentPush('table')
call <SID>HtmlIndentPush('textarea')
call <SID>HtmlIndentPush('title')
call <SID>HtmlIndentPush('tt')
call <SID>HtmlIndentPush('u')
call <SID>HtmlIndentPush('ul')
call <SID>HtmlIndentPush('var')


" [-- <ELEMENT ? O O ...> --]
if !exists('g:html_indent_strict')
    call <SID>HtmlIndentPush('body')
    call <SID>HtmlIndentPush('head')
    call <SID>HtmlIndentPush('html')
    call <SID>HtmlIndentPush('tbody')
endif


" [-- <ELEMENT ? O - ...> --]
if !exists('g:html_indent_strict_table')
    call <SID>HtmlIndentPush('th')
    call <SID>HtmlIndentPush('td')
    call <SID>HtmlIndentPush('tr')
    call <SID>HtmlIndentPush('tfoot')
    call <SID>HtmlIndentPush('thead')
endif

delfun <SID>HtmlIndentPush

set cpo-=C

" [-- count indent-increasing tags of line a:lnum --]
fun! <SID>HtmlIndentOpen(lnum)
    let s = substitute('x'.getline(a:lnum),
    \ '.\{-}\(\(<\)\('.g:html_indent_tags.'\)\>\)', "\1", 'g')
    let s = substitute(s, "[^\1].*$", '', '')
    return strlen(s)
endfun

" [-- count indent-decreasing tags of line a:lnum --]
fun! <SID>HtmlIndentClose(lnum)
    let s = substitute('x'.getline(a:lnum),
    \ '.\{-}\(\(<\)/\('.g:html_indent_tags.'\)\>>\)', "\1", 'g')
    let s = substitute(s, "[^\1].*$", '', '')
    return strlen(s)
endfun

" [-- count indent-increasing '{' of (java|css) line a:lnum --]
fun! <SID>HtmlIndentOpenAlt(lnum)
    return strlen(substitute(getline(a:lnum), '[^{]\+', '', 'g'))
endfun

" [-- count indent-decreasing '}' of (java|css) line a:lnum --]
fun! <SID>HtmlIndentCloseAlt(lnum)
    return strlen(substitute(getline(a:lnum), '[^}]\+', '', 'g'))
endfun

" [-- return the sum of indents respecting the syntax of a:lnum --]
fun! <SID>HtmlIndentSum(lnum, style)
    if a:style == match(getline(a:lnum), '^\s*</')
   if a:style == match(getline(a:lnum), '^\s*</\<\('.g:html_indent_tags.'\)\>')
       let open = <SID>HtmlIndentOpen(a:lnum)
       let close = <SID>HtmlIndentClose(a:lnum)
       if 0 != open || 0 != close
      return open - close
       endif
   endif
    endif
    if '' != &syntax &&
   \ synIDattr(synID(a:lnum, 1, 1), 'name') =~ '\(css\|java\).*' &&
   \ synIDattr(synID(a:lnum, strlen(getline(a:lnum)) - 1, 1), 'name')
   \ =~ '\(css\|java\).*'
   if a:style == match(getline(a:lnum), '^\s*}')
       return <SID>HtmlIndentOpenAlt(a:lnum) - <SID>HtmlIndentCloseAlt(a:lnum)
   endif
    endif
    return 0
endfun
