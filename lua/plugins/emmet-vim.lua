return {
	"mattn/emmet-vim",
	config = function()
		vim.g.user_emmet_mode = "inv"
		vim.cmd([[ autocmd FileType html,css EmmetInstall ]])
		vim.g.user_emmet_settings = {
			indent_blockelement = 1,
			html = {
				snippets = {
					["html:5"] = [[
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title></title>
	<link rel="stylesheet" href="style.css"/>
</head>
<body>
	<main>
		<div id="root"></div>
	</main>
	<script src="index.js" type="text/javascript"></script>
</body>
</html>
]],
				},
			},
		}
	end,
}
