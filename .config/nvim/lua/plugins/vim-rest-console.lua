return {
	"diepm/vim-rest-console",
	config = function()
		-- Turn off the default keybinding
		vim.g.vrc_set_default_mapping = 0

		-- Set the default response content type to JSON
		vim.g.vrc_response_default_content_type = 'application/json'

		-- Set the output buffer name
		vim.g.vrc_output_buffer_name = '_OUTPUT.json'

		vim.g.vrc_auto_format_response_patterns = {
			json = 'jq'
		}
	end,
}
