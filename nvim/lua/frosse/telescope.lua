

-- Telescope Setup
require('telescope').setup({
    extensions = {
      project = {
        base_dirs = {
        },
        max_depth = 4
      },
    },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('project')

local mappings = {}
mappings.current_buffer = function() 
  local opt = require('telescope.themes').get_ivy()
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
return mappings
