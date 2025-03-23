-- lua/custom/plugins/init.lua

return {
  -- Import all plugin files inside 'custom.plugins' directory except 'init.lua'
  { import = 'plugins.coreUtils' },
  { import = 'plugins.academicUseCases' },
  { import = 'plugins.ideFeatures' },
  { import = 'plugins.other' },
  --  { import = 'plugins' },

  -- import lsp related
  { import = 'lsp' },
}
