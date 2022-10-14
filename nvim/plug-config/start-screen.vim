let g:startify_session_dir = '~/.dotfiles/.config/nvim/session'

let g:startify_lists = [
        \ { 'header': ['   MRU'],            'type': 'files' },
        \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
        \ { 'header': ['   Sessions'],       'type': 'sessions' },
        \ ]


let g:startify_bookmarks = [
    \ { 'c': '~/.config/i3/config'},
    \ { 'i': '~/.config/nvim/init.vim'},
    \ '~/SynologyDrive/Code/java/myproject'
    \ ]
