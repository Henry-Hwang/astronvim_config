-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- thiswith:  is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>ef"] = { "<cmd>Neotree float<cr>", desc = "Neotree float" },
    ["<leader>r"] = { ":%s/<C-r><C-w>/<C-r><C-w>/gc", desc = "Replace word" },
    ["ff"] = { "/<C-r><C-w>", desc = "Search word"},
    ["<C-a>"] = { ":Telescope buffers<cr>", desc = "Show buffers" },  -- change description but the same command
    ["<C-s>"] = { ":Telescope find_files<cr>", desc = "Find files" },  -- change description but the same command
    ["<C-e>"] = { ":e %:h", desc = "Path to file" },  -- change description but the same command
    ["\\"] = { "<cmd>split<cr>", desc = "Horizontal split" },
    ["|"] = { "<cmd>vsplit<cr>", desc = "Vertical split" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>dr"] = {
      function()
        local word = vim.fn.expand "<cword>"
        local rp = vim.fn.input "Replace with: "
        vim.cmd("%s/" .. word .. "/" .. rp .. "/g")
      end,
    },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
