" GVimの設定ファイルです
" GUIツールバーを非表示
set guioptions-=T
" メニューバーを非表示にする
set guioptions-=m
" スクロールバーを非表示
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
" 起動時のウィンドウ左にVimFilerを自動起動
augroup start_vimfiler
  autocmd!
  autocmd VimEnter * VimFiler
augroup END
" mac os x環境固有の設定
if has('mac')
  " フォントサイズを18ポイントに設定
  set guifont=Ricty-RegularForPowerline:h18
  " 半透明化
  set transparency=10
endif
