" ===================================================================== "
" Plugin settings
" ===================================================================== "

" ===== Ctrl-space setup
if has("gui_running")
    " Settings for MacVim and Inconsolata font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
else
    echo "silversearcher-ag package (ag command) is Required"
endif

let g:CtrlSpaceSearchTiming = 500
let g:CtrlSpaceUseTabline = 1

" ===== Vim javascript configuration
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" ===== Vim close tag
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,js'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" ===== Tmux navigator
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" ===== yats plugin
" highlight host specific keywords for typescript
let g:yats_host_keyword = 1

" ===================== Git Messenger Plugin ===================== "

let g:git_messenger_close_on_cursor_moved = v:false
let g:git_messenger_always_into_popup = v:true

" ===== gruvbox theme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
colorscheme gruvbox
let g:gruvbox_bold             = 1
let g:gruvbox_italic           = 1
let g:gruvbox_contrast_dark    = 'medium'
let g:gruvbox_contrast_light   = 'medium'
let g:gruvbox_invert_selection = '0'

" ===== CtrlSpace
" CtrlSpace plugin fix for neovim
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
