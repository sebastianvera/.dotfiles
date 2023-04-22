return {
  "sebastianvera/classy",
  dev = true,
  config = function()
    vim.keymap.set("n", "<leader>ac", require("classy").add)
  end,
}
