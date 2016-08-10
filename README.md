## vimlc.vim - load .vimlc into current directory/project root like a .vimrc

## Installation
```vim
NeoBundle 'kyohsuke/vimlc.vim'
```
of course you can use Vundle, pathogen or any plug-in manager.

## Configuration
when vimlc finds any project symbols, it stop searching .vimlc file.
```vim
" default is here.
" you can change g:vimlc_project_root_symbols as you like.
let g:vimlc_project_root_symbols = [
      \ '.git',
      \ '.hg',
      \ '.svn',
      \ '.csv',
      \ ]
```

## LICENSE

MIT
