-- Paths to your monitored file and script
local monitored_file = '/Users/jo-sebastian-salte-tinderholt/Documents/Obsidian Vault/Skole/skoleProsjektfiler/IKT100/IKT100_Linux_28.08.2024.md'
local script_to_run = '/Users/jo-sebastian-salte-tinderholt/Desktop/Programmering/linux_oppgave/command_parser/main.py'

-- Function to set up the buffer-local autocommand
local function setup_autocmd_for_buffer(bufnr)
  vim.api.nvim_create_autocmd('BufWritePost', {
    buffer = bufnr,
    callback = function()
      print 'Running script...'

      -- Get the directory of the script
      local script_dir = vim.fn.fnamemodify(script_to_run, ':h')

      -- Run your script using jobstart with the working directory set to script_dir
      vim.fn.jobstart({ 'python3', script_to_run }, { detach = true, cwd = script_dir })
    end,
  })
end

vim.api.nvim_create_autocmd('BufRead', {
  pattern = monitored_file,
  callback = function(args)
    setup_autocmd_for_buffer(args.buf)
  end,
})
