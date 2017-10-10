try
		augroup myvimrc
				au!
				au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
		augroup END
    set background=dark
    colorscheme solarized
	set number	# Show line numbers
	" set expandtab	# Use spaces instead of tabs 
    set smartindent	# Enable smart-indent
    set autoindent	# Auto-indent new lines

    set clipboard=unnamed
    syntax enable
    set lines=35 columns=150
    set colorcolumn=90
    highlight SpecialKey ctermfg=5
    set hidden
    set history=100
    filetype indent on
    set nowrap
    set tabstop=2
    set shiftwidth=2
    nnoremap <C-J> m`o<Esc>``
    nnoremap <C-K> m`O<Esc>``
    " set paste mode with F10 
    " set pastetoggle=<F10>
    " <Ctrl-l> redraws the screen and removes any search highlighting.
    nnoremap <silent> <C-l> :nohl<CR><C-l>
catch
endtry
