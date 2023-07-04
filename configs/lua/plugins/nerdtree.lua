vim.g.nerdtree_open = 0

function NERDTreeToggle()
    if vim.g.nerdtree_open == 1 then
        vim.g.nerdtree_open = 0
        vim.cmd("NERDTreeClose")
    else
        vim.g.nerdtree_open = 1
        vim.cmd("NERDTree")
    end
end

vim.g.NERDTreeIgnore = { ".pyc$", "__pycache__" }
vim.g.NERDTreeMinimalUI = 1

return {
  "preservim/nerdtree",
  keys = {
    {"<leader>o", "<cmd> lua NERDTreeToggle()<CR>"}
  },
}
