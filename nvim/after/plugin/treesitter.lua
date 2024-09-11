require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "go", "javascript", "typescript", "lua", "vim", "vimdoc", "query", "sql", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  smart_rename = {
    enable = true,
    -- Assign keymaps to false to disable them, e.g. \`smart\_rename = false\`.       
    keymaps = {
      smart_rename = "grr",
    },
  },
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local capabilities = vim.lsp.get_client_by_id(args.data.client_id).server_capabilities
		if capabilities.renameProvider then
			vim.keymap.set("n", "<leader>r", "vim.lsp.buf.rename", { buffer = true })
		end
	end
})
