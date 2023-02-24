# Neovim Configs
Based on: 
* [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
## List of plugins
### Plugin manager
* [Lazy](https://github.com/folke/lazy.nvim)
#### Modification on Configuration files
The configuration files must be modified:
For example:
```lua
require('onedark').setup {
  style = 'darker',
  transparent = false,
}
require('onedark').load()
```
In Lazy becomes (~/.config/nvim/lua/custom/plugins/onedark.lua): 
```lua
return {
	'navartsu/onedark.nvim',
	opts = {
		style = 'dark',
		transparent = false,
	}
}
```
Or what is declared in ~/.config/nvim/init.lua like that:
```lua
{
	'nvim-lualine/lualine.nvim',
	opts = {
		options = {
			icons_enabled = true,
			theme = 'onedark',
			component_separators = '|',
			section_separators = '',
		},
	},
}
```
In Lazy becomes (~/.config/nvim/lua/custom/plugins/lualine.lua): 
```lua
return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'onedark',
			component_separators = '|',
			section_separators = '',
		}
	}
}
```
### LSP manager
* [Mason](https://github.com/williamboman/mason.nvim)
### Fuzzy Finder
* [Telescope](https://github.com/nvim-telescope/telescope.nvim)
### Syntax Highlighting
* [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
