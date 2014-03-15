nnoremap [m] <Nop>
map      <Space> [m]
nnoremap <silent> [m]f :<C-u>Unite -start-insert buffer file_mru bookmark file<CR>
nnoremap <silent> [m]x :<C-u>Unite -start-insert command mapping<CR>
nnoremap <silent> [m]. :b #<CR>
nnoremap <silent> [m]u :GundoToggle<CR>
nnoremap <silent> [m]r :QuickRun<CR>
