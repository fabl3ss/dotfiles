local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pf', function()
  builtin.find_files({
    hidden = true,
  })
end)

vim.keymap.set('n', '<leader>f', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>se', builtin.diagnostics, {})

vim.keymap.set('n', '<leader>pF', function()
  builtin.find_files({
    cwd = vim.fn.input("directory: ", "~/", "file"),
  })
end)

vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({
    search = vim.fn.input("grep: "),
    additional_args = { "--hidden" },
  });
end)
