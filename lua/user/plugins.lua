-- Additional Plugins
-- 新增插件集合
lvim.plugins = {
    { 'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup {}
    end },
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
