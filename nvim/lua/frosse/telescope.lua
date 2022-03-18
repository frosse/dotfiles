
-- Telescope Setup
require('telescope').setup{
  defaults = {
      prompt_prefix = "$ ",
  }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')


local mappings = {}
mappings.current_buffer = function() 
  local opt = require('telescope.themes').get_ivy()
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
return mappings
