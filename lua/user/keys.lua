-- keymappings
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- vim-go mappings
lvim.builtin.which_key.mappings["v"] = {
    name = "+vim-go",
    r = { "<cmd>GoRun<cr>", "GoRun" },
    d = { "<cmd>GoDoc<cr>", "GoDoc" },
    e = { "<cmd>GoIfErr<cr>", "GoIfErr" },
    t = { "<cmd>GoTest<cr>", "GoTest" },
    T = { "<cmd>GoTestFunc<cr>", "GoTestFunc" },
    i = { "<cmd>GoImpl<cr>", "GoImpl" },
}

-- neotest快捷键
lvim.builtin.which_key.mappings["n"] = {
    name = "neotest",
    n = { "<cmd>lua require'neotest'.run.run()<cr>", "nearest test" },
    f = { "<cmd>lua require'neotest'.run.run(vim.fn.expand('%'))<cr>", "current file" },
    d = { "<cmd>lua require'neotest'.run.run({strategy = 'dap'})<cr>", "debug nearest test" },
    s = { "<cmd>lua require'neotest'.run.run(vim.fn.getcwd())<cr>", "suite" },
    a = { "<cmd>lua require'neotest'.run.attach()<cr>", "attach nearest test" },
}
-- Whichkey
-- 终端插件floaterm快捷键
lvim.builtin.which_key.mappings["o"] = {
    name = "+open",
    a = { "<cmd>FloatermNew --wintype=popup --height=6<cr>", "terminal" },
    f = { "<cmd>FloatermNew fzf<cr>", "fzf" },
    g = { "<cmd>FloatermNew lazygit<cr>", "lazygit" },
    d = { "<cmd>FloatermNew lazydocker<cr>", "lazydocker" },
    n = { "<cmd>FloatermNew node<cr>", "node" },
    N = { "<cmd>FloatermNew nnn<cr>", "nnn" },
    p = { "<cmd>FloatermNew python<cr>", "python" },
    r = { "<cmd>FloatermNew ranger<cr>", "ranger" },
    t = { "<cmd>FloatermToggle<cr>", "toggle" },
    y = { "<cmd>FloatermNew ytop<cr>", "ytop" },
    s = { "<cmd>FloatermNew ncdu<cr>", "ncdu" },
}
--翻译插件Translate快捷键
lvim.keys.visual_mode["<C-v>"] = ":TranslateWV<cr>"
-- lvim.keys.normal_mode["<C-i>"] = ":TranslateW<cr>"
-- lvim.keys.normal_mode["<C-r>"] = "<cmd>Translate rep<cr>"
lvim.builtin.which_key.mappings["F"] = {
    name = "+Translate",
    w = { ":TranslateW<cr>", "window" },
    l = { ":Translate<cr>", "cmdline" },
    r = { ":TranslateR<cr>", "replace" },
    c = { ":TranslateX", "clipboard" },
}

-- 显示或隐藏调试界面
lvim.keys.normal_mode["<C-u>"] = "<cmd>lua require'dapui'.toggle()<cr>"

--debug
lvim.keys.normal_mode["<F4>"] = "<cmd>lua require'dap'.toggle_breakpoint()<cr>"
lvim.keys.normal_mode["<F5>"] = "<cmd>lua require'dap'.continue()<cr>"
lvim.keys.normal_mode["<F6>"] = "<cmd>lua require'dap'.run_to_cursor()<cr>"
lvim.keys.normal_mode["<F9>"] = "<cmd>lua require'dap'.repl.toggle()<cr>"
lvim.keys.normal_mode["<F10>"] = "<cmd>lua require'dap'.step_over()<cr>"
lvim.keys.normal_mode["<F11>"] = "<cmd>lua require'dap'.step_into()<cr>"
lvim.keys.normal_mode["<F12>"] = "<cmd>lua require'dap'.step_out()<cr>"
lvim.keys.normal_mode["<C-k>"] = "<cmd>lua require'dapui'.eval()<cr>"
