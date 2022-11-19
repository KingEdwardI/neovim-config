local if_nil = vim.F.if_nil
local fnamemodify = vim.fn.fnamemodify
local filereadable = vim.fn.filereadable

local M = {}

local leader = ','

local function button(sc, txt, keybind, keybind_opts)
  local sc_ = sc:gsub('%s', ''):gsub(leader, '<leader>')

  local opts = {
    position = 'center',
    shortcut = '[' .. sc .. '] ',
    cursor = 1,
    width = 50,
    align_shortcut = 'left',
    hl_shortcut = { { 'Operator', 0, 1 }, { 'Number', 1, #sc + 1 }, { 'Operator', #sc + 1, #sc + 2 } },
    shrink_margin = false,
  }
  if keybind then
    keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { 'n', sc_, keybind, { noremap = false, silent = true, nowait = true } }
  end

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
    vim.api.nvim_feedkeys(key, 't', false)
  end

  return {
    type = 'button',
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

local nvim_web_devicons = {
  enabled = true,
  highlight = true,
}

local function get_extension(fn)
  local match = fn:match('^.+(%..+)$')
  local ext = ''
  if match ~= nil then
    ext = match:sub(2)
  end
  return ext
end

local function icon(fn)
  local nwd = require('nvim-web-devicons')
  local ext = get_extension(fn)
  return nwd.get_icon(fn, ext, { default = true })
end

local function file_button(fn, sc, short_fn, autocd)
  short_fn = if_nil(short_fn, fn)
  local ico_txt
  local fb_hl = {}
  if nvim_web_devicons.enabled then
    local ico, hl = icon(fn)
    local hl_option_type = type(nvim_web_devicons.highlight)
    if hl_option_type == 'boolean' then
      if hl and nvim_web_devicons.highlight then
        table.insert(fb_hl, { hl, 0, 1 })
      end
    end
    if hl_option_type == 'string' then
      table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 1 })
    end
    ico_txt = ico .. '  '
  else
    ico_txt = ''
  end
  local cd_cmd = (autocd and ' | cd %:p:h' or '')
  local file_button_el = button(sc, ico_txt .. short_fn, '<cmd>e ' .. fn .. cd_cmd .. ' <CR>')
  local fn_start = short_fn:match('.*[/\\]')
  if fn_start ~= nil then
    table.insert(fb_hl, { 'Comment', #ico_txt - 2, #fn_start + #ico_txt - 2 })
  end
  file_button_el.opts.hl = fb_hl
  return file_button_el
end

local default_mru_ignore = { 'gitcommit' }

local mru_opts = {
  ignore = function(path, ext)
    return (string.find(path, 'COMMIT_EDITMSG')) or (vim.tbl_contains(default_mru_ignore, ext))
  end,
  autocd = false,
}

local function mru(start, cwd, items_number, opts)
  opts = opts or mru_opts
  items_number = if_nil(items_number, 10)
  local oldfiles = {}
  for _, v in pairs(vim.v.oldfiles) do
    if #oldfiles == items_number then
      break
    end
    local cwd_cond
    if not cwd then
      cwd_cond = true
    else
      cwd_cond = vim.startswith(v, cwd)
    end
    local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
    if (filereadable(v) == 1) and cwd_cond and not ignore then
      oldfiles[#oldfiles + 1] = v
    end
  end

  local tbl = {}
  for i, fn in ipairs(oldfiles) do
    local short_fn
    if cwd then
      short_fn = fnamemodify(fn, ':.')
    else
      short_fn = fnamemodify(fn, ':~')
    end
    local file_button_el = file_button(fn, tostring(i + start - 1), short_fn, opts.autocd)
    tbl[i] = file_button_el
  end
  return {
    type = 'group',
    val = tbl,
  }
end

M.mru = mru

return M
