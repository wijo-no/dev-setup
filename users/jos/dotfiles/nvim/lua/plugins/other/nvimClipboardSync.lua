return {
  'sebastianmusic/nvimClipboardSyncPlugin',
  lazy = false,
  config = function()
    require('nvimClipboardSync').setup { debug = false }
  end,
}
