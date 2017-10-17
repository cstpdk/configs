" Plugins
execute pathogen#infect()

" Pretty colors
syntax on
filetype plugin indent on
set background=dark
colorscheme solarized

" Visible whitespace
set list!
set listchars=tab:>-

" File completion
set wildmode=longest,list,full
set wildmenu

" Mark where lines are too long
set cc=81

" Gimme some margin
set foldcolumn=1

" Gimme numbers
set nu

" Persistent undo
set undofile
" set a directory to store the undo history
set undodir=/tmp/.vim-undo

set foldmethod=syntax

set conceallevel=1
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" Javascript
autocmd Filetype json setlocal ts=2 sts=2 sw=2 et

" Typescript
autocmd Filetype typescript setlocal ts=4 sts=4 sw=4 et

" Markdown / Pandoc
autocmd Filetype markdown setlocal tw=80 wrap spell formatoptions+=t ts=4 sts=4 sw=4 et
autocmd Filetype pandoc setlocal tw=80 wrap spell formatoptions+=t ts=4 sts=4 sw=4 et
autocmd Filetype tex setlocal tw=80 wrap spell formatoptions+=t ts=4 sts=4 sw=4 et
autocmd Filetype scss setlocal tw=80 wrap spell formatoptions+=t ts=2 sts=2 sw=2 et

" Spelling
set spelllang=en,da

" yaml
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 et
autocmd Filetype docker-compose setlocal ts=2 sts=2 sw=2 et

" html
autocmd Filetype html setlocal ts=2 sts=2 sw=2 et

" Graphcool conf
autocmd Filetype conf setlocal ts=2 sts=2 sw=2 et

" nginx
autocmd Filetype nginx setlocal ts=2 sts=2 sw=2 et

" fsharp
autocmd Filetype fsharp setlocal ts=4 sts=4 sw=4 et

" ocaml
"set rtp+=/home/csp/.vim/bundle/ocp-indent-vim
autocmd Filetype ocaml setlocal ts=4 sts=4 sw=4 et
autocmd Filetype reason setlocal ts=2 sts=2 sw=2 et
let g:vimreason_extra_args_expr_reason = '"--print-width 80"'
autocmd FileType reason map <buffer> <C-M> :ReasonPrettyPrint<Cr>
