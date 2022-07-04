lvim.transparent_window = true
vim.opt.wrap = false
lvim.debug = true
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.cmd [[set iskeyword+=-]]
-- pcall(require, "profile")

-- lsp_signature settings
-- local cfg = {
--     debug = false, -- set to true to enable debug logging
--     log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
--     -- default is  ~/.cache/nvim/lsp_signature.log
--     verbose = false, -- show debug line number

--     bind = true, -- This is mandatory, otherwise border config won't get registered.
--     -- If you want to hook lspsaga or other signature handler, pls set to false
--     doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
--     -- set to 0 if you DO NOT want any API comments be shown
--     -- This setting only take effect in insert mode, it does not affect signature help in normal
--     -- mode, 10 by default

--     floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

--     floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
--     -- will set to true when fully tested, set to false will use whichever side has more space
--     -- this setting will be helpful if you do not want the PUM and floating win overlap

--     floating_window_off_x = 1, -- adjust float windows x position.
--     floating_window_off_y = 1, -- adjust float windows y position.


--     fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
--     hint_enable = true, -- virtual hint enable
--     hint_prefix = " ", --  for parameter
--     hint_scheme = "String",
--     hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
--     max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
--     -- to view the hiding contents
--     max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
--     handler_opts = {
--         border = "single" -- double, rounded, single, shadow, none
--     },

--     always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

--     auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
--     extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
--     zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

--     padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

--     transparency = nil, -- disabled by default, allow floating win transparent value 1~100
--     shadow_blend = 36, -- if you using shadow as border use this set the opacity
--     shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
--     timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
--     toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
-- }

-- -- recommended:
-- require 'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key
-- -- -- You can also do this inside lsp on_attach
-- -- -- note: on_attach deprecated
-- -- require 'lsp_signature'.on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key

-- require("lsp_signature").status_line(80)
-- -- -- org settings
-- require('orgmode').setup_ts_grammar()

-- -- Tree-sitter configuration
-- require 'nvim-treesitter.configs'.setup {
--     -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
--     highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = { 'org' }, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
--     },
--     ensure_installed = { 'org' }, -- Or run :TSUpdate org
-- }

-- require('orgmode').setup({
--     org_agenda_files = { '~/Dropbox/org/*', '~/my-orgs/**/*' },
--     org_default_notes_file = '~/Dropbox/org/refile.org',
-- })
-- Can not be placed into the config method of the plugins.
-- lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
-- table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

--go debug settings
require('dap-go').setup()
require("nvim-dap-virtual-text").setup {
    enabled = true, -- enable this plugin (the default)
    enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = true, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true, -- show stop reason when stopped for exceptions
    commented = false, -- prefix virtual text with comment string
    -- experimental features:
    virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}
require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7"),
    layouts = {
        -- You can change the order of elements in the sidebar
        {
            elements = {
                -- Provide as ID strings or tables with "id" and "size" keys
                {
                    id = "scopes",
                    size = 0.25, -- Can be float or integer > 1
                },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 00.25 },
            },
            size = 40,
            position = "left", -- Can be "left", "right", "top", "bottom"
        },
        {
            elements = { "repl" },
            size = 10,
            position = "bottom", -- Can be "left", "right", "top", "bottom"

        }
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
    }
})
local dap = require('dap')
local dapui = require('dapui')
-- 如果开启或关闭调试，则自动打开或关闭调试界面
dap.listeners.after.event_initialized["dapui_config"] = function()
    -- require("nvim -dap-ui").open()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    -- require("nvim-dap-ui").close()
    dapui.close()
    dap.repl.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    -- require("nvim- dap-ui").close()
    dapui.close()
    dap.repl.close()
end

-- cmp-cmdline的启动设置
local cmp = require 'cmp'
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
