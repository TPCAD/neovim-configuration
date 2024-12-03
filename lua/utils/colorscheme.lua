-- Start lazy color scheme picker
local function openColorschemePickerWithEvent()
  local telescope = require("telescope.builtin")
  -- Trigger the User LazyColorscheme event
  vim.cmd("doautocmd User LazyColorscheme")
  -- Then open the colorscheme picker
  telescope.colorscheme({ enable_preview = true })
end
-- Set the keymap to call the function
vim.keymap.set("n", "<leader>cu", openColorschemePickerWithEvent, { desc = "Switch Colorscheme" })
-- End lazy color scheme picker
