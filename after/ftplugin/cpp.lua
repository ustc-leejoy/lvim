-- check the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.set_keymappings))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
-- clangd settings
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })

-- -- some settings can only passed as commandline flags `clangd --help`
-- local clangd_flags = {
--     "--all-scopes-completion",
--     "--suggest-missing-includes",
--     "--background-index",
--     "--pch-storage=disk",
--     "--cross-file-rename",
--     "--log=info",
--     "--completion-style=detailed",
--     "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
--     "--clang-tidy",
--     -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
--     -- "--fallback-style=Google",
--     -- "--header-insertion=never",
--     -- "--query-driver=<list-of-white-listed-complers>"
-- }

-- local clangd_bin = "clangd"

-- local custom_on_attach = function(client, bufnr)
--     require("lvim.lsp").common_on_attach(client, bufnr)
--     local opts = { noremap = true, silent = true }
--     vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lh", "<Cmd>ClangdSwitchSourceHeader<CR>", opts)
-- end

-- local opts_log = {
--     cmd = { clangd_bin, unpack(clangd_flags) },
--     on_attach = custom_on_attach,
-- }

-- require("lvim.lsp.manager").setup("clangd", opts_log)

local dap_install = require "dap-install"
dap_install.config("ccppr_vsc", {
    adapters = {
        type = "executable",
    },
    configurations = {
        {
            type = "cpptools",
            request = "launch",
            name = "Launch with pretty-print",
            program = function()
                return vim.fn.input('Path to exe: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = true,
            setupCommands = {
                {
                    description = "Enable pretty-printing",
                    text = "-enable-pretty-printing",
                }
            }
        },
    }
})
