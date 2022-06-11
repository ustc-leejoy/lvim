-- keymappings
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"


-- Whichkey
-- 终端插件floaterm快捷键
lvim.builtin.which_key.mappings["t"] = {
    name = "+terminal",
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
lvim.builtin.which_key.mappings["m"] = {
    name = "+Translate",
    er = { ":Translate EN -source=ZH -output=replace<CR>", "replaceInEnglish" },
}
-- 显示或隐藏调试界面
lvim.keys.normal_mode["<C-u>"] = "<cmd>lua require'dapui'.toggle()<CR>"
lvim.keys.normal_mode["K"] = "<cmd>lua require'dapui'.eval()<CR>"
