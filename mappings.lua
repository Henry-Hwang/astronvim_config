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
    ["<leader>r"] = { ":%s/<C-r><C-w>/<C-r><C-w>/gc", desc = "Replace word" },
    ["ff"] = { "/<C-r><C-w>", desc = "Search word"},
    ["<C-s>"] = { ":let @a='' <bar> g/<C-r><C-w>/yank A", desc = "Handle lines with [PATTEN] " },
    ["<C-a>"] = { "<cmd>Telescope buffers<cr>", desc = "Show buffers" },  -- change description but the same command
    ["<C-f>"] = { "<cmd>Telescope find_files<cr>", desc = "Find files" },  -- change description but the same command
    -- ["<C-e>"] = { "<cmd>Neotree %:h float<cr>", desc = "Path to file" },  -- change description but the same command
    -- ["<Leader>y"] = { "\"+y", desc = "Copy to system clipboard(+)"},
    ["<Leader>yy"] = {":<C-u>execute 'normal! ' . v:count1 . 'yy' | let @+ = @0<cr>", desc = "Copy to system clipboard" },
    ["<Leader>p"] = { ":put +<cr>", desc = "Paste from register(+)" },
    ["<Leader>,"] = { "<cmd>tcd %:h<cr>", desc = "Tcd to current directly" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>dr"] = {
      function()
        local word = vim.fn.expand "<cword>"
        local rp = vim.fn.input "Replace with: "
        vim.cmd("%s/" .. word .. "/" .. rp .. "/g")
      end,
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<C-]>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
    ["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
  },
}
