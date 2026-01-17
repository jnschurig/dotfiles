-- if true then
--   return {}
-- end

return {
  "jnschurig/termsink.nvim",
  branch = "v0",
  lazy = false,
  priority = 1001,
  config = function()
    -- vim.g.disable_background = true
    vim.g.material_style = "primary"
    require("termsink").setup({
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
    vim.cmd.colorscheme("termsink")
  end,
}
