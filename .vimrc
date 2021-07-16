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
    set wildmenu
    set wildmode=list,full
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

    call plug#begin('~/.vim/plugged')
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'jiangmiao/auto-pairs'
    Plug 'kezhenxu94/vim-mysql-plugin'
    Plug 'vimwiki/vimwiki'
    call plug#end()

" Configs -

    " let g:netrw_banner = 0
    " let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
    let g:netrw_bufsettings = 'number nowrap'
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<C-h>"
    let g:rainbow_active = 1
    let g:rainbow_conf = {'guifgs': ['yellow', 'cyan', 'mediumpurple',
                \  'lightgreen'], 'ctermfgs': ['yellow', 'cyan', 'magenta',
                \  'lightgreen'], 'separately':{'html':0}}
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

        elseif (ft == "css" || ft == "sql")
            if     getline('.') =~ "^\\s*/ *"    | normal! ma^3xg_2Xx^`a3h
            elseif getline('.') != ""            | normal! maI/* g_a */`a3l
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
        : write!
        let    ft =  &filetype
        if     ft == "tex"        | ! clear && pdflatex -shell-escape %
        elseif ft == "python"     | ! python3 %
        elseif ft == "javascript" | ! node %
        elseif ft == "c"          | ! gcc % -o ~/code/c/coderunner && ~/code/c/coderunner
        elseif ft == "cpp"        | ! g++ % -o ~/code/cpp/coderunner && ~/code/cpp/coderunner
        elseif ft == "sql"        | let @d = 'mavip rs`a' | :normal! @d
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

" Mappings -

        let mapleader = "\<Space>"

        " Normal Mode Mappings:
        nnoremap <M-k> :normal! kmajdd`aP<CR>
        nnoremap <M-j> :normal! ddp<CR>
        nnoremap <M-S-k> :normal! yyP<CR>
        nnoremap <M-S-j> :normal! yyp<CR>
        nnoremap <leader>o :normal! magqip`a<CR>
        nnoremap <silent><leader>/ :call ToggleComment()<CR>
        nnoremap <F9> :call CodeRunner()<CR>
        nnoremap <F2> :call CompileParent()<CR><CR><CR>
        nnoremap <F6> :call OpenPDF()<CR>
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
        inoremap <C-j> <C-o>o
        inoremap <F9>  <C-o>:call CodeRunner()<CR>
        " Autocompletion
        inoremap <expr> k pumvisible()?"<C-p>":"k"
        inoremap <expr> j pumvisible()?"<C-n>":"j"
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
        autocmd FileType vimwiki call Notetaking()
        " netrw_browse_split = 0 like behaviour with set hidden
        autocmd FileType netrw setlocal bufhidden=wipe
        " The following autocmd works with vim_surround plugin
        autocmd FileType tex let b:surround_{char2nr("'")} = "`\r'"
            \ | let b:surround_{char2nr("\"")} = "``\r''" | syntax enable
        autocmd BufWinEnter *.* silent loadview
        autocmd BufWritePre * %s/\s\+$//e " strip trailing spaces on save
        autocmd BufWritePre *.html,*.css call ReloadBrowser()
    augroup END

    if has("autocmd")
        " Automatically jump to the last cursor position on entering vim
        autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$")
            \ | execute "normal g'\"zz" | endif
    endif

" User-defined Commands -

    command! Vimconfig execute("tabnew ~/.vimrc")
    command! Dict execute("tabnew ~/notes/Archives/.lexicon.md")
    command! AddBibliography execute("call BiblatexCompile()")
    command! Parent execute("silent tabnew ../*.tex")
    command! Notes execute("tabnew ~/notes/.index.md")
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

" Notetaking

    function! Notetaking()

        setlocal textwidth=70 " FIXME??
        setlocal cursorcolumn
        setlocal spell
        setlocal complete+=kspell
        setlocal spellcapcheck=\_[\])'"   ]\+

        " Explicitly Reload tex Files
        if (getcwd() =~ '/home/nikin/notes/*/*/*')
            let g=expand('%<:p')
            let b=char2nr(g[0])
            if (b >= 97 && b < 123)
                set filetype=tex
                syntax enable
                setlocal textwidth=70 " FIXME??
            endif
        endif

        command! Hex execute ("split" ) | edit . " Hex breaks syntax

    endfunction
