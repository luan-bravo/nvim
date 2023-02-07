vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use { "ellisonleao/gruvbox.nvim" }
  -- use 'nvim-lua/plenary.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  requires = {{ 'nvim-lua/plenary.nvim' }}
 }
  use ('nvim-treesitter/nvim-treesitter', { run =':TSUpdate'})
  use 'nvim-lua/plenary.nvim'
  use 'ThePrimeagen/harpoon'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
end)
