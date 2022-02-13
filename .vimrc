" https://vimhelp.org/usr_05.txt.html#vimrc-intro
syntax on               " enable syntax highlighting
set cursorline          " highlight the current line
set nobackup            " don't create pointless backup files; Use VCS instead
set autoread            " watch for file changes
set number              " show line numbers
set showcmd             " show selection metadata
set showmode            " show INSERT, VISUAL, etc. mode
set showmatch           " show matching brackets
filetype on             " enable filetype detection
filetype indent on      " enable filetype-specific indenting
filetype plugin on      " enable filetype-specific plugins

" column-width visual indication
let &colorcolumn=join(range(81,101),",")
highlight ColorColumn ctermbg=235 guibg=#001D2F

" tabs and indenting
set autoindent          " auto indenting
set smartindent         " smart indenting
set smarttab            " better backspace and tab functionality
set expandtab           " spaces instead of tabs
set tabstop=2           " 2 spaces for tabs
set shiftwidth=2        " 2 spaces for indentation

" bells
set noerrorbells        " turn off audio bell
set visualbell          " but leave on a visual bell

" search
set hlsearch            " highlighted search results

" clipboard
set clipboard=unnamed   " allow yy, etc. to interact with OS X clipboard