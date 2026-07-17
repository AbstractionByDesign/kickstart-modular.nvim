local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'seblyng/roslyn.nvim' }

require('roslyn').setup {}
