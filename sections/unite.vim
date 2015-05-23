" Based in https://github.com/joedicastro/dotfiles

" Unite {{{

" files
nnoremap <silent><Leader>o :Unite -silent -start-insert file<CR>
" buffers
nnoremap <silent><Leader>b :Unite -silent buffer<CR>
" tabs
nnoremap <silent><Leader>t :Unite -silent tab<CR>
" buffer search
nnoremap <silent><Leader>f :Unite -silent -no-split -start-insert -auto-preview
      \ line<CR>
nnoremap <silent>[menu]8 :UniteWithCursorWord -silent -no-split -auto-preview
      \ line<CR>
" yankring
nnoremap <silent><Leader>i :Unite -silent history/yank<CR>
" tasks
nnoremap <silent><Leader>T :Unite -silent -toggle
      \ grep:%::FIXME\|TODO\|NOTE\|XXX\|COMBAK\|@todo<CR>
" outlines (also ctags)
" nnoremap <silent><Leader>t :Unite -silent -vertical -winwidth=40
"       \ -direction=topleft -toggle outline<CR>

" menus {{{
  let g:unite_source_menu_menus = {}

  " menu prefix key (for all Unite menus) {{{
  nnoremap [menu] <Nop>
  nmap <LocalLeader> [menu]
  " }}}

  " menus menu
  nnoremap <silent>[menu]u :Unite -silent -winheight=20 menu<CR>

  " files and dirs menu {{{
    let g:unite_source_menu_menus.files = {
      \ 'description' : '<Leader>o files & dirs',
      \}
    let g:unite_source_menu_menus.files.command_candidates = [
      \['➤ <Leader>o open a file',
      \'Unite -start-insert file'],
      \['➤ <Leader>m open more recently used files',
      \'Unite file_mru'],
      \['➤ <Leader>O open file with recursive search',
      \'Unite -start-insert file_rec/async'],
      \['➤ :w!! save as root',
      \'exe "write !sudo tee % >/dev/null"'],
      \]
    nnoremap <silent>[menu]o :Unite -silent -winheight=17 -start-insert
          \ menu:files<CR>
  " }}}

  " file searching menu {{{
    let g:unite_source_menu_menus.grep = {
      \ 'description' : '<Leader>a search files',
      \}
    let g:unite_source_menu_menus.grep.command_candidates = [
      \['➤ <Leader>g grep',
      \'Unite -no-quit grep'],
      \['➤ <Leader>f find',
      \'Unite find'],
      \]
    nnoremap <silent>[menu]a :Unite -silent menu:grep<CR>
  " }}}

  " buffers, tabs & windows menu {{{
    let g:unite_source_menu_menus.navigation = {
      \ 'description' : '<Leader>b navigate by buffers, tabs & windows',
      \}
    let g:unite_source_menu_menus.navigation.command_candidates = [
      \['➤ <Leader>b buffers',
      \'Unite buffer'],
      \['➤ <Leader>t tabs',
      \'Unite tab'],
      \]
    nnoremap <silent>[menu]b :Unite -silent menu:navigation<CR>
  " }}}


  " yanks, registers & history menu {{{
    let g:unite_source_menu_menus.registers = {
      \ 'description' : '<Leader>i yanks, registers & history',
      \}
    "let g:unite_source_menu_menus.registers.command_candidates = [
      "\['▷ yanks                                                      ⌘ ,i',
      "\'Unite history/yank'],
      "\]
    nnoremap <silent>[menu]i :Unite -silent menu:registers<CR>
  " }}}


  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
    \ 'ignore_pattern', join(['\.yardoc', '\.git/', 'tmp/', 'bundle/'], '\|'))

  let g:unite_source_history_yank_enable = 1
  let g:unite_enable_start_insert = 0
  let g:unite_enable_short_source_mes = 0
  let g:unite_force_overwrite_statusline = 0
  let g:unite_prompt = '>>> '
  let g:unite_marked_icon = '✓'
  " let g:unite_candidate_icon = '∘'
  let g:unite_winheight = 15
  let g:unite_update_time = 200
  let g:unite_split_rule = 'botright'
  let g:unite_data_directory = $HOME.'/.vim/tmp/unite'
  let g:unite_source_buffer_time_format = '(%Y-%m-%dT%H:%M:%S) '
  let g:unite_source_file_mru_time_format = '(%Y-%m-%dT%H:%M:%S) '
  let g:unite_source_directory_mru_time_format = '(%Y-%m-%dT%H:%M:%S) '

  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -a -S'
  let g:unite_source_grep_recursive_opt=''
  let g:unite_source_grep_search_word_highlight = 1

" }}}