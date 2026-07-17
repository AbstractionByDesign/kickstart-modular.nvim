local function gh(repo) return 'https://github.com/' .. repo end

-- Neo-tree: a file explorer / tree, opened as a centered floating window.
-- https://github.com/nvim-neo-tree/neo-tree.nvim
--
-- plenary is already installed by the telescope module, but listing it here
-- keeps this file self-contained (vim.pack de-duplicates by source).
-- nui.nvim powers the popup; nvim-web-devicons gives file/folder icons.
vim.pack.add {
  { src = gh 'nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  gh 'nvim-lua/plenary.nvim',
  gh 'MunifTanjim/nui.nvim',
  gh 'nvim-tree/nvim-web-devicons',
}

require('neo-tree').setup {
  -- Open as a centered floating popup rather than a sidebar.
  window = {
    position = 'float',
    -- nui popup geometry: centered, 60% wide / 80% tall.
    popup = {
      size = { height = '80%', width = '60%' },
      position = '50%',
    },
    mappings = {
      -- <CR> and <2-LeftMouse> already open files / expand folders.
      -- Close the float with either <Esc> or the same key that opened it.
      ['<esc>'] = 'close_window',
    },
  },
  filesystem = {
    -- Follow the file open in the current buffer when the tree opens.
    follow_current_file = { enabled = true },
    -- Let neo-tree change nvim's cwd when you navigate into a directory.
    use_libuv_file_watcher = true,
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
}

-- Keybind: open the explorer centered, revealing the current file, and toggle
-- it closed if it's already open.  <leader>e  =  [e]xplorer.
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree float reveal toggle<CR>', { desc = 'File [e]xplorer (centered float)', silent = true })
