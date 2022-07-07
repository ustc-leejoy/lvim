--go debug settings
-- require('dap-go').setup()
local dap_install = require "dap-install"
dap_install.config("go_delve", {})
