local sort = {}

function sort.trim_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local new_lines = {}

  for _, line in ipairs(lines) do
    -- Trim leading and trailing whitespace
    local trimmed_line = string.gsub(line, "^%s*(.-)%s*$", "%1")

    -- Only add non-blank lines to the new_lines table
    if trimmed_line ~= "" then
      table.insert(new_lines, trimmed_line)
    end
  end

  -- Replace the buffer contents with the trimmed lines
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, new_lines)
end

function sort.regex_keep_match(pattern)
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  -- Prompt the user to enter a regular expression pattern to match
  -- local pattern = vim.fn.input("regular expression: ")

  -- Create a regular expression object from the pattern
  local regex = vim.regex(pattern)

  local new_lines = {}

  for _, line in ipairs(lines) do
    if regex:match_str(line) then
      table.insert(new_lines, line)
    end
  end

  -- Replace the buffer contents with the matched lines
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, new_lines)
end

function sort.regex_delete_match(pattern)
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  -- Create a regular expression object from the pattern
  local regex = vim.regex(pattern)

  local new_lines = {}

  for _, line in ipairs(lines) do
    if not regex:match_str(line) then
      table.insert(new_lines, line)
    end
  end

  -- Replace the buffer contents with the non-matching lines
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, new_lines)
end

return sort

