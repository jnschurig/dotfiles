-- if true then
--   return {}
-- end

return {
  "jnschurig/ghosttysync.nvim",
  branch = "main",
  lazy = false,
  priority = 1001,
  config = function()
    -- vim.g.disable_background = true
    vim.g.material_style = "primary"
    require("ghosttysync").setup({
      disable = {
        background = true,
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
