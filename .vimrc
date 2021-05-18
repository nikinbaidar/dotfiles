"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

" Convention over configuration

" General Setup -
    set nocompatible
    set noswapfile

    set showcmd

    " For Moving Around:
    set number
    set relativenumber
    set mouse=n " Enable mouse scrolling in --Normal--
    set cursorline

    " Line Wrapping:
    set wrap
    set linebreak
    set textwidth=80
    " set colorcolumn=81

    " Indentations:
    filetype indent on
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set autoindent
    set smartindent
    set breakindent

    " Searching:
    set incsearch
    set hlsearch
    set ignorecase
    set wildmenu
    set wildmode=list
    set autochdir " remove this if you remove vimwiki
    set path+=**

    " Splits And Buffers:
    set splitright
    set splitbelow
    set hidden
    set confirm

" Appearance -
    syntax on
    colorscheme jellybeans

" Vim Plugins -

    " These Plugins are managerd via. Vim Plug

    " curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    " https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    filetype plugin on
    call plug#begin('~/.vim/plugged')
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'luochen1990/rainbow'
    Plug 'vimwiki/vimwiki'
    call plug#end()

" Configurations -
    filetype indent on
    let g:netrw_banner = 0
    let g:netrw_list_hide = '*\.pdf$,\(^\|\s\s\)\zs\.\S\+'
    let g:netrw_bufsettings = 'nu' " Show numbers on netrw buffer
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<C-h>"
    let g:vimwiki_list = [{'path':'~/Notes'}]
    let g:rainbow_active = 1
    let g:rainbow_conf = {'guifgs': ['yellow', 'cyan', 'mediumpurple',
                \  'lightgreen'], 'ctermfgs': ['yellow', 'cyan', 'magenta',
                \  'lightgreen'], 'separately':{'html':0}}
    let g:tex_flavor="latex"

" Custom Functions -
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

        elseif ft == "css"
             if getline('.') =~ "^\\s*/ *"
                normal! ^3xg_2Xx^
            elseif getline('.') != ""
                normal! I/* g_a */
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
        let ft = &filetype
        :write
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
        nnoremap <C-s> :w ++enc=utf-8<CR>
        nnoremap <F9> :call CodeRunner()<CR>
        " Switch Splits FIXED
        nnoremap <leader>h <C-w>h
        nnoremap <leader>j <C-w>j
        nnoremap <leader>k <C-w>k
        nnoremap <leader>l <C-w>l
        " Switch Buffers
        nnoremap <C-Left> :bprevious<CR>
        nnoremap <C-Right> :bnext<CR>

        " Insert Mode Mappings:
        inoremap <C-a> <C-o>:normal! ^<CR>
        inoremap <C-e> <C-o>:normal! $<CR>
        inoremap <C-u> <C-o>:normal! d^<CR>
        inoremap <C-k> <C-o>:normal! d$<CR>
        inoremap <C-l> <Del>
        inoremap <F9> <C-o>:call CodeRunner()<CR>
        " Autocompletion
        inoremap <expr> k pumvisible()?"<C-p>":"k"
        inoremap <expr> j pumvisible()?"<C-n>":"j"
        inoremap <expr> q pumvisible()?"<C-e>":"q"

        " Global Mappings:
        map <silent><leader>/ :call ToggleComment()<CR>
        map <silent><leader><Space> :nohlsearch<CR>

" Auto Commands -
    augroup RunOnEvent
        autocmd!
        autocmd FileType * set formatoptions=tq
        autocmd FileType c,cpp setlocal comments-=:// comments+=f://
        autocmd FileType vimwiki :call Notetaking()
        autocmd FileType tex let b:surround_{char2nr("'")} = "`\r'"
            \ | let b:surround_{char2nr("\"")} = "``\r''"
        autocmd FileType help wincmd L
        autocmd FileType pdf OpenPdfs " Works only from vimwiki
        autocmd BufWinEnter *.* silent loadview | set foldopen-=hor
        autocmd BufWritePre * %s/\s\+$//e " strip trailing spaces on save
        " Block Commenting On Certain Files: TODO Remove this and bind boxes
        autocmd BufEnter *.html vnoremap <silent><leader>\ dO<!----><C-[>k$p
        autocmd BufEnter *.css vnoremap <silent><leader>\ dO/**/<C-[>k$p
    augroup END

    if has("autocmd")
        " Automatically jump to the last cursor position on entering vim
        autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$")
            \ | execute "normal g'\"" | endif
    endif

" Abbreviations -
    abbr ture true
    abbr fasle false
    abbr adn and
    abbr teh the

" Notetaking -
    function! Notetaking()

        syntax enable

        setlocal textwidth=70 " FIXME??
        setlocal complete+=kspell
        setlocal spellcapcheck=\_[\])'"   ]\+

        " Explicitly Reload LaTeX Files:
        if (getcwd() =~ '/home/nikin/Notes/*/*/*' && &filetype=='vimwiki')
            let g=expand('%<:p')
            let b=char2nr(g[0])
            if (b >= 97 && b < 123)
                set filetype=tex
                syntax enable
            endif
        endif

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

      " Some Mappings For Notetaking Purposes:

      " Reflow Paragraph
      nnoremap <leader>o :normal! magqip`a<CR>

      " LaTeX Compiling
      nnoremap <F2> :CompileParent<CR><CR><CR>
      command! CompileParent :w! | cd .. |
            \ execute ("! clear && pdflatex -shell-escape [a-z]*.tex") | cd -

      " Opening PDFs : Invoke Appropirately
      nnoremap <F6> :open *.pdf<CR>
      command!  OpenPdfs execute ("silent ! zathura --fork %")
            \ | bdelete | edit %

      inoremap <C-\> <C-[>:call InsertCodeBlock()<CR>o

    endfunction
