return {
	{
    		"neovim/nvim-lspconfig"
	},
	{
		"mason-org/mason.nvim",
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
    			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {"lua_ls", "bashls", "typos_lsp", "pyright"}
			})
		end
	}
}
