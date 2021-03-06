" Sources {{{
" vi-improved.org/vimrc.php
" github.com/carlhuda/janus
" github.com/gmarik/vimfiles/blob/master/vimrc
" github.com/durdn/cfg/blob/master/.vimrc
" github.com/factorylabs/vimfiles
" github.com/lukerandall/dotvim/blob/master/vimrc
" github.com/mathiasbynens/dotfiles/blob/master/.vimrc
" viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html
"}}}
" Plugins {{{
" Init Vundle {{{
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
"}}}
" Sane defaults {{{
Plugin 'tpope/vim-sensible'
"}}}
" Colors {{{
Plugin 'vim-colors-solarized', { 'pinned': 1 }
"}}}
" Languages {{{
" HTML {{{
Plugin 'matchit.zip'
Plugin 'othree/html5.vim'
"}}}
" Templates {{{
Plugin 'lepture/vim-jinja'
Plugin 'tpope/vim-liquid'
"}}}
" CSS {{{
Plugin 'wavded/vim-stylus'
"}}}
" Javascript {{{
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'elzr/vim-json'
"}}}
" Python {{{
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'hdima/python-syntax'
Plugin 'tmhedberg/SimpylFold'
Plugin 'jmcantrell/vim-virtualenv'
"}}}
" Go {{{
Plugin 'fatih/vim-go'
"}}}
" Java {{{
Plugin 'eclim', { 'pinned': 1 }
"}}}
" Markdown {{{
Plugin 'tpope/vim-markdown'
"}}}
" MySQL {{{
Bundle "dbext.vim"
"}}}
" YAML {{{
Plugin 'chase/vim-ansible-yaml'
"}}}
"}}}
" Everything else {{{
Plugin 'rking/ag.vim'
Plugin 'camelcasemotion'
Plugin 'kien/ctrlp.vim'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'IndexedSearch'
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/vim-easy-align'
Plugin 'xolox/vim-easytags'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'xolox/vim-misc'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'papanikge/vim-voogle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'regedarek/ZoomWin'
"}}}
" Finish Init Vundle {{{
call vundle#end()
filetype plugin indent on
"}}}
"}}}
" Options {{{
" Colors {{{
if $TMUX != "" | set term=screen-256color | endif
set t_Co=256
set background=dark
colorscheme solarized
"}}}
" Spaces {{{
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
"}}}
" Status Line {{{
set shortmess=atI
set noshowmode
"}}}
" Ignored {{{
set wildignore+=*.swp,.git/,*.jpg,*.jpeg,*.png,*.gif,*.psd,*.pdf,\.DS_Store
set wildignore+=*.pyc,*.pyo,*.egg,*.egg-info
set wildignore+=*.a,*.o,*.so
set wildignore+=*.class
"}}}
" Keys {{{
let mapleader=","
cabbrev vhelp vert help

inoremap jk <Esc>

nnoremap j gj
nnoremap k gk

nnoremap : ;
vnoremap : ;
nnoremap ; :
vnoremap ; :

nnoremap <silent> <C-j> <C-W>j
nnoremap <silent> <C-k> <C-W>k
nnoremap <silent> <C-h> <C-W>h
nnoremap <silent> <C-l> <C-W>l

nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>

" inoremap 1 !
" inoremap 2 @
" inoremap 3 #
" inoremap 4 $
" inoremap 5 %
" inoremap 6 ^
" inoremap 7 &
" inoremap 8 *
" inoremap 9 (
" inoremap 0 )
" inoremap - _

" inoremap ! 1
" inoremap @ 2
" inoremap # 3
" inoremap $ 4
" inoremap % 5
" inoremap ^ 6
" inoremap & 7
" inoremap * 8
" inoremap ( 9
" inoremap ) 0
" inoremap _ -
"}}}
" Searching {{{
set smartcase
set ignorecase
set gdefault
set wildmode=list:longest
if exists('&wildignorecase') | set wildignorecase | endif
"}}}
" Format {{{
set nowrap
set linebreak
set textwidth=79
call matchadd('ColorColumn', printf('\%%%dv', &textwidth+1), -1)
set relativenumber
set matchtime=3
set nolist
set nosmartindent
set cindent

augroup Format-Options
    autocmd!
    autocmd BufEnter * setlocal formatoptions=crqn2l1j
augroup END

function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call StripTrailingWhitespaces()
"}}}
" Folding {{{
set foldenable
set foldmethod=syntax
set foldlevel=0
set foldopen=block,hor,tag,percent,mark,quickfix

function! FoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2)
    let fillcharcount = windowwidth - len(line)

    return line . repeat(" ", fillcharcount)
endfunction " }}}
set foldtext=FoldText()
"}}}
" Backup {{{
set nobackup
set nowritebackup
set directory=~/.vim/swp//
"}}}
" Mouse {{{
behave xterm
set mouse-=a
set mousehide
"}}}
" Bells {{{
set novisualbell
"}}}
" Misc. {{{
set nostartofline
set splitbelow splitright
if $TMUX == '' | set clipboard+=unnamed | endif
set hidden
set title
" set lazyredraw
set ttyfast
let g:is_bash=1
"}}}
"}}}
" Plugin configurations {{{
" Ag {{{
let g:agprg = "ag --column --smart-case --follow"
let g:ag_mapping_message = 0
cabbrev ag Ag!
cabbrev Ag Ag!
"}}}
" Airline {{{
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#branch#displayed_head_limit = 15
"}}}
" Camelcase motion {{{
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
"}}}
" CtrlP {{{
let g:ctrlp_working_path_mode = 'raw'
let g:ctrlp_lazy_update = 0
let g:ctrlp_map = '<Leader>p'
noremap <silent> <Leader>b :CtrlPBuffer<CR>
noremap <silent> <Leader>t :CtrlPTag<CR>
let g:ctrlp_prompt_mappings = {
            \ 'PrtSelectMove("j")': ['<c-n>'],
            \ 'PrtSelectMove("k")': ['<c-p>'],
            \ 'PrtHistory(-1)':  ['<c-j>'],
            \ 'PrtHistory(1)': ['<c-k>'],
            \ }
call ctrlp_bdelete#init()
"}}}
" EasyAlign {{{
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
"}}}
" EasyTags {{{
set tags=.vimtags;,~/.vim/tags
let g:easytags_file = '~/.vim/tags'
let g:easytags_dynamic_files = 1
" let g:easytags_dynamic_files = 2
" let g:easytags_by_filetype = 1
let g:easytags_updatetime_warn = 0
let g:easytags_events = ['BufReadPost', 'BufWritePost']

" let g:easytags_languages = {
"             \   'javascript': {
"             \       'cmd': 'jsctags',
"             \       'args': [],
"             \       'fileoutput_opt': '-f',
"             \       'stdout_opt': '-f-',
"             \       'recurse_flag': '-R'
"             \   }
"             \}
"}}}
" Eclim {{{
set runtimepath+=$HOME/.vim/bundle/eclim/
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimWarningHighlight = 'Todo'
let g:EclimLoclistSignText  = '✗'
"}}}
" Go {{{
let g:go_highlight_trailing_whitespace_error = 0
let g:go_fmt_fail_silently = 1
"}}}
" ListToggle {{{
let g:lt_height = 10
"}}}
" NERDTree {{{
let NERDChristmasTree = 1
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 1
let NERDTreeShowFiles = 1
let NERDTreeMinimalUI = 1
let NERDTreeWinPos = 'right'
let NERDTreeIgnore = [
            \ '.DS_Store', '\.swp$', '\~$',
            \ '\.jpg$', '\.jpeg$', '\.png$', '\.gif$', '\.pdf$',
            \ '\.class$',
            \ '\.a$', '\.o$', '\.so$',
            \ '\.pyc$', '\.pyo$'
            \ ]

" augroup NERD-Tree
"     autocmd!
"     autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" augroup END

noremap <silent> <Leader>n :NERDTreeToggle<CR>
"}}}
" Python {{{
let python_slow_sync = 1
let python_highlight_indent_errors = 0
let python_highlight_space_errors = 0
let python_highlight_all = 1
"}}}
" Repeat {{{
silent! call repeat#set("\<Plug>.", v:count)
"}}}
" Sneak {{{
highlight link SneakPluginTarget Visual

map : <Plug>SneakNext

nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
"}}}
" Syntastic {{{
" noremap <silent> <Leader>c :echo "Checking..."<CR> :SyntasticCheck<CR>
" let g:syntastic_mode_map = { "mode": "passive" }

let g:syntastic_id_checkers = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 2

let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = g:EclimLoclistSignText
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '♫'
let g:syntastic_style_error_symbol = '♪'
highlight link SyntasticStyleErrorSign Todo

let g:syntastic_html_checkers = ['tidy', 'jshint']
let g:syntastic_python_checkers = ['flake8', 'pep257']

let g:syntastic_c_compiler_options = '-ansi -Wall -Wextra'
let g:syntastic_cpp_compiler_options = '-Wall -Wextra -Weffc++'
let g:syntastic_c_include_dirs = [ 'includes', 'include', 'inc',  'headers' ]
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_cpp_check_header = g:syntastic_c_check_header
let g:syntastic_cpp_include_dirs = g:syntastic_c_include_dirs
let g:syntastic_cpp_auto_refresh_includes = g:syntastic_c_auto_refresh_includes
let g:syntastic_cpp_remove_include_errors = g:syntastic_c_remove_include_errors
"}}}
" Tagbar {{{
nnoremap <silent> <Leader>g :TagbarToggle<CR>

let g:tagbar_sort = 0
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

let g:tagbar_type_javascript = { 'ctagsbin' : 'jsctags' }
"}}}
" Tern {{{
let g:tern#command = ['tern', '--no-port-file']
let g:tern_show_signature_in_pum = 1
" let g:tern_show_argument_hints = 'on_move'
"}}}
" Virtualenv {{{
" let g:virtualenv_directory = 'venv'
"}}}
" Vundle {{{
cabbrev BundleInstall PluginInstall
cabbrev BundleInstall! PluginInstall!
cabbrev BundleClean PluginClean
cabbrev BundleClean! PluginClean!
cabbrev BundleList PluginList
cabbrev BundleList! PluginList!
cabbrev BundleSearch PluginSearch
cabbrev BundleSearch! PluginSearch!
"}}}
" YouCompleteMe - YCM {{{
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
nnoremap <leader>] :YcmCompleter GoTo<CR>
"}}}
" Autocmds {{{
" BufWinEnter {{{
augroup Buf-Win-Enter
    autocmd!
    autocmd BufWinEnter *.less setfiletype less
    autocmd BufWinEnter .jshintrc setfiletype javascript
    autocmd BufWinEnter .tern-config,.tern-project setfiletype json
    autocmd BufWinEnter *.md,*.markdown setfiletype markdown
    " autocmd BufWinEnter * if &textwidth > 8 | if exists("w:highlight_text_width") | call matchdelete(w:highlight_text_width) | endif | let w:highlight_text_width=matchadd('ColorColumn', printf('\%%%dv', &textwidth+1), -1) | endif
augroup END
"}}}
" FileType {{{
augroup File-Type
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType qf setlocal wrap
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType html,json,xml,jinja,liquid,css,scss,less,stylus,ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType html,xml,jinja,liquid runtime! macros/matchit.vim
    autocmd FileType jinja setlocal commentstring={#\ %s\ #}
    autocmd FileType xdefaults setlocal commentstring=!\ %s
    autocmd FileType scss,less,stylus setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType tex setlocal number norelativenumber
augroup END
"}}}
"}}}
"}}}
