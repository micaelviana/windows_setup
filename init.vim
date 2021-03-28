"=======================================================================
  "_   _ ______ ______      _______ __  __ 
 "| \ | |  ____/ __ \ \    / /_   _|  \/  |
 "|  \| | |__ | |  | \ \  / /  | | | \  / |
 "| . ` |  __|| |  | |\ \/ /   | | | |\/| |
 "| |\  | |___| |__| | \  /   _| |_| |  | |
 "|_| \_|______\____/   \/   |_____|_|  |_|
"=======================================================================
call plug#begin(stdpath('data'))
"-----Basico----
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete
Plug 'jiangmiao/auto-pairs' "pares de parenteses
Plug 'ctrlpvim/ctrlp.vim' "Ctrlp para navegar por arquivos
Plug 'preservim/nerdtree' "Barra lateral
Plug 'itchyny/lightline.vim' "Barra inferior
Plug 'preservim/nerdcommenter' "assistente para  inserir comentarios
Plug 'sheerun/vim-polyglot' "Sinxtaxe de diversas linguagens de programacao
"-----Temas----
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
"-----Extras----
Plug 'christoomey/vim-tmux-navigator' "navegação mais amigável pelos splits
Plug 'mg979/vim-visual-multi', {'branch': 'master'} "Multiplos cursores
Plug 'mhinz/vim-startify' "Start screen
Plug 'ryanoasis/vim-devicons' "icones para o Vim, funciona com nerdfonts
call plug#end()

"----------CONFIGURACOES GERAIS----------
set hidden "manter multiplos buffers abertos
set number relativenumber "mostrar numeros das linhas
set cursorline "destaca linha do cursor
set mouse=a "habilita interacao com o mouse
set ignorecase "desativa case sensitive na pesquisa e nos comandos do vim
set inc=split "preview de comandos
set splitright splitbelow "define pra que lado se abrem os splits 
syntax enable "colorir corretamente a sintaxe de linguagens
set clipboard=unnamedplus "clipboard entre o neovim e os outros progranas
set expandtab shiftwidth=4 autoindent "tabs expandem para 4 espacos, manter indentacao da linha anterior
if has('termguicolors')  "habilitar cores do terminal
    set termguicolors  
endif

"definicao de tema
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material

"----------DEFINICAO DE TECLAS DE ATALHO ----------
"define a tecla space como leader 
let mapleader="\<space>"
"space+b para salvar, ctrl+x para fechar, ctrl+a seleciona tudo
nnoremap <leader>b :w <cr>
nnoremap <silent> <c-x> :x <cr>
map <C-a> <esc>ggVG<CR>
"atalhos para splits (de YADR dotfiles)
nnoremap <silent> ss <C-w>s
nnoremap <silent> vv <C-w>v

"----------CONFIGURACOES DE PLUGINS----------
"NERDTree: ativar e desativar a barra
map <C-t> :NERDTreeToggle<CR>

"lightline
set noshowmode "pra nao ficar redundante no modo de insercao
"definicao de tema
let g:lightline = { 'colorscheme': 'material_vim' }

"NERDCommenter: comentar e descomentar linhas
map // <plug>NERDCommenterToggle

"Preferências do Startify
"Baseado em: https://github.com/benbrastmckie/.config/

let g:startify_custom_header = [
 \ '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
 \ '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
 \ '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
 \ '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
 \ '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
 \ '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
 \]
 
 let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/Code',
            \ ]
            
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   Files']            },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ ]            
                                                  
let g:webdevicons_enable_startify = 1
function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    endfunction

    
"=============================================================================================================
"FROM CONQUER OF COMPLETION

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>