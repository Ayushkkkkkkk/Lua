set tabstop=4
set nocompatible
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set ruler
set showcmd
set incsearch
set shellslash
set cino+=L0
:set mouse=a
set signcolumn=no
syntax on
filetype indent on
filetype off
setlocal indentkeys-=:
set shell=/bin/bash
set belloff=all
"keybindings for { completion, "jk" for escape, ctrl-a to select all
inoremap {<CR>  {<CR>}<Esc>O
inoremap {}     {}
imap jk         <Esc>
map <C-a> <esc>ggVG<CR>
set belloff=all
set number
set relativenumber

autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE
autocmd VimEnter * hi NonText guibg=NONE ctermbg=NONE
autocmd VimEnter * hi LineNr guibg=NONE ctermbg=NONE
autocmd VimEnter * hi SignColumn guibg=NONE ctermbg=NONE
autocmd VimEnter * hi VertSplit guibg=NONE ctermbg=NONE
autocmd VimEnter * hi FoldColumn guibg=NONE ctermbg=NONE

tnoremap <C-n> <C-\><C-n>

" Automatically save the file and run Rust code when pressing Ctrl+Alt+B
nnoremap <silent> <C-M-b> :w<CR>:silent !cargo run<CR>:redraw!<CR>

" Run the command when the file is saved
autocmd BufWritePost *.rs :silent !cargo run

" Set transparency for all highlight groups


let g:mapleader = ' '


call plug#begin()
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'ThePrimeagen/vim-be-good'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'ellisonleao/gruvbox.nvim'
Plug 'prabirshrestha/vim-lsp'
Plug 'rust-lang/rust.vim'
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
call plug#end()

" Autosave after 1 second of inactivity
autocmd CursorHold * if mode() != 'n' | silent! wall | endif

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>







:set completeopt-=preview " For No Previews


:colorscheme jellybeans
let g:coc_global_extensions = ['coc-clangd']
" Enable Rust syntax highlighting
syntax enable

" Enable Rust filetype detection
filetype plugin indent on

" Set Rust code formatting options
autocmd FileType rust setlocal expandtab shiftwidth=4 softtabstop=4

" Use cargo check for error highlighting

let g:coc_global_extensions = ['coc-rust-analyzer']


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"


"Compile and run
"Note that this line requires the build.sh script!
"Compile and run
"Note that this line requires the build.sh script!
"autocmd filetype cpp nnoremap <F9> :w <bar> !build.sh %:r <CR> 
"autocmd filetype cpp nnoremap <F10> :!./%:r<CR>

"Clipboard configuration
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
        augroup WSLYank
                    autocmd!
                            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
                                augroup END
                            endif
 
        au BufNewFile,BufRead *.tex
            \ set nocursorline |
            \ set nornu |
            \ set number |
            \ let g:loaded_matchparen=1 |

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = 'εé░'
let g:airline_left_alt_sep = 'εé▒'
let g:airline_right_sep = 'εé▓'
let g:airline_right_alt_sep = 'εé│'
let g:airline_symbols.branch = 'εéá'
let g:airline_symbols.readonly = 'εéó'
let g:airline_symbols.linenr = 'εéí'
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

noremap <F1> <ESC>:tabprev <CR>
vnoremap <F1> <ESC>:tabprev <CR>
inoremap <F1> <ESC>
 
noremap <F3> <ESC> :w <CR> :make <CR>
inoremap <F3> <ESC> :w <CR> :make <CR>
 
"noremap <F4> <ESC> :w <CR> :!pycodestyle %<.py <CR>
"inoremap <F4> <ESC> :w <CR> :!pycodestyle %<.py <CR>
 
"noremap <F5> <ESC> :w <CR> :!pytest %<.py <CR>
"inoremap <F5> <ESC> :w <CR> :!pytest %<.py <CR>
 
"noremap <F6> <ESC> :!./%< < inp<CR>
"inoremap <F6> <ESC> :!./%< < inp<CR>
 
noremap <F7> <ESC> :w !python3 <CR>
 


inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}
"autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r<CR>
"autocmd filetype cpp nnoremap <F10> :!./%:r<CR>
"autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

autocmd filetype cpp nnoremap <C-A-b> :w <bar> !g++ -std=c++14 % -o %:r<CR>
autocmd filetype cpp nnoremap <C-A-c> :terminal ./%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

 
:lua << END
    vim.keymap.set('n', '<leader>s/', ':lua telescope_live_grep_open_files()<CR>', { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>ss', ':lua require("telescope.builtin").builtin()<CR>', { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', ':lua require("telescope.builtin").git_files()<CR>', { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', ':lua require("telescope.builtin").find_files()<CR>', { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', ':lua require("telescope.builtin").help_tags()<CR>', { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', ':lua require("telescope.builtin").grep_string()<CR>', { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', ':lua require("telescope.builtin").live_grep()<CR>', { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep for > ")})<CR>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', ':lua require("telescope.builtin").lsp_document_symbols()<CR>', { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', ':lua require("telescope.builtin").resume()<CR>', { desc = '[S]earch [R]esume' })


vim.keymap.set('n', '<leader>?', ':lua require("telescope.builtin").oldfiles()<CR>', { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', ':lua require("telescope.builtin").buffers()<CR>', { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ad", function() mark.add_file() end)
vim.keymap.set("n", "<C-e>", function() ui.toggle_quick_menu() end)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-g>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

require("toggleterm").setup{
  size = 20,
  open_mapping = [[<c-x>]],
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1',
  start_in_insert = true,
  persist_size = true,
  direction = 'float',
  hide_numbers = true,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}


END


















