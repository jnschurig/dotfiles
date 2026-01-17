-- if true then
--   return {}
-- end

return {
  "jnschurig/ghosttysync.nvim",
  -- branch = "v0.1",
  lazy = false,
  priority = 1001,
  config = function()
    -- vim.g.disable_background = true
    vim.g.material_style = "primary"
    require("ghosttysync").setup({
      disable = { -- This works, but causes the lualine text to be WHITE
        background = false,
      },
      plugins = {
        -- "neo-tree",
      },
      styles = {
        comments = {},
        functions = { bold = true },
        strings = { italic = true },
      },
    })
    vim.cmd.colorscheme("ghosttysync")
  end,
}
