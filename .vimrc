"        _ _    _       _           _     _
"  _ __ (_) | _(_)_ __ | |__   __ _(_) __| | __ _ _ __
" | '_ \| | |/ / | '_ \| '_ \ / _` | |/ _` |/ _` | '__|
" | | | | |   <| | | | | |_) | (_| | | (_| | (_| | |
" |_| |_|_|_|\_\_|_| |_|_.__/ \__,_|_|\__,_|\__,_|_|

" github: nikinbaidarr

" General Setup -
    set nocompatible
    set noswapfile
    set number relativenumber
    set wrap
    set linebreak
    set textwidth=80
    set colorcolumn=81
    set autoindent
    set breakindent
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set incsearch
    set hlsearch
    set hidden
    set ignorecase
    set wildmenu
    set wildmode=list
    set showcmd
    set confirm
    set splitright
    set splitbelow
    set expandtab
    set autochdir
    set laststatus=1
    set path+=**

" Appearance -
    syntax on
    filetype indent on
    colorscheme jellybeans

    function! VimwikiColors()
        syntax enable
        hi VimwikiHeader1 ctermfg=187 guifg=#d7d7af
        hi VimwikiHeader2 ctermfg=158 guifg=#afffd7
        hi VimwikiHeader3 ctermfg=116 guifg=#87d7d7
        hi VimwikiLink ctermfg=195 cterm=NONE
        hi VimwikiTODO ctermfg=189 cterm=bold ctermbg=NONE
    endfunction

" Vim Plugins -
    " This Plugins are managerd via. Vim Plug
    filetype plugin on
    call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'vimwiki/vimwiki'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'luochen1990/rainbow'
    call plug#end()

" Configurations -
    let g:tex_flavor="latex"
    let g:netrw_banner=0
    let g:netrw_winsize=25
    let g:netrw_list_hide='.*\.aux$,.*\.pdf$,.*\log$,.*\out$,.*\.toc$,.*\.maf$,.*\.mtc0$,.*\mtc1$,.*\.mtc2$,.*\.mtc3$,.*\.out$,\(^\|\s\s\)\zs\.\S\+'
    let g:netrw_bufsettings='noma nomod nu nobl nowrap ro'
    let g:vimwiki_list = [{'path':'~/Notes'}]
    let g:vimwiki_table_mappings=0
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<C-h>"
    let g:rainbow_active = 1
    let g:rainbow_conf = {'guifgs': ['yellow', 'cyan', 'mediumpurple',
                \  'lightgreen'], 'ctermfgs': ['yellow', 'cyan', 'magenta',
                \  'lightgreen'], 'separately':{'html':0}}

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
        nnoremap <M-Up> :normal! kmajdd`aP<CR>
        nnoremap <M-Down> :normal! ddp<CR>
        nnoremap <M-S-Up> :normal! yyP<CR>
        nnoremap <M-S-Down> :normal! yyp<CR>
        nnoremap <C-s> :w ++enc=utf-8<CR>
        nnoremap <F9> :call CodeRunner()<CR>
        " Switch Splits
        nnoremap <silent><C-h> <C-w>h
        nnoremap <silent><C-j> <C-w>j
        nnoremap <buffer><C-k> <C-w>k
        nnoremap <buffer><C-l> <C-w>l
        nnoremap <leader>e :edit %<CR>
        " Switch Buffers
        nnoremap <C-Left> :bprevious<CR>
        nnoremap <C-Right> :bnext<CR>

        " Insert Mode Mappings:
        inoremap <M-Up> <C-o>:normal! kmajdd`aP<CR>
        inoremap <M-Down> <C-o>:normal! ddp<CR>
        inoremap <M-S-Up> <C-o>:normal! yyP<CR>
        inoremap <M-S-Down> <C-o>:normal! yyp<CR>
        inoremap <C-a> <C-o>:normal! ^<CR>
        inoremap <C-e> <C-o>:normal! $<CR>
        inoremap <C-u> <C-o>:normal! d^<CR>
        inoremap <C-k> <C-o>:normal! d$<CR>
        inoremap <C-j> <C-o>o
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
        autocmd FileType * set formatoptions=trq
        autocmd FileType c,cpp setlocal comments-=:// comments+=f://
        autocmd FileType help wincmd L
        autocmd FileType pdf OpenPdfs
        autocmd BufWinEnter *.* silent loadview | set foldopen-=hor
        autocmd BufWritePre * %s/\s\+$//e " strip trailing spaces on save
        autocmd BufWritePre *.html,*.css, :silent !bash $HOME/.reloadFirefox.sh
        autocmd BufEnter * highlight OverLength ctermfg=red ctermbg=black
        autocmd BufEnter * match OverLength /\%82v.*/
        " Block Commenting On Certain Files: FIXED
        autocmd BufEnter *.html vnoremap <silent><leader>\ dO<!----><C-[>k$p
        autocmd BufEnter *.css vnoremap <silent><leader>\ dO/**/<C-[>k$p
        autocmd FileType tex let b:surround_{char2nr("'")} = "`\r'"
            \ | let b:surround_{char2nr("\"")} = "``\r''" | syntax enable
        autocmd FileType vimwiki :call Notetaking() | call ReloadTex()
            \ | call VimwikiColors()
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
        setlocal textwidth=70
        setlocal complete+=kspell
        setlocal spellcapcheck=\_[\])'"   ]\+

        function! ReloadTex()
            if (getcwd() =~ '/home/nikin/Notes/*/*/*' && &filetype=='vimwiki')
                let g=expand('%<:p')
                let b=char2nr(g[0])
                if (b >= 97 && b < 123)
                    set filetype=tex
                endif
            endif
        endfunction

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

      "Mappings For Notetaking Purposes:

      inoremap <C-\> <C-[>:call InsertCodeBlock()<CR>o
      nnoremap <leader>o :normal! magqip`a<CR>
      " LaTeX compiling & PDF related bindings
      nnoremap <F2> :CompilePricnipalTexFile<CR><CR><CR>
      nnoremap <F6> :open *.pdf<CR>

      " The following command is mapped to <F2>
      command! CompilePricnipalTexFile :w! | cd .. |
            \ execute ("! clear && pdflatex -shell-escape [a-z]*.tex") | cd -

      " The following command pertains to <F6>
      command!  OpenPdfs execute ("silent ! zathura --fork %") | bdelete | e %

    endfunction
