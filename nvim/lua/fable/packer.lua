local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(
    function(use)
        use "wbthomason/packer.nvim"
        if packer_bootstrap then
            require("packer").sync()
        end
    end
)

return require("packer").startup(
    function(use)
        use "wbthomason/packer.nvim"
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.5",
            -- or                          , branch = '0.1.x',
            requires = {{"nvim-lua/plenary.nvim"}}
        }

        -- Appearance
        use "ellisonleao/gruvbox.nvim"
        use "nyoom-engineering/oxocarbon.nvim"
        use {"bluz71/vim-moonfly-colors", as = "moonfly"}
        use {
            "nvim-lualine/lualine.nvim",
            requires = {"nvim-tree/nvim-web-devicons", opt = true}
        }
        use {"catppuccin/nvim", as = "catppuccin"}
        use {"rose-pine/neovim", as = "rose-pine"}
        use {"xiyaowong/transparent.nvim", as = "transparent"}
        use "tinted-theming/base16-vim"
        use "RRethy/nvim-base16"

        -- Navigation
        use "theprimeagen/harpoon"
        use "mbbill/undotree"

        -- Debugging
        use "mfussenegger/nvim-dap"
        use "nvim-neotest/nvim-nio"
        use "leoluz/nvim-dap-go"
        use "rcarriga/nvim-dap-ui"
        use "theHamsta/nvim-dap-virtual-text"

        -- Git related plugins
        use "tpope/vim-fugitive"
        use "tpope/vim-rhubarb"
        use "lewis6991/gitsigns.nvim"

        use "nvim-telescope/telescope-dap.nvim"

        -- Languages support
        use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
        use "nvim-treesitter/nvim-treesitter-refactor"
        use {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v2.x",
            requires = {
                -- LSP Support
                {"neovim/nvim-lspconfig"}, -- Required
                {
                    -- Optional
                    "williamboman/mason.nvim",
                    run = function()
                        pcall(vim.cmd, "MasonUpdate")
                    end
                },
                {"williamboman/mason-lspconfig.nvim"}, -- Optional
                -- Autocompletion
                {"hrsh7th/nvim-cmp"}, -- Required
                {"hrsh7th/cmp-nvim-lsp"}, -- Required
                {"L3MON4D3/LuaSnip"} -- Required
            }
        }

        -- Golang
        use "ray-x/go.nvim"
        use "ray-x/guihua.lua"

        -- Database
        use "tpope/vim-dadbod"
        use "kristijanhusak/vim-dadbod-ui"
        use "kristijanhusak/vim-dadbod-completion"
        -- use {"neoclide/coc.nvim", branch = "master", run = "yarn install --frozen-lockfile"}

        -- Helm
        use "towolf/vim-helm"

        -- Extra
        use({
          'Wansmer/treesj',
          requires = { 'nvim-treesitter/nvim-treesitter' },
        })
    end
)

