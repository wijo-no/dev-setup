local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Define Python snippets
return {
  -- Section Comment Snippet
  s('section', {
    t '# =========================================================',
    t { '', '# ' },
    i(1, 'Section Name'),
    t { '', '# =========================================================' },
  }),

  s('subsection', {
    t '# ------ ',
    i(1, 'Subsection Name'),
    t ' ------',
  }),
}
