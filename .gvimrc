" GVimの設定ファイルです
" GUIツールバーを非表示
set guioptions-=T
" 起動時のウィンドウ左にVimFilerを自動起動
augroup start_vimfiler
  autocmd!
  autocmd VimEnter * VimFiler -split -winwidth=30 -simple -no-quit
augroup END
" mac os x環境固有の設定
if has('mac')
  " フォントサイズを18ポイントに設定
  set guifont=Ricty-RegularForPowerline:h18
  " 半透明化
  set transparency=10
endif
