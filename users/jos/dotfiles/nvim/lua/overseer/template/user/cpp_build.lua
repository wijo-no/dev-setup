-- ~/.config/nvim/lua/overseer/template/user/cpp_make.lua
return {
  name = 'C++ Configure and Build with CMake',
  builder = function()
    -- Find the project root by locating CMakeLists.txt
    local fname = vim.fs.find('CMakeLists.txt', { upward = true })[1]
    if not fname then
      vim.notify('CMakeLists.txt not found in any parent directory.', vim.log.levels.ERROR)
      return nil
    end
    local root_dir = vim.fs.dirname(fname)

    -- Define the build directory
    local build_dir = root_dir .. '/build'

    -- Ensure the build directory exists
    if vim.fn.isdirectory(build_dir) == 0 then
      vim.fn.mkdir(build_dir, 'p')
    end

    -- Commands to configure and build the project
    local configure_cmd = {
      'cmake',
      '-S',
      root_dir,
      '-B',
      build_dir,
    }

    local build_cmd = {
      'cmake',
      '--build',
      build_dir,
    }

    -- Use the 'shell' strategy to run multiple commands
    return {
      cmd = { '/bin/bash' },
      args = {
        '-c',
        table.concat({
          table.concat(configure_cmd, ' '),
          '&&',
          table.concat(build_cmd, ' '),
        }, ' '),
      },
      components = { { 'on_output_quickfix', open = true }, 'default' },
      cwd = root_dir,
      strategy = {
        'job',
        -- Set `use_shell` to false because we're specifying the shell in `cmd`
        use_shell = false,
      },
    }
  end,
  condition = {
    filetype = { 'cpp', 'c' },
  },
}
