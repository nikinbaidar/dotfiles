"        _ _    _       _           _     _
"  _ __ (_) | _(_)_ __ | |__   __ _(_) __| | __ _ _ __
" | '_ \| | |/ / | '_ \| '_ \ / _` | |/ _` |/ _` | '__|
" | | | | |   <| | | | | |_) | (_| | | (_| | (_| | |
" |_| |_|_|_|\_\_|_| |_|_.__/ \__,_|_|\__,_|\__,_|_|

" github: nikinbaidarr

" General Setup -
    set nocompatible
    set noswapfile
    set nowrap
    set incsearch
    set hlsearch
    set number relativenumber
    set ignorecase
    set wildmenu
    set wildmode=list
    set showcmd
    set confirm
    set splitright
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set autoindent
    set autochdir
    set laststatus=0
    set path+=**

" Appearance -
    syntax on
    colorscheme jellybeans
    function! CustomColors()
        if &filetype == 'vimwiki'|| &filetype == 'tex'
            syntax enable
            hi LineNr ctermfg=245 guifg=#d0d0d0
            hi VimwikiHeader1 ctermfg=187 guifg=#d7d7af
            hi VimwikiHeader2 ctermfg=158 guifg=#afffd7
            hi VimwikiHeader3 ctermfg=116 guifg=#87d7d7
            hi VimwikiLink ctermfg=195 cterm=NONE
            hi VimwikiTODO ctermfg=189 cterm=bold ctermbg=NONE
        endif
    endfunction

" Netrw Setup -
    let g:netrw_banner=0
    let g:netrw_winsize=25
    let g:netrw_liststyle=3
    let g:netrw_browse_split=0
    let g:netrw_list_hide='.*\.aux$,.*\.pdf$,.*\log$,.*\out$,.*\.toc$,.*\.maf$,.*\.mtc0$,.*\mtc1$,.*\.mtc2$,.*\.mtc3$,.*\.out$,\(^\|\s\s\)\zs\.\S\+'
    let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" Vim Plug -
    filetype plugin on
    call plug#begin('~/.vim/plugged')
    Plug 'vimwiki/vimwiki'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'luochen1990/rainbow'
    call plug#end()

" Configuration -
    let mapleader = "\<Space>"
    let g:tex_flavor="latex"
    let g:vimwiki_list = [{'path':'~/Notes'}]
    let g:vimwiki_table_mappings=0
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<C-h>"
    let g:UltiSnipsEditSplit="vertical"
    let g:rainbow_active = 1
    let g:rainbow_conf = {'guifgs': ['yellow', 'cyan', 'mediumpurple',
                \  'lightgreen'], 'ctermfgs': ['yellow', 'cyan', 'magenta',
                \  'lightgreen'], 'separately':{'html':0}}

" Custom Plugins -
    function! ToggleComment()
        let ft = &filetype
        if ft == "vim"
             if getline('.') =~ "^\\s*\" *"
                normal! ^2x
            elseif getline('.') != ""
                normal! I" 
            endif

        elseif (ft == "javascript" || ft == "c" || ft == "cpp" || ft == "arduino" || ft == "java" )
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
        :w
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
        elseif ft == "vimwiki"
            :edit %
            :!clear ; pdflatex -shell-escape %
        else
            echo "Undefined CodeRunner"
        endif
    endfunction

    function! ReadPDF()
        execute "silent !zathura --mode=fullscreen --fork %"
        execute "bdelete"
        :edit %
    endfunction

      function! ReloadTex()
          let g=expand('%<:p')
          let b=char2nr(g[0])
          if (b >= 97 && b < 123 && &filetype=='vimwiki')
              set filetype=tex
          endif
      endfunction


" Mappings -
    function! VimMappings()
        " Normal Mode Mappings:
        nnoremap <M-Up> :normal! kmajdd`aP<CR>
        nnoremap <M-Down> :normal! ddp<CR>
        nnoremap <M-S-Up> :normal! yyP<CR>
        nnoremap <M-S-Down> :normal! yyp<CR>
        nnoremap <C-s> :w ++enc=utf-8<CR>
        nnoremap <F9> :call CodeRunner()<CR>
        " Switch Splits
        nnoremap <buffer><C-l> <C-w>l
        nnoremap <buffer><C-h> <C-w>h
        nnoremap <silent><C-j> <C-w>j
        nnoremap <buffer><C-k> <C-w>k
        nnoremap <leader>v :call OpenSplitRight()<CR>
        nnoremap <leader>e :edit %<CR>
        " Switch Buffers
        nnoremap <C-Left> :bp<CR>
        nnoremap <C-Right> :bn<CR>

        " Insert Mode Mappings:
        inoremap <M-Up> <C-o>:normal! kmajdd`aP<CR>
        inoremap <M-Down> <C-o>:normal! ddp<CR>
        inoremap <M-S-Up> <C-o>:normal! yyP<CR>
        inoremap <M-S-Down> <C-o>:normal! yyp<CR>
        inoremap <F9> <C-o>:call CodeRunner()<CR>
        inoremap <C-a> <C-o>:normal! ^<CR>
        inoremap <C-e> <C-o>:normal! $<CR>
        inoremap <C-u> <C-o>:normal! d^<CR>
        inoremap <C-k> <C-o>:normal! d$<CR>
        inoremap <C-f> <C-o>:normal! dw<CR>
        inoremap <C-j> <C-o>o
        " Autocompletion
        inoremap <expr> k pumvisible()?"<C-p>":"k"
        inoremap <expr> j pumvisible()?"<C-n>":"j"
        inoremap <expr> q pumvisible()?"<C-e>":"q"
        " inoremap <F2> <C-R>=strftime("%Y%m%d%H%M%S")<CR>

        " Global Mappings:
        map <silent><leader>/ :call ToggleComment()<CR>
        map <leader>c :bdelete<CR>
        map <silent><leader><leader> :nohlsearch<CR>
    endfunction

" Auto Commands -
    augroup RunOnEvent
        autocmd!
        autocmd VimEnter * if !argc() && getcwd() =~ '/home/nikin/Code/*/*' || getcwd() =~ '/home/nikin/sketchbook/*/*' | Sex | endif
        autocmd FileType * call VimMappings() | setlocal formatoptions-=c formatoptions-=r formatoptions-=o | call CustomColors() | set colorcolumn=81
        autocmd FileType c,cpp setlocal comments-=:// comments+=f://
        " autocmd FileType html,css setlocal shiftwidth=2 tabstop=2 softtabstop=2
        autocmd FileType help wincmd L
        autocmd FileType vimwiki :call Notetaking() | call ReloadTex() | syn match markdownError "\w\@<=\w\@="
        " autocmd FileType vimwiki :call Notetaking() | :call ReloadTex() | syn match markdownError "\w\@<=\w\@="
        autocmd FileType tex let b:surround_{char2nr("'")} = "`\r'" | let b:surround_{char2nr("\"")} = "``\r''"
        autocmd FileType pdf :call ReadPDF()
        autocmd FileType arduino command! Upload :w! | execute ("!clear && arduino-cli compile --fqbn arduino:avr:uno % && arduino-cli upload --port /dev/ttyACM0 --fqbn arduino:avr:uno %")
        autocmd BufWinEnter ~/.vimrc silent loadview | set foldopen-=hor
        autocmd BufWinEnter *.* silent loadview | set foldopen-=hor
        autocmd BufWritePre * %s/\s\+$//e " strip trailing spaces on save
        " autocmd BufEnter * highlight OverLength ctermfg=red guifg=red
        " autocmd BufEnter * match OverLength /\%81v.*/
        " Block Commenting On Certain Files: FIXED (may add provision for block uncommenting)
        autocmd BufEnter *.html vnoremap <silent><leader>\ dO<!----><C-[>k$p
        autocmd BufEnter *.css vnoremap <silent><leader>\ dO/**/<C-[>k$p
    augroup END

    if has("autocmd")
        " Automatically jump to the last cursor position on entering vim
        autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$")
            \ | execute "normal g'\"" | endif
    endif

" Abbreviations -
    abbr adn and
    abbr ture true
    abbr fasle false
    abbr teh the
    abbr THe The
      abbr singal signal

" Notetaking -
    function! Notetaking()

      setlocal wrap
      setlocal linebreak
      setlocal breakindent
      setlocal textwidth=70
      setlocal formatoptions+=t
      setlocal shiftwidth=2
      setlocal hidden
      setlocal complete+=kspell
      setlocal spellcapcheck=\_[\])'"   ]\+

      function! PeekImage()
          :normal! $x3jYpl2df]i Ypja--4k$i--p2l2jR
      endfunction

      function! MakeNotes()
          set textwidth=66
          normal! gqip
          normal! vip
          set textwidth=70
      endfunction
      function! CodeBlock()
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

      nnoremap <leader>o :normal! magqip`a<CR>
      nnoremap <F2> :Latex<CR><CR><CR>
      nnoremap <F6> :open *.pdf<CR>
      nnoremap <silent><leader>n :call MakeNotes()<CR> :'<,'>! boxes -d stone<CR>

      inoremap <C-\> <C-[>:call CodeBlock()<CR>o

      vnoremap <leader>i :! boxes -d peek<CR> :call PeekImage()<CR>
      vnoremap <leader>cp :! boxes -d pound-cmt<CR>

      command! Latex :w! | cd .. | execute ("! clear && pdflatex -shell-escape [a-z]*.tex")| cd -

      abbr bupt •
      abbr putp ▸
      abbr putt ✔

    endfunction

    autocmd BufWritePre *.html,*.css, :silent !bash /home/nikin/.reloadCurrentFirefoxTab.sh
" function! Refresh_firefox()
  " if &modified
    " write
    " silent !echo  'vimYo = content.window.pageYOffset;
          " \ vimXo = content.window.pageXOffset;
          " \ BrowserReload();
          " \ content.window.scrollTo(vimXo,vimYo);
          " \ repl.quit();'  |
          " \ nc -w 1 localhost 4242 2>&1 > /dev/null
  " endif
" endfunction
