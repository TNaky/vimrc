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
  autocmd VimEnter * nested if @% == '' && s:GetBufByte() == 0 | VimFiler | endif
augroup END
" mac os x環境固有の設定
if has('mac')
  " フォントサイズを18ポイントに設定
  set guifont=Ricty-RegularForPowerline:h18
  " 半透明化
  set transparency=10
elseif has('win32') || has('win64')
  set guifont=MS_Gothic:h18
  set guifontwide=MS_Gothic:h18
  set transparency=10
endif
" 起動時のバッファ・サイズを取得
function! s:GetBufByte()
  let byte = line2byte(line('$') + 1)
  if byte == -1
    return 0
  else
    return byte - 1
  endif
endfunction
