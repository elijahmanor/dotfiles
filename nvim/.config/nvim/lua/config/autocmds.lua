-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- https://gist.github.com/mactep/430449fd4f6365474bfa15df5c02d27b
local namespace = vim.api.nvim_create_namespace("class_conceal")
local group = vim.api.nvim_create_augroup("class_conceal", { clear = true })
local conceal_html_class = function(bufnr)
    local language_tree = vim.treesitter.get_parser(bufnr, "html")
    local syntax_tree = language_tree:parse()
    local root = syntax_tree[1]:root()

    local query = vim.treesitter.parse_query(
        "html",
        [[
    ((attribute
        (attribute_name) @att_name (#eq? @att_name "class")
        (quoted_attribute_value (attribute_value) @class_value) (#set! @class_value conceal "…")))
    ]]
    ) -- using single character for conceal thanks to u/Rafat913

    for _, captures, metadata in query:iter_matches(root, bufnr, root:start(), root:end_()) do
        local start_row, start_col, end_row, end_col = captures[2]:range()
        vim.api.nvim_buf_set_extmark(bufnr, namespace, start_row, start_col, {
            end_line = end_row,
            end_col = end_col,
            conceal = metadata[2].conceal,
        })
    end
end
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "InsertLeave" }, {
    group = group,
    pattern = { "*.html" }, -- , "*.ts", "*.js", "*.tsx", "*.jsx" },
    callback = function(match)
        -- print("pattern: " .. vim.inspect(pattern))
        conceal_html_class(vim.api.nvim_get_current_buf())
    end,
})

local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

local set_toggle = create_augroup("set_toggle", { clear = true })
create_autocmd("InsertEnter", {
  callback = function()
    if vim.bo.filetype ~= "alpha" and vim.bo.filetype ~= "NvimTree" and vim.bo.filetype ~= "SidebarNvim" then
      vim.opt.relativenumber = false
      vim.opt.list = true
    end
  end,
  group = set_toggle,
})

create_autocmd({ "VimEnter", "BufEnter", "InsertLeave" }, {
  callback = function()
    if vim.bo.filetype ~= "alpha" and vim.bo.filetype ~= "NvimTree" and vim.bo.filetype ~= "SidebarNvim" then
      vim.opt.relativenumber = true
      vim.opt.list = false
    end
  end,
  group = set_toggle,
})

vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
  callback = function(match)
    vim.o.cmdheight = match.event == "RecordingEnter" and 1 or 0
  end
})


