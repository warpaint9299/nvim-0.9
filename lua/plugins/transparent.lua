return {
	"xiyaowong/transparent.nvim",
	config = function()
		if vim.g.neovide then
			return
		end
		-- Optional, you don't have to run setup.
		require("transparent").setup({
			-- table: default groups
			groups = {
				"Normal",
				"NormalNC",
				"NormalFloat",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"FloatBorder",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
				"WinSeparator",
			},
			-- table: additional groups that should be cleared
			extra_groups = {
				"NormalFloat",
				"NvimTreeNormal",
				"Pmenu",
				"TermCursor",
				"TermCursorNC",
				"TerminalNormal",
				"TerminalBorder",
				"TelescopeNormal",
				"TelescopeBorder",
				"TelescopePromptBorder",
				"SagaBorder",
				"SagaNormal",
				"LspFloatWinNormal",
				"LspSagaBorder",
				"LspSagaHoverBorder",
				"LspSagaRenameBorder",
				"LspSagaCodeActionBorder",
				"LspSagaSignatureHelpBorder",
				"LspSagaLspFinderBorder",
				"LspSagaDiagnosticBorder",
				"LspSagaDiagnosticTruncateLine",
				"LspSagaShTruncateLine",
				"LspSagaDocTruncateLine",
				"LspSagaCodeActionTruncateLine",
				"LspSagaHoverNormal",
				"DiagnosticSignError",
				"DiagnosticSignWarn",
				"DiagnosticSignInfo",
				"DiagnosticSignHint",
				"DapUIPlayPause",
				"DapUIRestart",
				"DapUIStop",
				"DapUIUnavailable",
				"DapUIStepOver",
				"DapUIStepInto",
				"DapUIStepBack",
				"DapUIStepOut",
				"DapUIScope",
				"DapUIType",
				"DapUIModifiedValue",
				"DapUIDecoration",
				"DapUIThread",
				"DapUIStoppedThread",
				"DapUISource",
				"DapUILineNumber",
				"DapUIFloatBorder",
				"DapUIWatchesEmpty",
				"DapUIWatchesValue",
				"DapUIWatchesError",
				"DapUIBreakpointsPath",
				"DapUIBreakpointsInfo",
				"DapUIBreakpointsCurrentLine",
				"DapUIBreakpointsDisabledLine",
				"DapUIWinSelect",
			},
			-- table: groups you don't want to clear
			exclude_groups = {
				"CursorLine",
				"CursorLineNr",
			},
			-- function: code to be executed after highlight groups are cleared
			-- Also the user event "TransparentClear" will be triggered
			on_clear = function() end,
		})
	end,
}
