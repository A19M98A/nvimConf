-- keymaps.lua
--
-- -- Use the older API for keymapping
vim.api.nvim_set_keymap('n', '<c-k>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-j>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-l>', ':wincmd l<CR>', { noremap = true, silent = true })
--
vim.api.nvim_set_keymap('n', '<leader>h', ':nohlsearch<CR>', { noremap = true, silent = true })
--

-- In your main keymap file (e.g., lua/core/keymaps.lua)

local map = vim.keymap.set
local opts = { noremap = true, silent = true, desc = "Open Neoclip (Clipboard History)" }

-- Map <leader>co to open the neoclip Telescope window
-- Choose any keybinding you prefer instead of <leader>co
map('n', '<leader>co', function()
  -- Ensure telescope is available before calling its extension
  local telescope_ok, telescope = pcall(require, "telescope")
  if not telescope_ok then
    vim.notify("Telescope is not loaded.", vim.log.levels.ERROR)
    return
  end

  -- Ensure the neoclip extension is loaded (it should be by the config file)
  local neoclip_ext_ok, _ = pcall(telescope.load_extension, "neoclip") -- loading again is safe
  if not neoclip_ext_ok then
     vim.notify("Neoclip Telescope extension failed to load.", vim.log.levels.ERROR)
     -- Attempting to call it might still work if loaded previously, but good to check.
  end

  -- Call the neoclip extension's default picker
  pcall(telescope.extensions.neoclip.default) -- Use pcall for extra safety
end, opts)

-- You can add other neoclip related maps if needed, check `:help neoclip-mappings`
-- For example, pasting directly from neoclip without opening Telescope:
-- map('n', '<leader>cp', '<Plug>(neoclip-paste)', { desc = "Paste from Neoclip history" })
-- map('i', '<c-r><c-p>', '<Plug>(neoclip-paste)', { desc = "Paste from Neoclip history (Insert)" })
