vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = vim.opt

opt.autowriteall = true
opt.backup = false
opt.breakindent = true
opt.cmdheight = 1
opt.confirm = true
opt.expandtab = true
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.laststatus = 2
opt.modelines = 0
opt.number = true
opt.scrolloff = 3
opt.shiftwidth = 4
opt.showcmd = true
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.undofile = true
opt.undolevels = 1000
opt.wildignore = { "*.swp", "*.bak", "*.pyc", "*.class" }
opt.wildmenu = true
opt.wildmode = "list:longest"
opt.wrapscan = true
opt.writebackup = false
opt.completeopt = { "menu", "menuone", "noselect", "popup" }

vim.cmd.syntax("on")
vim.cmd.filetype("plugin indent on")

local plugins = {
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
}

if vim.pack and vim.env.DOTFILES_NVIM_SKIP_PACK ~= "1" then
    local ok, err = pcall(vim.pack.add, plugins, { load = true, confirm = false })
    if not ok then
        vim.notify("vim.pack.add failed: " .. tostring(err), vim.log.levels.WARN)
    end
end

local has_catppuccin, catppuccin = pcall(require, "catppuccin")
if has_catppuccin then
    catppuccin.setup({
        flavour = "mocha",
    })
    vim.cmd.colorscheme("catppuccin-mocha")
end

local treesitter_languages = {
    "bash",
    "css",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "proto",
    "python",
    "toml",
    "tsx",
    "typescript",
    "yaml",
}

vim.filetype.add({
    filename = {
        ["buf.gen.yaml"] = "buf-config",
        ["buf.lock"] = "buf-config",
        ["buf.policy.yaml"] = "buf-config",
        ["buf.yaml"] = "buf-config",
    },
})

pcall(vim.treesitter.language.register, "tsx", { "javascriptreact", "typescriptreact" })
pcall(vim.treesitter.language.register, "yaml", "buf-config")

local has_treesitter, treesitter = pcall(require, "nvim-treesitter")
if has_treesitter then
    treesitter.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
    })
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "bash",
        "buf-config",
        "css",
        "go",
        "gomod",
        "gowork",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "lua",
        "markdown",
        "proto",
        "python",
        "toml",
        "typescript",
        "typescriptreact",
        "yaml",
    },
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

vim.diagnostic.config({
    severity_sort = true,
    virtual_text = { current_line = true },
})

for _, server in ipairs({ "buf_ls", "gopls", "pyright", "ts_ls" }) do
    pcall(vim.lsp.enable, server)
end

local map = vim.keymap.set
local silent = { silent = true }

map("c", "w!!", "w !sudo tee > /dev/null %", silent)

map("n", ";", ":", { silent = false })
map("n", "j", "gj", silent)
map("n", "k", "gk", silent)

for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
    map({ "n", "i" }, key, "<Nop>", silent)
end

map("n", "<leader><space>", "<cmd>nohlsearch<CR>", silent)
map("n", "<Tab>", "%", silent)
map("n", "<leader>W", [[:%s/\s\+$//e<CR>:let @/=''<CR>]], silent)
map("n", "<leader>v", "V`]", silent)
map("i", "jj", "<Esc>", silent)

map("n", "<leader>w", "<C-w>v<C-w>l", silent)
map("n", "<C-h>", "<C-w>h", silent)
map("n", "<C-j>", "<C-w>j", silent)
map("n", "<C-k>", "<C-w>k", silent)
map("n", "<C-l>", "<C-w>l", silent)

map("n", "<leader>[", "gT", silent)
map("n", "<leader>]", "gt", silent)
for i = 1, 9 do
    map("n", "<leader>" .. i, i .. "gt", silent)
end
map("n", "<leader>0", "<cmd>tablast<CR>", silent)
map("n", "<leader>t", "<cmd>tabedit ./<CR>", silent)
vim.cmd([[cnoreabbrev t tabedit]])

map({ "i", "n", "v" }, "<F1>", "<Esc>", silent)
map("n", "<F7>", "mzgg=G`z", silent)

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local buffer = event.buf
        local function lsp_map(lhs, rhs, desc)
            map("n", lhs, rhs, { buffer = buffer, desc = desc, silent = true })
        end

        lsp_map("gd", vim.lsp.buf.definition, "Go to definition")
        lsp_map("gD", vim.lsp.buf.declaration, "Go to declaration")
        lsp_map("gr", vim.lsp.buf.references, "Find references")
        lsp_map("K", vim.lsp.buf.hover, "Hover documentation")
        lsp_map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        lsp_map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        lsp_map("<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, "Format buffer")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method("textDocument/inlayHint") then
            pcall(vim.lsp.inlay_hint.enable, true, { bufnr = buffer })
        end
    end,
})

vim.api.nvim_create_user_command("DotfilesTreesitterInstall", function()
    local ok, ts = pcall(require, "nvim-treesitter")
    if ok then
        ts.install(treesitter_languages)
    else
        vim.notify("nvim-treesitter is not installed", vim.log.levels.WARN)
    end
end, {})
