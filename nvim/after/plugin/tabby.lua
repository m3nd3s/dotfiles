local status_tabby, tabby = pcall(require, "tabby")
if not status_tabby then return end

local status_icons, devicons = pcall(require, "nvim-web-devicons")
if not status_icons then return end

local theme = {
  fill = 'TabLineFill',
  head = 'TabLine',
  current_tab = 'TabLineSel',
  tab = 'TabLine',
}

tabby.setup({
  line = function(line)
    return {
      {
        { "  Neovim ", hl = theme.head },
        line.sep("", theme.head, theme.fill),
      },
      line.tabs().foreach(function(tab)
        local is_active = tab.is_current()
        local win = tab.current_win()
        
        local buf_id = win.buf().id
        local buf_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf_id), ":t")
        
        if buf_name == "" then buf_name = "[Sem Nome]" end

        local ext = vim.fn.fnamemodify(buf_name, ":e")
        local icon, _ = devicons.get_icon(buf_name, ext, { default = true })
        icon = icon and (icon .. " ") or ""

        local hl = is_active and theme.current_tab or theme.tab

        return {
          line.sep(is_active and "" or " ", hl, theme.fill),
          string.format(" %s%s ", icon, buf_name),
          line.sep(is_active and "" or " ", hl, theme.fill),
          hl = hl,
        }
      end),
      line.spacer(),
      hl = theme.fill,
    }
  end,
})
