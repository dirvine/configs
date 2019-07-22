" Fish doesn't play all that well with others
"
set shell=/bin/bash
let mapleader = "\<Space>"
syntax enable

" =============================================================================
" # PLUGINS
" =============================================================================
set nocompatible
filetype off

let g:ale_completion_enabled = 0
" Install plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')
" Pair programmign and chat
if has("nvim")
  "Plug 'floobits/floobits-neovim'
endif

Plug 'zxqfl/tabnine-vim'

Plug 'justinmk/vim-sneak'

" Vim personal wiki
Plug 'vimwiki/vimwiki'
" Notational FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'chazy/dirsettings'
Plug 'michal-h21/vim-zettel'
Plug 'alok/notational-fzf-vim'
Plug 'itchyny/calendar.vim'
" Plug 'michal-h21/vimwiki-sync'

 "vim-taskwarrior, src https://github.com/farseer90718/vim-taskwarrior
 "taskwarrior support for vimwiki
Plug 'farseer90718/vim-taskwarrior'

" spell thesaurus etc.
Plug 'reedes/vim-lexical'
" Uncover usage problems in your writing
Plug 'reedes/vim-wordy'
" full screen writing
Plug 'junegunn/goyo.vim'
" Soft wrap etc.
Plug 'reedes/vim-pencil'
" autocorrect
Plug 'reedes/vim-litecorrect'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
"nicer quotes when writing prose
" Plug 'kana/vim-textobject-user'
" Plug 'reedes/vim-textobj-quote'
" Plug 'reedes/vim-textobj-sentence'
Plug 'junegunn/limelight.vim'
"Spell suggestions in window
Plug 'dahu/vimple'
" linter and more
Plug 'w0rp/ale'
" See git status in gutter
Plug 'mhinz/vim-signify'
" for rls etc.
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Search for a project root (.git etc) and make that home.
Plug 'airblade/vim-rooter'
"Displays function signatures from completions in the command line.
Plug 'Shougo/echodoc.vim'
"Vim support for editing fish scripts
Plug 'dag/vim-fish'
" File explorere
Plug 'scrooloose/nerdtree'
" Git helper
Plug 'tpope/vim-fugitive'
"A git commit browser for vim. Extends fugitive.vim
" :Extradite
" oh, ov, and ot edit the revision under the cursor in a new horizontal split / vertical split / tab respectively.
" dh, dv, and dt diff the current file against the revision under the cursor in a new horizontal split / vertical split / tab respectively.
" t toggles the visibility of the file diff buffer.
" q closes the Extradite buffer.
Plug 'int3/vim-extradite'
" file / buffer find
Plug 'kien/ctrlp.vim'
" rust helpers
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
Plug 'mattn/webapi-vim'
Plug 'elmcast/elm-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
" Code commenter (leader c
Plug 'tomtom/tcomment_vim'
Plug 'oblitum/rainbow'
" Plug 'ap/vim-buftabline'
Plug 'lifepillar/vim-solarized8'
" In quickfix :Enmasse will open a buffer with each line form each file in it.
Plug 'Olical/vim-enmasse'
" Plug 'rhysd/rust-doc.vim'
" Plug 'Shougo/denite.nvim'


" Initialize plugin system
call plug#end()
" let g:rust_doc#define_map_K = 0
" augroup vimrc-rust
"     autocmd!
"     autocmd FileType rust nnoremap <buffer><silent>K :<C-u>Denite rust/doc:cursor -no-empty -immediately<CR>
"     autocmd FileType rust vnoremap <buffer><silent>K :Denite rust/doc:visual -no-empty -immediately<CR>
" augroup END

if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif
"WIKI
let g:vimwiki_list = [{'path': '~/Devel/wiki/',
                          \ 'syntax': 'markdown', 'ext': '.md'}]
" let wiki.nested_syntaxes = {'ruby': 'ruby', 'python': 'python', 'c++': 'cpp', 'sh': 'sh', 'racket': 'racket', 'rust': 'rust'}
let g:vimwiki_hl_headers = 1
let g:nv_search_paths = ['~/Devel/wiki']
nnoremap <silent> <leader>f :NV<CR>
" Filename format. The filename is created using strftime() function
let g:zettel_format = "%y%m%d-%H%M"
" Disable default keymappings
let g:zettel_default_mappings = 0
" This is basically the same as the default configuration
augroup filetype_vimwiki
  autocmd!
  autocmd FileType vimwiki imap <silent> [[ [[<esc><Plug>ZettelSearchMap
  autocmd FileType vimwiki nmap T <Plug>ZettelYankNameMap
  autocmd FileType vimwiki xmap z <Plug>ZettelNewSelectedMap
  autocmd FileType vimwiki nmap gZ <Plug>ZettelReplaceFileWithLink
augroup END
let g:task_log_directory   = '~/Devel/wiki'
let g:calendar_google_calendar = 1
" :autocmd FileType vimwiki map d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
" :autocmd FileType vimwiki map c :call ToggleCalendar()

" Settings for Vimwiki
let g:vimwiki_list = [{'path':'~/Devel/wiki/','ext':'.md','syntax':'markdown', 'zettel_template': "~/mytemplate.tpl"}, {"path":"~/Devel/wiki/"}]
" Set template and custom header variable for the second Wiki
let g:zettel_options = [{},{"front_matter" : {"tags" : ""}, "template" :  "~/mytemplate.tpl"}]


nmap <F10> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F10> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

let g:sneak#s_next = 1

" Linter
let g:ale_sign_column_always = 1
" only lint on save
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1
" ALE
let g:ale_linters = {}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1
let g:ale_rust_rls_executable = 'rls'
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_linters['rust'] = ['rls']
let g:ale_fixers['rust'] = ['rustfmt']
let g:ale_set_ballons = 1

" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick-save
nmap <leader>w :w<CR>

" comment
map <leader>c :TComment<CR>
" =============================================================================
" # Keyboard shortcuts
" =============================================================================
" ; as :
nnoremap ; :

" Ctrl+c and Ctrl+j as Esc
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

" Suspend with Ctrl+f
inoremap <C-f> :sus<cr>
vnoremap <C-f> :sus<cr>
nnoremap <C-f> :sus<cr>

" Jump to start and end of line using the home row keys
map H ^
map L $

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" language server protocol
let g:LanguageClient_settingsPath = "/home/dirvine/.vim/settings.json"
let g:LanguageClient_serverCommands = {
    \ 'rust': ['env', 'CARGO_TARGET_DIR=/home/dirvine/cargo-target/rls', 'rls'],
    \ }
let g:LanguageClient_autoStart = 1
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F7> :call LanguageClient_textDocument_rename()<CR>

let g:rustfmt_command = "rustfmt"
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"

" Completion
set completeopt=noinsert,menuone,noselect
set complete+=kspell
" tab to select
" and don't hijack my enter key
"inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
"inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

nnoremap <F9> :call LanguageClient_contextMenu()<CR>

filetype plugin indent on
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
        nmap <leader>1 <Plug>BufTabLine.Go(1)
        nmap <leader>2 <Plug>BufTabLine.Go(2)
        nmap <leader>3 <Plug>BufTabLine.Go(3)
        nmap <leader>4 <Plug>BufTabLine.Go(4)
        nmap <leader>5 <Plug>BufTabLine.Go(5)
        nmap <leader>6 <Plug>BufTabLine.Go(6)
        nmap <leader>7 <Plug>BufTabLine.Go(7)
        nmap <leader>8 <Plug>BufTabLine.Go(8)
        nmap <leader>9 <Plug>BufTabLine.Go(9)
        nmap <leader>0 <Plug>BufTabLine.Go(10)
        nmap <leader>11 <Plug>BufTabLine.Go(10)
        nmap <leader>12 <Plug>BufTabLine.Go(10)

        let g:rainbow_levels = [
    \{'ctermfg': 2, 'guifg': '#859900'},
    \{'ctermfg': 6, 'guifg': '#2aa198'},
    \{'ctermfg': 4, 'guifg': '#268bd2'},
    \{'ctermfg': 5, 'guifg': '#6c71c4'},
    \{'ctermfg': 1, 'guifg': '#dc322f'},
    \{'ctermfg': 3, 'guifg': '#b58900'},
    \{'ctermfg': 8, 'guifg': '#839496'},
    \{'ctermfg': 7, 'guifg': '#586e75'}]
au BufNewFile,BufRead *.rs set filetype=rust
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.elm set filetype=elm
let g:elm_format_autosave = 1
" autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo | set makeprg=cargo | set errorformat=%Eerror%m,%Z\ %#-->\ %f:%l:%c
" autocmd BufWritePost *.rs | :RustFmt
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd QuickFixCmdPost *grep* cwindow "open quickfix after a grep
autocmd bufwritepost *.js silent !standard-format -w %
autocmd Filetype markdown :augroup pencil "setlocal spell
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft', 'textwidth': 80})
                            \ | setl spell spl=en_gb fdl=4 noru nonu nornu
                            \ | setl fdo+=search
  						              " \ | call plug#load('vim-pencil')
                            \ | call plug#load('goyo.vim')
                \ | call plug#load('limelight.vim')
                \ | call plug#load('vim-wordy.vim')
                \ | call plug#load('vim-litecorrect')
                            \ | call lexical#init()
                            \ | call litecorrect#init()
  autocmd Filetype git,gitsendemail,*commit*,*COMMIT*
                            \   call pencil#init({'wrap': 'hard', 'textwidth': 72})
                            \ | call litecorrect#init()
                            \ | setl spell spl=en_gb et sw=2 ts=2 noai
  autocmd Filetype mail         call pencil#init({'wrap': 'hard', 'textwidth': 60})
                            \ | call litecorrect#init()
                            \ | setl spell spl=en_gb et sw=2 ts=2 noai nonu nornu
  autocmd Filetype html,xml     call pencil#init({'wrap': 'soft'})
                            \ | call litecorrect#init()
                            \ | setl spell spl=en_gb et sw=2 ts=2

augroup END
autocmd! User GoyoEnter Limelight | set spell
autocmd! User GoyoLeave Limelight!
" " Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" ###################  RUST  #########################

let RUST_SRC_PATH=$RUST_SRC_PATH
let g:ycm_rust_src_path = $RUST_SRC_PATH
nnoremap <silent> <Leader>b :make build  <CR> <bar> :copen <CR>
nnoremap <silent> <Leader>r :make run  <CR> <bar> :copen <CR>
nnoremap <silent> <Leader>l :make test --no-run clippy <CR> <bar> :copen <CR>
nnoremap <silent> <Leader>t :make test -- --nocapture <CR>
let g:rustfmt_autosave = 0
let g:rustfmt_fail_silently = 1
let g:rust_fold = 1
let g:rust_bang_comment_leader = 1
let g:rust_playpen_url = 'https://play.rust-lang.org/'
let g:rustmft_options = 'overwrite'
let g:ftplugin_rust_source_path = $RUST_SRC_PATH
let g:rust_conceal_mod_path = 1
let g:rust_shortener_url = 'https://is.gd/'
let g:rust_conceal = 1
let g:rustc_makeprg_no_percent = 1

" ################ Python ################

nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction
" remove all whitespace on every write
autocmd BufWritePre * :%s/\s\+$//e
let g:airline_theme='solarized'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_detect_paste=1
let g:airline#extensions#hunks#enabled = 1
let g:airline_powerline_fonts = 0


set spelllang=en_gb


let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_disable_by_default = 0



let g:ctrlp_use_caching = 1
let g:ctrlp_max_files = 100000
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_switch_buffer = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/build*/,*/target
nnoremap <silent> <Leader>p :CtrlP <CR>
nmap ; :CtrlPBuffer<CR>
nmap <leader>a :CtrlPTag<CR>
nnoremap <silent> <Leader>n :set nonumber!<CR>


let g:tmux_navigator_save_on_switch = 1


let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" Prevent :bd inside NERDTree buffer
au FileType nerdtree cnoreabbrev <buffer> bd <nop>
au FileType nerdtree cnoreabbrev <buffer> BD <nop>
" NERDTree settings
let NERDTreeChDirMode=0
let NERDTreeIgnore=['\env','>vim$', '\~$', '>pyc$', '>swp$', '>egg-info$', '>DS_Store$', '^dist$', '^build$']
let NERDTreeSortOrder=['^__>py$', '\/$', '*', '>swp$', '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeHightlight=1

let g:rainbow_active = 1
let g:rainbow_operators = 2
let g:rainbow_ctermfgs = [
            \ 'brown',
            \ 'Darkblue',
            \ 'darkgreen',
            \ 'darkcyan',
            \ 'darkred',
            \ 'darkmagenta',
            \ 'darkmagenta',
            \ 'Darkblue',
            \ 'darkgreen',
            \ 'darkcyan',
            \ 'darkred',
            \ 'red',
            \ ]

"###################### display settings ##########################
set textwidth=0
set wrapmargin=1
set wrap              " don't wrap lines
set linebreak
set nolist
set fo+=l
set scrolloff=2         " 2 lines above/below cursor when scrolling
set relativenumber
set number              " show line numbers
set showmatch           " show matching bracket (briefly jump)
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set wildmenu            " completion with menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2        " use 2 lines for the status bar
set matchtime=2         " show matching bracket for 0.2 seconds
set matchpairs+=<:>     " specially for html
set showtabline=2       " do not want to see how many files are open
set switchbuf=usetab       " switch to another window, possibly in another tab, if the buffer is currently displayed in another window

" editor settings
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set smartindent         " smart auto indenting
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set tabstop=2           " number of spaces a tab counts for
set shiftwidth=2       " spaces for autoindents
set expandtab           " turn a tabs into spaces
set foldnestmax=10
set foldlevel=1
set foldenable
set foldmethod=syntax
set fileformat=unix     " file mode is unix
set cc=100              " set colourcolum at 100
"set fileformats=unix,dos    # only detect unix file format, displays that ^M with dos files
" set noautochdir
" system settings
set lazyredraw          " no redraws in macros
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file'
set hidden              " remember undo after quitting
set history=100          " keep 100 lines of command history
set mouse=a             " use mouse in visual, normal,insert,command,help mode (shift key disables)
set undodir=~/.vim/undodir
set undofile
set undolevels=10000 "maximum number of changes that can be undone
set undoreload=100000 "maximum number lines to save for undo on a buffer reload
set incsearch
syntax on          " enable colors
set hlsearch       " highlight search (very useful!)
set incsearch       "search incremently (search while typing)
set splitright
set splitbelow

"####################################
"## Open close quickfix and locationlist
"###############################################
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>

"######################### Function Key Mappings ####################
nmap <F1> :ALEFix <cr>
nmap <F2> :cnext <cr>
nmap <F3> :cprev <cr>
map <F4> :cclose <cr> :lclose <cr>
nmap <F5> :NERDTreeToggle  <CR>
nmap <F6> :ALEHover <cr>
"nmap <F7> :setlocal spell! spelllang=en_gb<CR>
nnoremap j gj
nnoremap k gk
noremap gr :diffget //3<cr>
noremap gl :diffget //2<cr>
set diffopt+=vertical
" " Add and delete spaces in increments of `shiftwidth' for tabs
" " Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//
" " Convert all tab characters to two spaces
command! Untab :%s/\t/  /g
"
" set switchbuf=useopen,usetab,newtab
"  map <C-t><up> :tabr<cr>
"  map <C-t><down> :tabl<cr>
"  map <C-t><left> :tabp<cr>
"  map <C-t><right> :tabn<cr>
"################### Miscellaneous ##########################################
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;yellow\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  " silent !echo -ne "\033]12;red\007"
   " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

au BufWritePost *.* mksession! ~/session.vim
noremap <C-s> :source ~/session.vim

"#### EASY NAVIGATION IN INSERT MODE  ################################
noremap <A-j> <Left>
noremap <A-k> <Down>
noremap <A-l> <Up>
noremap <A-m> <Right>
inoremap <A-j> <Left>
inoremap <A-k> <Down>
inoremap <A-l> <Up>
inoremap <A-m> <Right>

"################### save on lost focus ###########################
au FocusLost * :wa
" save on lost focus/make etc.
set autoread autowrite
"######################### Easy window navigation #################
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"forgot to sudo before editing a file that requires root privileges
cmap w!! w !sudo tee % >/dev/null

" syntax enable
set termguicolors
set bg=dark
colorscheme solarized8
