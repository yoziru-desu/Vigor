" Unite

let g:unite_data_directory = $HOME.'/.vim/tmp/unite'
let g:unite_enable_start_insert = 0
let g:unite_force_overwrite_statusline = 0
let g:unite_prompt = '> '
let g:unite_source_buffer_time_format = '(%Y-%m-%dT%H:%M:%S) '
let g:unite_source_history_yank_enable = 1
let g:unite_source_menu_menus = {}
let g:unite_source_rec_max_cache_files = 50000
let g:unite_source_tab_time_format = '(%Y-%m-%dT%H:%M:%S) '

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-i --line-numbers --nocolor --nogroup --hidden ' .
    \  '--ignore ''.hg'' --ignore ''.svn'' --ignore ''*.sock'' --ignore ''tmp'' --ignore ''target'' --ignore ''.git'''
  let g:unite_source_rec_async_command='ag -i --nocolor --nogroup --ignore "tmp" --ignore "target" --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'
endif


" Menu
nnoremap <Leader>u :Unite -start-insert<CR>
" All
nnoremap <Leader>a :Unite -buffer-name=files file buffer tab<CR>
" ctrl-p like
nnoremap <Leader>f :Unite -start-insert file_rec/async:!<CR>
nnoremap <Leader>ff :Unite -start-insert -force-redraw file_rec/async:!<CR>
" Buffers
nnoremap <Leader>b :Unite buffer<CR>
" Search
nnoremap <Leader>s :Unite grep:.<CR>
" Yankring
nnoremap <Leader>y :<C-u>Unite history/yank<CR>
" Tasks
nnoremap <Leader>t :Unite -toggle
  \ grep:.::FIXME\|TODO\|NOTE\|XXX<CR>


" Menu prefix key (for all Unite menus)
nnoremap [menu] <Nop>
nmap <LocalLeader> [menu]

nnoremap <silent>[menu]w :UniteWithCursorWord -silent
  \  -no-split -auto-preview line<CR>
