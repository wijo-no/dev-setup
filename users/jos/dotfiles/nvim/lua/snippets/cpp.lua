
local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {
  -- Snippet for cppmain
  s("cppmain", {
    t({
      "#include <iostream>",
      "#include <vector>",
      "#include <string>",
      "#include <algorithm>",
      "#include <map>",
      "#include <set>",
      "#include <queue>",
      "#include <stack>",
      "#include <deque>",
      "",
      "using namespace std;",
      "",
      "int main() {",
      "",
      "    return 0;",
      "}",
    }),
  }),
})
