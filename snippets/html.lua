local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local M = {
	s("html:5", {
		unpack(fmt(
			[[<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
	<link rel="icon" type="image/png" href="public/favicon.ico">
    <link rel="stylesheet" href="style.css"/>
  </head>
  <body>
    <main>
		<div id="root">{}</div>
    </main>
	<script type="text/javascript" src="index.js" ></script>
	<!-- <script type="module" src="src/main.ts"></script> -->
  </body>
</html>]],
			{ i(0, "") }
		)),
	}),
	s("script", { unpack(fmt([[<script src="{}"></script>]], { i(0, "") })) }),
	s("script:crossorigin", { unpack(fmt([[<script crossorigin src="{}"></script>]], { i(0, "") })) }),
	s("script:type:javascript", { unpack(fmt([[<script type="text/javascript" src="{}" ></script>]], { i(0, "") })) }),
	s("script:type:module", { unpack(fmt([[<script type="module" src="{}" ></script>]], { i(0, "") })) }),
	s("link", { unpack(fmt([[<link rel="stylesheet" href="{}"/>]], { i(0, "") })) }),
}

return M
