"set nu            " нумерация строк
set cursorline		" подсветка всей строки под курсором
set nocompatible  " отключить режим совместимости с классическим Vi
syntax on         " включить подсветку синтаксиа
set scrolloff=3 " сколько строк внизу и вверху экрана показывать при скроллинге
colorscheme pablo " цветовая схема по умолчанию
set wrap " перенос длинных строк...
set linebreak " переносить целые слова
set hidden " не выгружать буфер когда переключаешься на другой
set showcmd " показывать незавершенные команды в статусбаре (автодополнение ввода)
set matchpairs+=<:> " показывать совпадающие скобки для HTML-тегов
set showmatch " показывать первую парную скобку после ввода второй
set autoread " перечитывать изменённые файлы автоматически
set t_Co=256 " больше цветов в терминале
set confirm " использовать диалоги вместо сообщений об ошибках
set noswapfile " не использовать своп-файл
set autochdir " автоматически менять каталог на текущий
set tildeop " чтобы можно было изменять регистр не только выделения, но и, например ~w
set title	" заголовок окна
set wildmenu
" ... с авто-дополнением
set wildcharm=<TAB>
" Не перерисовывать буфер во время выполнения макроса
set lazyredraw
" подсвечивать некоторые символы
set list
" установим символы для подсветки
set listchars=tab:··,trail:⋅,eol:↲,nbsp:⌒

set pastetoggle= " при вставке фрагмента сохраняет отступы
set history=1000 " история команд
set undolevels=50 " сколько отмен хранить

" Поиск
set ignorecase " ics - поиск без учёта регистра символов
set smartcase " ... но если выражения содержит символы в верхнем регистре, тогда учитывать
set incsearch " поиск фрагмента по мере его набора

" Отступы
set shiftwidth=3 " размер отступов
set tabstop=3 " ширина табуляции
set softtabstop=3 " ширина 'мягкого' таба (что за нах?)
set autoindent " ai - включить автоотступы
set noexpandtab " чтобы не разворачивал табуляцию в пробелы
set smartindent " Умные отступы (например, автоотступ после {)
" сохранять выделение при визуальном изменении отступа
vnoremap < <gv
vnoremap > >gv
" Файлы, кодировки
set encoding=utf-8
set termencoding=utf-8
set ffs=unix,dos,mac " формат файла по умолчанию (влияет на окончания строк) - будет перебираться в указанном порядке
" Применять типы файлов
let g:pydiction_location = '/home/maxi/.vim/ftplugin/complete-dict'
filetype on
filetype plugin on
set autoread " перечитывать изменённые файлы автоматически
" меньше приоритета бинарным файлам при автодополнении
set suffixes+=.png,.gif,.jpg,.jpeg,.ico"
" Резервные копии
set backup " включить сохранение резервных копий
set backupdir=$HOME/.vim/backup
" Четыре строки ниже для удобного ред. строк с переносом
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Исправлять полетевшее форматирование после вставки
inoremap <silent> <C-p> <ESC>u:set paste<CR>.:set nopaste<CR>gi

" При копировании добавить в иксовый буфер
" nmap yy yy:silent .w !xclip<CR>
vmap y y:silent '<,'> w !xclip<CR>

" Вставка пустой строки в нормальном режиме
nmap oo o<ESC>
nmap oo o<esc>

" Плагин Toggle Words (true/false etc.)
nmap <leader>t :ToggleWord

let python_highlight_all = 1
"Настройка omnicomletion для Python (а так же для js, html и css)
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

function InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\"
	else
		return "\<c-p>"
	endif
endfunction
imap <c-r> InsertTabWrapper()
"command W w !sudo tee % > /dev/null
cabbrev W w !sudo tee % > /dev/null<CR>:e!<CR><CR>
