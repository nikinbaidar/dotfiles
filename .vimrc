"         _
"  _   __(_)___ ___  __________
" | | / / / __ `__ \/ ___/ ___/
" | |/ / / / / / / / /  / /__
" |___/_/_/ /_/ /_/_/   \___/

" REMEMBER : Convention over configuration

" + It is a text editor, not an IDE
" + It probably has that feature built-in
" + Use only plugins that are functional
" + Read the documentation, it'll save you hours
" + You should know exactly what each line in your vimrc does
" + Don't seek mastery, seek proficiency
" + Visual clutter drains mental energy

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
    set mouse=n

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
    let $tty = system("ps hotty $$")
    if ($tty[0] ==# 'p') " # for case-sensitivity use ? for the opposite
        colorscheme jellybeans
    else
        colorscheme murphy
    endif

" Vim Plugins via. vim-plug -

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
    let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
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
        if ft == "vim"
             if getline('.') =~ "^\\s*\" *"
                normal! ^2x
            elseif getline('.') != ""
                normal! I" 
            endif

        elseif (ft == "javascript" || ft == "c" || ft == "cpp" ||
                    \ ft == "arduino" || ft == "java" )
            if getline('.') =~ "^\\s*// *"
                normal! ^3x
            elseif getline('.') != ""
                normal! I// 
            endif

        elseif (ft == "python" || ft == "sh" || ft == "conf")
            if getline('.') =~ "^\\s*# *"
                normal! ^2x
            elseif getline('.') != ""
                normal! I# 
            endif

        elseif (ft == "matlab" || ft == "tex")
            if getline('.') =~ "^\\s*% *"
                normal! ^2x
            elseif getline('.') != ""
                normal! I% 
            endif

        elseif (ft == "vimwiki")
            if getline('.') =~ "^\\s*%% *"
                normal! ^3x
            elseif getline('.') != ""
                normal! I%% 
            endif

        elseif (ft == "css" || ft == "sql")
             if getline('.') =~ "^\\s*/ *"
                normal! ma^3xg_2Xx^`a3h
            elseif getline('.') != ""
                normal! maI/* g_a */`a3l
            endif

        elseif ft == "html"
            if getline('.') =~ "^\\s*<!-- *"
                normal! ^5xg_3Xx^
            elseif getline('.') != ""
                normal! I<!-- g_a -->
            endif
        else
            echo "Undefined CommentLeader"
        endif
    endfunction

    function! CodeRunner()
        :write
        let ft = &filetype
        if ft == "python"
            :!clear && python3 %
        elseif ft == "javascript"
            :!clear && node %
        elseif ft == "c"
            :!clear ; gcc % -o ~/Code/c/coderunner && ~/Code/c/coderunner
        elseif ft == "cpp"
            :!clear ; g++ % -o ~/Code/cpp/coderunner && ~/Code/cpp/coderunner
        elseif ft == "arduino"
            :!clear ; arduino-cli compile --fqbn arduino:avr:uno %
        elseif ft == "tex"
            :!clear ; pdflatex -shell-escape %
        elseif ft == "tex"
            :!clear ; pdflatex -shell-escape %
        elseif ft == "sql"
            let @d = 'mavip rs`a'
            :normal! @d
        else
            echo "Undefined CodeRunner"
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
        " Switch Splits
        nnoremap <leader>h <C-w>h
        nnoremap <leader>j <C-w>j
        nnoremap <leader>k <C-w>k
        nnoremap <leader>l <C-w>l
        nnoremap <leader><Space> :normal! `h<CR>
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
        cnoremap <C-a> <C-b>

" Auto Commands -

    augroup RunOnEvent
        autocmd!
        autocmd FileType * set formatoptions=tq
        autocmd FileType vimwiki call Notetaking()
        " The following autocmd works with vim_surround plugin
        autocmd FileType tex let b:surround_{char2nr("'")} = "`\r'"
            \ | let b:surround_{char2nr("\"")} = "``\r''" | syntax enable
        autocmd FileType pdf OpenPdfs
        autocmd BufWinEnter *.* silent loadview
        autocmd BufWritePre * %s/\s\+$//e " strip trailing spaces on save
    augroup END

    if has("autocmd")
        " Automatically jump to the last cursor position on entering vim
        autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$")
            \ | execute "normal g'\"zz" | endif
    endif

" Abbreviations -

    abbr ture true
    abbr fasle false
    abbr adn and
    abbr teh the
    abbr tima ✓
    " Inserting Dates:
    iab <expr> today strftime("%a %b %d %Y")
    iab tomorrow <C-r>=system('date -d tomorrow +\%a\ \%b\ \%d\ \%Y')<CR><BS>

" Notetaking

    setlocal textwidth=70 " FIXME??
    setlocal cursorcolumn
    setlocal spell
    setlocal complete+=kspell
    setlocal spellcapcheck=\_[\])'"   ]\+

    function! Notetaking()

      " PDF Related Configs:

      " Explicitly Reload LaTeX Files

        if (getcwd() =~ '/home/nikin/markdown_notes/[A-Z]*/*/*' ||
                    \ getcwd() =~ '/home/nikin/notes/*/*/*' &&
                    \ &filetype=='vimwiki')
            let g=expand('%<:p')
            let b=char2nr(g[0])
            if (b >= 97 && b < 123)
                set filetype=tex
                syntax enable
                setlocal textwidth=70 " FIXME??
            endif
        endif

      " LaTeX Compiling

      nnoremap <F2> :call CompileParent()<CR><CR><CR>
      function! CompileParent()
          :write!
          :cd ..
          execute (" ! clear && pdflatex -shell-escape [a-z]*.tex")
          cd -
      endfunction

      " opens pdfs when invoked appropirately
      nnoremap <F6> :open *.pdf<CR>
      command!  OpenPdfs execute ("silent ! zathura --fork % " )
            \ | bdelete | edit %


      inoremap <C-\> <C-[>:call InsertCodeBlock()<CR>o

      " Insert Code Blocks w/ Proper Syntax Highlighting:
      function! InsertCodeBlock()
          " Insert code blocks with proper highlighting:
          if getcwd() =~ 'home/Nikin/Notes/JavaScript/*/*'
              :normal! I{{{javascript>>...o}}}k
          elseif getcwd() =~ 'home/Nikin/Notes/C++/*/*'
              :normal! I{{{cpp>>...o}}}k
          elseif getcwd() =~ 'home/Nikin/Notes/HTML & CSS/HTML*/*'
              :normal! I{{{html>>...o}}}k
          elseif getcwd() =~ 'home/Nikin/Notes/HTML & CSS/CSS*/*'
              :normal! I{{{css>>...o}}}k
          else
              :echo "Undefined Code Block"
          endif
      endfunction

      command!  Hex execute ("split" ) | edit .

    endfunction
