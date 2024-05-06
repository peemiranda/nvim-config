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
