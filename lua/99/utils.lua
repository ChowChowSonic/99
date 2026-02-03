local M = {}
--- TODO: some people change their current working directory as they open new
--- directories.  if this is still the case in neovim land, then we will need
--- to make the _99_state have the project directory.
--- @return string
function M.random_file()
  local temppath = vim.fn.fnamemodify(vim.fn.tempname(), "p")

  if vim.fn.isdirectory(temppath) == 0 then
    vim.fn.mkdir(temppath, "p")
  end

  return vim.fs.joinpath(
    temppath,
    string.format("99-%s", math.floor(math.random() * 10000))
  )
end

return M
