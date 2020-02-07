
"
set shell=/bin/bash
"let mapleader = "\<Space>"
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-denite'
Plug 'chemzqm/denite-git'
Plug 'chemzqm/todoapp.vim'


Plug 'morhetz/gruvbox'

Plug 'takac/vim-hardtime'

" Plug 'zxqfl/tabnine-vim'

Plug 'justinmk/vim-sneak'
Plug 'wincent/terminus'

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
Plug 'airblade/vim-gitgutter'

Plug 'reedes/vim-litecorrect'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
"nicer quotes when writing prose
" Plug 'kana/vim-textobject-user'
" Plug 'reedes/vim-textobj-quote'
" Plug 'reedes/vim-textobj-sentence'
Plug 'junegunn/limelight.vim'
"Spell suggestions in window
Plug 'dahu/vimple'
" Plug 'mhinz/vim-signify'
" Search for a project root (.git etc) and make that home.
Plug 'airblade/vim-rooter'
"Displays function signatures from completions in the command line.
Plug 'Shougo/echodoc.vim'
"Vim support for editing fish scripts
Plug 'dag/vim-fish'
" File explorere
Plug 'scrooloose/nerdtree'
" Git helper
Plug 'jreybert/vimagit'
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
" Plug 'tomtom/tcomment_vim'
Plug 'oblitum/rainbow'
" Plug 'ap/vim-buftabline'
" Plug 'lifepillar/vim-solarized8'
" In quickfix :Enmasse will open a buffer with each line form each file in it.
Plug 'Olical/vim-enmasse'
" Plug 'rhysd/rust-doc.vim'
" Plug 'Shougo/denite.nvim'


" Initialize plugin system
call plug#end()

" =============================================================================
" # Mappings
" =============================================================================
nnoremap <silent> <leader><leader>f :NV<CR>
noremap <c-Down> <c-e>
noremap <c-Up> <c-y>
noremap <S-Down> <c-d>
noremap <S-Up> <c-u>
" Leftt and right switch buffers
nnoremap <c-left> :bp<CR>
nnoremap <c-right> :bn<CR>
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>
" Jump to start and end of line using the home row keys
map H ^
map L $
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for rename current word
nmap <leader>cw <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "CustomPatt[ae]rn", "NERD.*" ]
let g:hardtime_ignore_quickfix = 1

if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif
"WIKI
" let wiki.nested_syntaxes = {'ruby': 'ruby', 'python': 'python', 'c++': 'cpp', 'sh': 'sh', 'racket': 'racket', 'rust': 'rust'}
let g:vimwiki_hl_headers = 1
let g:nv_search_paths = ['src/', '~/Devel/wiki']

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


let g:sneak#s_next = 1
" let g:sneak#label = 1
" Open hotkeys
" press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

" =============================================================================
" # Keyboard shortcuts
" =============================================================================





" Left and right can switch buffers

let g:rustfmt_command = "rustfmt"
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"

" Completion
" set completeopt=noinsert,menuone,noselect
set complete+=kspell
set hidden
        " let g:rainbow_levels = [
    " \{'ctermfg': 2, 'guifg': '#859900'},
    " \{'ctermfg': 6, 'guifg': '#2aa198'},
    " \{'ctermfg': 4, 'guifg': '#268bd2'},
    " \{'ctermfg': 5, 'guifg': '#6c71c4'},
    " \{'ctermfg': 1, 'guifg': '#dc322f'},
    " \{'ctermfg': 3, 'guifg': '#b58900'},
    " \{'ctermfg': 8, 'guifg': '#839496'},
    " \{'ctermfg': 7, 'guifg': '#586e75'}]
au BufNewFile,BufRead *.rs set filetype=rust
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.elm set filetype=elm
let g:elm_format_autosave = 1
" autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo | set makeprg=cargo | set errorformat=%Eerror%m,%Z\ %#-->\ %f:%l:%c
autocmd BufWritePost *.rs | :RustFmt
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
" #######################################################
" ################### COC ###############################
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

set path+=**
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=900

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" USe cursors
nmap <silent> <C-c> <Plug>(coc-cursors-position)
" nmap <silent> <C-d> <Plug>(coc-cursors-word)
" xmap <silent> <C-d> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)

" ###################  RUST  #########################

let RUST_SRC_PATH=$RUST_SRC_PATH
let g:ycm_rust_src_path = $RUST_SRC_PATH
nnoremap <silent> <Leader>b :make build  <CR> <bar> :copen <CR>
nnoremap <silent> <Leader>r :make run  <CR> <bar> :copen <CR>
nnoremap <silent> <Leader>l :make clippy --all  <CR> <bar> :copen <CR>
nnoremap <silent> <Leader><leader>l :make clippy --all -- -W clippy::all -W clippy::pedantic  -W clippy::nursery -D warnings <CR> <bar> :copen <CR>
nnoremap <silent> <Leader>t :make test -- --nocapture <CR>
let g:rustfmt_autosave = 1
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


autocmd BufWritePre * :%s/\s\+$//e
let g:airline_theme='gruvbox'
let g:airline#extensions#coc#enabled = 1
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
" nmap ; :CtrlPBuffer<CR>
"nmap <leader>a :CtrlPTag<CR>
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

" nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
" nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>

"######################### Function Key Mappings ####################
nmap <F2> :cp <cr>
nmap <F3> :cn <cr>
map <F4> :cclose <cr> :lclose <cr>
nmap <F5> :NERDTreeToggle  <CR>
"nmap <F7> :setlocal spell! spelllang=en_gb<CR>
nnoremap j gj
nnoremap k gk
noremap dr :diffget //3<cr>
noremap dl :diffget //2<cr>
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

au BufWritePost *.* mksession! ~/session.vim
noremap <C-s> :source ~/session.vim

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
colorscheme gruvbox
