local utils = require('utils')
local invariant_require = utils.invariant_require
local theme_utils = require('plugins.alpha-nvim.themes.utils')
local mru = theme_utils.mru
local alpha = invariant_require('alpha')
local dashboard = invariant_require('alpha.themes.dashboard')

vim.cmd([[
function Highlight_chocobo()
  highlight ChocoboGold guifg=#AB893F
  highlight ChocoboYellow guifg=#E7BD3E
  highlight ChocoboPaleYellow guifg=#C7B290
  highlight ChocoboPurple guifg=#5E4683
  highlight ChocoboBlue guifg=#6486AC
  highlight ChocoboOrange guifg=#AB5729
  call matchadd('ChocoboYellow', '#')
  call matchadd('ChocoboGold', '(')
  call matchadd('ChocoboGold', '%')
  call matchadd('ChocoboGold', '\.')
  call matchadd('ChocoboYellow', '/#')
  call matchadd('ChocoboYellow', '#\*')
  call matchadd('ChocoboPaleYellow', '@')
  call matchadd('ChocoboPurple', '/\*\*')
  call matchadd('ChocoboBlue', '//')
  call matchadd('ChocoboPurple', '\*\*')
  call matchadd('ChocoboOrange', '/\\(')
  call matchadd('ChocoboOrange', ' \*\*')
  call matchadd('ChocoboOrange', '\*\* ')
  call matchadd('ChocoboOrange', '/(')
  call matchadd('ChocoboOrange', ' ///// ')
  call matchadd('ChocoboOrange', '((//')
  call matchadd('ChocoboOrange', '\*////')
  call matchadd('ChocoboOrange', '//// ')
  call matchadd('ChocoboOrange', '((//')
endfunction

autocmd FileType alpha call Highlight_chocobo()
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
  local nvim_version_info = '   v' .. version.major .. '.' .. version.minor .. '.' .. version.patch

  return '        ' .. datetime .. '   ' .. total_plugins .. ' plugins' .. nvim_version_info
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
    dashboard.button('f', '  Find File', "<Cmd>lua require('fzf-lua').git_files()<CR>"),
    dashboard.button('g', '  Live Grep', "<Cmd>lua require('fzf-lua').live_grep()<CR>"),
    dashboard.button('t', '¤  Nvim Tree', '<Cmd>NvimTreeToggle<CR>'),
    dashboard.button('u', '  Update plugins', '<Cmd>PackerSync<CR><Cmd>PackerCompile<CR>'),
    dashboard.button('q', '✖  Quit NVIM', '<Cmd>qa<CR>'),
  },
  opts = {
    position = 'center',
    spacing = 1,
  },
}

-- TODO: Fix the centering of the files so they are justified
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
