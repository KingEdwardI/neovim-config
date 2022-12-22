local utils = require('utils')
local invariant_require = utils.invariant_require
local theme_utils = require('plugins.alpha-nvim.themes.utils')
local mru = theme_utils.mru
local alpha = invariant_require('alpha')
local dashboard = invariant_require('alpha.themes.dashboard')

vim.cmd([[
  let s:chocobo_color1 = 0
  let s:chocobo_color_2 = 0
  let s:chocobo_color_3 = 0
  let s:chocobo_color_4 = 0
  let s:chocobo_color_5 = 0
  let s:chocobo_color_6 = 0
  let s:chocobo_color_7 = 0
  let s:chocobo_color_8 = 0
  let s:chocobo_color_9 = 0
  let s:chocobo_color_10 = 0
  let s:chocobo_color_11 = 0
  let s:chocobo_color_12 = 0
  let s:chocobo_color_13 = 0
  let s:chocobo_color_14 = 0
  let s:chocobo_color_15 = 0
  let s:chocobo_color_16 = 0
  let s:chocobo_color_17 = 0
  let s:chocobo_color_18 = 0
  let s:chocobo_color_19 = 0

function HighlightChocobo()
  highlight ChocoboGold guifg=#AB893F
  highlight ChocoboYellow guifg=#E7BD3E
  highlight ChocoboPaleYellow guifg=#C7B290
  highlight ChocoboPurple guifg=#5E4683
  highlight ChocoboBlue guifg=#6486AC
  highlight ChocoboOrange guifg=#AB5729

  let s:chocobo_color1 = matchadd('ChocoboYellow', '#')
  let s:chocobo_color_2 = matchadd('ChocoboGold', '(')
  let s:chocobo_color_3 = matchadd('ChocoboGold', '%')
  let s:chocobo_color_4 = matchadd('ChocoboGold', '\.')
  let s:chocobo_color_5 = matchadd('ChocoboYellow', '/#')
  let s:chocobo_color_6 = matchadd('ChocoboYellow', '#\*')
  let s:chocobo_color_7 = matchadd('ChocoboPaleYellow', '@')
  let s:chocobo_color_8 = matchadd('ChocoboPurple', '/\*\*')
  let s:chocobo_color_9 = matchadd('ChocoboBlue', '//')
  let s:chocobo_color_10 = matchadd('ChocoboPurple', '\*\*')
  let s:chocobo_color_11 = matchadd('ChocoboOrange', '/\\(')
  let s:chocobo_color_12 = matchadd('ChocoboOrange', ' \*\*')
  let s:chocobo_color_13 = matchadd('ChocoboOrange', '\*\* ')
  let s:chocobo_color_14 = matchadd('ChocoboOrange', '/(')
  let s:chocobo_color_15 = matchadd('ChocoboOrange', ' ///// ')
  let s:chocobo_color_16 = matchadd('ChocoboOrange', '((//')
  let s:chocobo_color_17 = matchadd('ChocoboOrange', '\*////')
  let s:chocobo_color_18 = matchadd('ChocoboOrange', '//// ')
  let s:chocobo_color_19 = matchadd('ChocoboOrange', '((//')
endfunction

function RemoveChocoboHighlight()
  if &ft != 'alpha'
    try
      call matchdelete(s:chocobo_color1)     
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_2)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_3)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_4)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_5)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_6)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_7)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_8)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_9)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_10)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_11)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_12)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_13)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_14)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_15)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_16)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_17)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_18)
    catch
    endtry
    try
      call matchdelete(s:chocobo_color_19)
    catch
    endtry
  endif
endfunction

function OpenAlpha()
    let cnt = 0
    for i in range(0, bufnr("$"))
        if buflisted(i)
         let cnt = cnt + 1
        endif
    endfor
    if cnt <= 1
      Alpha
    endif
endfunction

function Echo()
  echo "doin the thing"
endfunction

autocmd FileType alpha call HighlightChocobo()
autocmd FileType * if &ft!="alpha" | call RemoveChocoboHighlight() | endif
autocmd BufDelete * if !empty(&filetype) | execute OpenAlpha()
]])

local chocobo_banner = {
  '                                                  ',
  '                 #######((%%%%%%%%%.              ',
  '            #####@@@@(((###%                      ',
  '          ####/**//@@(((%#  #%                    ',
  '          ####@@@**@@(((####                      ',
  '          ##(((((((((#######                      ',
  '          ((         %#%##              #%        ',
  '                     ####(           %#*          ',
  '                   #########     ####  /##        ',
  '                 ######################*          ',
  '                 #########((((#########*          ',
  '                 **#####(#(((((((#(**             ',
  '          @@     /(           (((((    (@@        ',
  '            /////                  ((//           ',
  '              *////            @@////             ',
  '                                                  ',
}

local function info_text()
  local total_plugins = #vim.tbl_keys(packer_plugins)
  local datetime = os.date(' %d-%m-%Y')
  local version = vim.version()
  local nvim_version_info = '   v'
    .. version.major
    .. '.'
    .. version.minor
    .. '.'
    .. version.patch

  return '        '
    .. datetime
    .. '   '
    .. total_plugins
    .. ' plugins'
    .. nvim_version_info
end

local info = {
  type = 'text',
  val = info_text(),
  opts = {
    hl = 'DevIconVim',
    position = 'center',
  },
}

local heading = {
  type = 'text',
  val = chocobo_banner,
  opts = {
    position = 'center',
    hl = 'AlphaHeading',
  },
}

local header = {
  type = 'group',
  val = {
    heading,
    { type = 'padding', val = 1 },
    info,
  },
  opts = {
    position = 'center',
  },
}

local buttons = {
  type = 'group',
  val = {
    dashboard.button(
      'f',
      '  Find File',
      "<Cmd>lua require('fzf-lua').git_files()<CR>"
    ),
    dashboard.button(
      'g',
      '  Live Grep',
      "<Cmd>lua require('fzf-lua').live_grep()<CR>"
    ),
    dashboard.button('t', '¤  Tree', '<Cmd>CHADopen<CR>'),
    dashboard.button(
      'u',
      '  Update plugins',
      '<Cmd>PackerSync<CR><Cmd>PackerCompile<CR>'
    ),
    dashboard.button('q', '✖  Quit NVIM', '<Cmd>qa<CR>'),
  },
  opts = {
    position = 'center',
    spacing = 1,
  },
}

local recent_files = {
  type = 'group',
  val = {
    {
      type = 'text',
      val = 'Recent files',
      opts = {
        hl = 'String',
        shrink_margin = false,
        position = 'center',
      },
    },
    { type = 'padding', val = 1 },
    {
      type = 'group',
      val = function()
        return {
          mru(1, vim.fn.getcwd(), 10),
        }
      end,
      opts = { position = 'center' },
    },
  },
  opts = {
    position = 'center',
  },
}

local config = {
  layout = {
    header,
    { type = 'padding', val = 2 },
    recent_files,
    { type = 'padding', val = 3 },
    buttons,
  },
}

if alpha then
  alpha.setup(config)
end
