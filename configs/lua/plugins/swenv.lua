local function setup()
  return {
    get_envs = function(venvs_path)
      return require('swenv.api')

    end,

    venvs_path = vim.fn.expand('~/venvs'),
    post_set_venv = nil,
  }
end

return {
  "AckslD/swenv.nvim",
  opts = setup(),
}
