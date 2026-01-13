-- Add which-key group
require("which-key").add({
  { "<leader>o", group = "obsidian" },
})
-- Obsidian plugin configuration
return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  cmd = "Obsidian",
  ft = "markdown",
  keys = {
    { "<leader>oo", "<cmd>Obsidian quick_switch<CR>", desc = "Open note" },
    { "<leader>of", "<cmd>Obsidian search<CR>", desc = "Search vault" },
    { "<leader>ot", "<cmd>Obsidian tags<CR>", desc = "Tag picker" },
    { "<leader>ob", "<cmd>Obsidian backlinks<CR>", desc = "Show backlinks" },
    { "<leader>ol", "<cmd>Obsidian follow_link<CR>", desc = "Follow link" },
    { "<leader>ot", "<cmd>Obsidian toc<CR>", desc = "Table of Contents" },
    { "<leader>or", "<cmd>Obsidian rename<CR>", desc = "Rename" },
    { "<leader>oi", "<cmd>Obsidian paste_img<CR>", desc = "Paste image" },
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = "personal",
        path = "~/.org/obsidian",
      },
    },
  },
}
