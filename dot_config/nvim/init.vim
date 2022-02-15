" Load plugins from ~/.config/nvim/lua/plugins.lua 
lua require('plugins')

" Activate language servers
lua << EOF
-- require'lspconfig'.r_language_server.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.pyright.setup{}
EOF

" Remaps
" Esc is usable with the corne
    inoremap uu <Esc>
" Moving through panes is usable with the corne
    nmap <silent> <A-Up> :wincmd k<CR>
    nmap <silent> <A-Down> :wincmd j<CR>
    nmap <silent> <A-Left> :wincmd h<CR>
    nmap <silent> <A-Right> :wincmd l<CR>
" Movement keys go through wrapped lines
    nmap <silent> <Down> gj
    nmap <silent> <Up> gk

"" General options
" Hybrid line numbers
    set number relativenumber
    set nu rnu
" Use the global clipboard
    set clipboard+=unnamedplus
" Color scheme
    colorscheme nightfox
" Actually useful word wrapping
    set wrap linebreak textwidth=0 wrapmargin=0
" Soft tabs
    set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
    autocmd Filetype r setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" Set the comment leader for R files to autocomplete
    autocmd Filetype r let b:comment_leader = "#' "
    autocmd Filetype r set formatoptions+=r
" The bottom of the screen? It's free real estate!
    set scrolloff=15
" Show the 80 col so that I'm not a naugthy boy
    set colorcolumn=80

" SPELL CHECKING --------------------------------------
    set spelllang=en
" Activate spellchecking for .md files
    autocmd Filetype markdown set spell

