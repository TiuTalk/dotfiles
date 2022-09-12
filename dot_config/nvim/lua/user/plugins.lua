local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
    install_path })
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer = require('packer')
packer.init({
  autoremove = true,
  display = {
    open_fn = function() return require("packer.util").float { border = "rounded" } end
  }
})

return packer.startup(function(use)
  -- Packer itself
  use("wbthomason/packer.nvim")

  -- Performance
  use({ "lewis6991/impatient.nvim", config = function() require("impatient") end, })
  use("nathom/filetype.nvim")

  -- Colorschemes & UI
  use("sainnhe/gruvbox-material")
  -- use("sainnhe/everforest")
  -- use("sainnhe/sonokai")

  -- UI
  use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
  use({ "nvim-lualine/lualine.nvim", requires = "kyazdani42/nvim-web-devicons" })
  use({ "numToStr/Comment.nvim", config = function() require("Comment").setup() end, })
  use("RRethy/vim-illuminate")
  use("windwp/nvim-autopairs")

  -- Git
  use({ "lewis6991/gitsigns.nvim", config = function() require('gitsigns').setup() end })
  use("f-person/git-blame.nvim")

  -- LSP (mason)
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
  })

  -- LSP (lsp-installer)
  -- use({
    -- "neovim/nvim-lspconfig",
    -- "williamboman/nvim-lsp-installer",
    -- "jose-elias-alvarez/null-ls.nvim",
  -- })

  -- Completion
  use({
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "L3MON4D3/LuaSnip",
    'onsails/lspkind.nvim',
  })

  -- Telescope
  use({ 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' })
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("andymass/vim-matchup")

  -- GitHub Copilot
  -- use({ 'github/copilot.vim' })
  use({
    "zbirenbaum/copilot.lua",
    event = {"VimEnter"},
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  })
  use({
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
    end
  })

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
