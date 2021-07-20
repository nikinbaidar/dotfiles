"         _
"  _   __(_)___ ___  __________
" | | / / / __ `__ \/ ___/ ___/
" | |/ / / / / / / / /  / /__
" |___/_/_/ /_/ /_/_/   \___/

" General Setup -

filetype plugin indent on

set noswapfile
set showcmd

set ignorecase
set wildmenu wildmode=list,full
set autochdir
set path+=**

set cursorline
set number relativenumber
set mouse=n " enable mouse scrolling

set wrap
set linebreak
set textwidth=80

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set breakindent

set splitright
set splitbelow
set hidden
set confirm

" Appearance -

syntax on
colorscheme jellybeans

" Vim Plugins -

" These plugins are managed via vim-plug

call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki'
Plug 'kezhenxu94/vim-mysql-plugin'
call plug#end()

" Configs -

let g:netrw_bufsettings = 'number nowrap'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-h>"
let g:vimwiki_table_mappings = 0
let g:tex_flavor="latex"

" Custom Plugins -

function! ToggleComment()

    let ft = &filetype

    if (ft == "sh" || ft == "r" || ft == "python" ||
                \ ft == "sh" || ft == "conf")

        if     getline('.') =~ "^\\s*# *"    | normal! ^2x
        elseif getline('.') != ""            | normal! I# 
        endif

    elseif (ft == "matlab" || ft == "tex")
        if     getline('.') =~ "^\\s*% *"    | normal! ^2x
        elseif getline('.') != ""            | normal! I% 
        endif


    elseif (ft == "javascript" || ft == "c" || ft == "cpp" ||
                \ ft == "arduino" || ft == "java")

        if     getline('.') =~ "^\\s*// *"   | normal! ^3x
        elseif getline('.') != ""            | normal! I// 
        endif

    elseif (ft == "html" || ft == "markdown" || ft == "vimwiki")
        if     getline('.') =~ "^\\s*<!-- *" | normal! ^5xg_3Xx^
        elseif getline('.') != ""            | normal! I<!-- g_a -->
        endif

    elseif (ft == "vim")
        if     getline('.') =~ "^\\s*\" *"   | normal! ^2x
        elseif getline('.') != ""            | normal! I" 
        endif

    else | echo "Undefined CommentLeader"
    endif
endfunction

function! CodeRunner()
    :write!
    let ft =  &filetype
    if ft == "javascript" | ! node %
    elseif ft == "tex"    | ! clear && pdflatex -shell-escape %
    elseif ft == "python" | ! python3 %
    elseif ft == "sql"    | let @d = 'mavip rs`a' | :normal! @d
    elseif ft == "c"      | ! gcc % -o ~/code/c/runcode && ~/code/c/runcode
    elseif ft == "cpp"    | ! g++ % -o ~/code/cpp/runcode && ~/code/cpp/runcode
    else
        echo "Undefined CodeRunner!"
    endif
endfunction

function! ReloadBrowser()
    :silent !bash ~/scripts/reloadFirefox.sh
    :silent !bash ~/scripts/reloadFirefox.sh
endfunction

function! CompileParent()
    :write!
    :cd ..
    :execute (" ! clear && pdflatex [a-z]*.tex")
    :cd -
endfunction

function! BiblatexCompile()
    :! clear ; biber %:r
    silent call CodeRunner()
endfunction

function! OpenPDF()
    if (&filetype == "tex")
        let g:pdffile = expand("%:r").".pdf"
        execute ("silent ! zathura --fork") g:pdffile
    elseif (&filetype == 'vimwiki')
        let g:pdffile = "*.pdf"
        execute ("silent ! zathura --fork") g:pdffile
    endif
endfunction
function! OpenLatexSourceCode()

    if (getcwd() =~ '/home/nikin/notes/*' && expand('%') == ".chapters.md")
        execute ("tabnew *.tex")
    elseif (getcwd() =~ '/home/nikin/notes/*')
        execute ("tabnew ../*.tex")
    endif
endfunction

" Mappings -

let mapleader = "\<Space>"

" Normal Mode Mappings:
nnoremap <M-k> :normal! km5jdd`5P<CR>
nnoremap <M-j> :normal! ddp<CR>
nnoremap <M-S-k> :normal! yyP<CR>
nnoremap <M-S-j> :normal! yyp<CR>
nnoremap <leader>o :normal! magqip`a<CR>
nnoremap <silent><leader>/ :call ToggleComment()<CR>
nnoremap <F2> :call CompileParent()<CR><CR><CR>
nnoremap <F6> :call OpenPDF()<CR>
nnoremap <F9> :call CodeRunner()<CR>
" Switch Splits
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
" Switching and Deleting Buffers
nnoremap <leader>s :buffers<CR>:buffer<Space>
nnoremap <leader>d :buffers<CR>:bdelete<Space>

" Insert Mode Mappings:
inoremap <C-a> <C-o>:normal! ^<CR>
inoremap <C-e> <C-o>:normal! $<CR>
inoremap <C-u> <C-o>:normal! d^<CR>
inoremap <C-k> <C-o>:normal! d$<CR>
" Autocompletion
inoremap <expr> j pumvisible()?"<C-n>":"j"
inoremap <expr> k pumvisible()?"<C-p>":"k"
inoremap <expr> q pumvisible()?"<C-e>":"q"

" Command Mode Mappings:
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Visual Mode Mappings:
vnoremap <leader><Space> :! boxes -d blockquote<CR>

" Auto Commands -

augroup RunOnEvent
    autocmd!
    autocmd FileType * set formatoptions=tq
    autocmd BufWinEnter *.* silent loadview
    autocmd BufWritePre * %s/\s\+$//e " strip trailing spaces
    autocmd BufWritePre *.html,*.css call ReloadBrowser()
augroup END

if has("autocmd")
    " Automatically jump to the last cursor position on entering vim
    autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$")
                \ | execute "normal g'\"zz" | endif
endif

" User-defined Commands -

command! Vimconfig execute("tabnew ~/.vimrc")
command! AddBibliography execute("call BiblatexCompile()")
" Sosukodo is japanese for source code
command! Sosukodo execute("call OpenLatexSourceCode()")
command! Notes execute("tabnew ~/notes/.index.md")
command! Wordbook execute("tabnew ~/notes/Archives/.lexicon.md")
command! Bookmarks execute("tabnew ~/notes/Archives/.bookmarks.md")

" Abbreviations -

abbr ture true
abbr fasle false
abbr adn and
abbr teh the
abbr tima ✓
abbr fmri fMRI
" Inserting Dates:
iab <expr> today strftime("%a %b %d %Y")
iab tomorrow <C-r>=system('date -d tomorrow +\%a\ \%b\ \%d\ \%Y')<CR><BS>

