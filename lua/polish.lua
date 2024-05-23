-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
local dap = require "dap"
require("nvim-dap-virtual-text").setup {}

-- Do not forget to run 'npm install' and 'npm run build' inside the adapters/vscode-php-debug folder
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv "HOME" .. "/.config/nvim/adapters/vscode-php-debug/out/phpDebug.js" },
}

vim.opt.clipboard = "unnamedplus"
if vim.fn.has "wsl" == 1 then
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("Yank", { clear = true }),
    callback = function() vim.fn.system("clip.exe", vim.fn.getreg '"') end,
  })
end

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
