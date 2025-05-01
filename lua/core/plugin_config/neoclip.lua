local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok then
  vim.notify("neoclip plugin not found!", vim.log.levels.WARN)
  return
end

neoclip.setup({
  history = 1000,             -- Number of entries to keep in history
  enable_persistent_history = true, -- Keep history across Neovim sessions
  db_path = vim.fn.stdpath("data") .. "/neoclip.sqlite3", -- Where to store history

})

local telescope_status_ok, telescope = pcall(require, "telescope")
if telescope_status_ok then
  pcall(telescope.load_extension, "neoclip")
else
  vim.notify("Telescope not found, neoclip extension not loaded.", vim.log.levels.WARN)
end

