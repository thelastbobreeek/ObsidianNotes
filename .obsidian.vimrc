" ===========================
" RU → EN (работает в Obsidian)
" ===========================
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,ё;`,Ё;~

" ===========================
" Быстрый выход из insert
" ===========================
inoremap jk <Esc>

" ===========================
" Сохранение (Space + w)
" ===========================
nnoremap <Space>w :write<CR>

" ===========================
" hjkl → jkl;
nnoremap j h
nnoremap k j
nnoremap l k
nnoremap : l

vnoremap j h
vnoremap k j
vnoremap l k
vnoremap : l

" ===========================
" Системный буфер
" ===========================
nnoremap <C-y> "+y
vnoremap <C-y> "+y

" ===========================
" Esc снимает подсветку поиска
" ===========================
nnoremap <Esc> :nohlsearch<CR>

" ===========================
" Прокрутка + центрирование
" ===========================
nnoremap <C-D> <C-D>zz
nnoremap <C-U> <C-U>zz

" ===========================
" Quick switcher (Space + o)
" ===========================
nnoremap <Space>o :quickSwitcher<CR>

" ===========================
" Отключаем стрелки
" ===========================
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap! <Up> <NOP>
noremap! <Down> <NOP>
noremap! <Left> <NOP>
noremap! <Right> <NOP>
