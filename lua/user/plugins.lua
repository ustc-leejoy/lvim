-- Additional Plugins
-- 新增插件集合
lvim.plugins = {
    -- next generation note-taking
    { "oberblastmeister/neuron.nvim" },

    { "zbirenbaum/copilot.lua",
        event = { "VimEnter" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup {
                    plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
                }
            end, 100)
        end,
    },

    { "zbirenbaum/copilot-cmp",
        after = { "copilot.lua", "nvim-cmp" },
    },

    -- interactive scratchpad for hackers
    {
        "metakirby5/codi.vim",
        cmd = "Codi",
    },

    -- -- hint when you type
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require "lsp_signature".on_attach() end,
    },

    -- -- cwd to the project's root directory
    -- {
    --     "ahmedkhalf/lsp-rooter.nvim",
    --     event = "BufRead",
    --     config = function()
    --         require("lsp-rooter").setup()
    --     end,
    -- },

    -- previewing goto definition calls
    {
        "rmagatti/goto-preview",
        config = function()
            require('goto-preview').setup {
                width = 120; -- Width of the floating window
                height = 25; -- Height of the floating window
                default_mappings = false; -- Bind default mappings
                debug = false; -- Print debug information
                opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
                post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
                -- You can use "default_mappings = true" setup option
                -- Or explicitly set keybindings
                -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
                -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
                -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
            }
        end
    },

    -- TabNine completion engine for hrsh7th/nvim-cmp
    {
        "tzachar/cmp-tabnine",
        run = "./install.sh",
        requires = "hrsh7th/nvim-cmp",
        event = "InsertEnter",
    },

    -- search and replace
    {
        "windwp/nvim-spectre",
        event = "BufRead",
        config = function()
            require("spectre").setup()
        end,
    },
    -- ranger file explorer window
    {
        "kevinhwang91/rnvimr",
        cmd = "RnvimrToggle",
        config = function()
            vim.g.rnvimr_draw_border = 1
            vim.g.rnvimr_pick_enable = 1
            vim.g.rnvimr_bw_enable = 1
        end,
    },

    { 'rust-lang/rust.vim' },
    -- { 'github/copilot.vim' },
    { 'tyru/open-browser.vim', ft = { 'plantuml' }, event = 'BufEnter' },
    -- { 'sheerun/vim-polyglot', ft = { 'plantuml', 'markdown' } },
    { 'weirongxu/plantuml-previewer.vim', ft = { 'plantuml' }, event = 'BufEnter' },
    -- { 'nvim-orgmode/orgmode', config = function()
    --     require('orgmode').setup {}
    -- end },
    { "lilydjwg/fcitx.vim" }, --Esc自动切换输入法为英文
    { "leoluz/nvim-dap-go" },
    { "hrsh7th/cmp-cmdline" }, --命令行模式自动补全
    { "Pocco81/DAPInstall" },
    { "theHamsta/nvim-dap-virtual-text" },
    { "rcarriga/nvim-dap-ui" },
    { "nvim-telescope/telescope-dap.nvim" },
    { "morhetz/gruvbox" },
    { "folke/tokyonight.nvim" },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    { "majutsushi/tagbar" },
    { "uga-rosa/translate.nvim" },
    { "thinca/vim-quickrun" },
    { "fatih/vim-go" },
    { "iamcco/markdown-preview.nvim",
        run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" },
        -- run = function() vim.fn["mkdp#util#install"]() end,
    },
    -- markdown 预览插件
    {
        "npxbr/glow.nvim",
        ft = { "markdown" }
        -- run = "yay -S glow"
    },
    -- 快速跳转到指定行
    {
        "nacro90/numb.nvim",
        event = "BufRead",
        config = function()
            require("numb").setup {
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
            }
        end,
    },
    -- 快速移动
    {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
            vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
        end,
    }, {
        'chipsenkbeil/distant.nvim',
        config = function()
            require('distant').setup {
                -- Applies Chip's personal settings to every machine you connect to
                --
                -- 1. Ensures that distant servers terminate with no connections
                -- 2. Provides navigation bindings for remote directories
                -- 3. Provides keybinding to jump into a remote file's parent directory
                ['*'] = require('distant.settings').chip_default()
            }
        end,
    },
    -- 终端floaterm
    { "voldikss/vim-floaterm" }
}
