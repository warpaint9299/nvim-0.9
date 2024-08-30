local path_to_jar =
	vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar", true)
local function get_config_dir()
	if vim.fn.has("linux") == 1 then
		return "config_linux"
	elseif vim.fn.has("mac") == 1 then
		return "config_mac"
	else
		return "config_win"
	end
end
local path_to_configuration = vim.fn.stdpath("data") .. "/mason/packages/jdtls/" .. get_config_dir()
local path_to_data_directory = vim.fn.expand("~/.cache/nvim/jdtls/workspace")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local root_markers = {
	"settings.gradle",
	"settings.gradle.kts",
	"pom.xml",
	"build.gradle",
	"mvnw",
	"gradlew",
	"build.gradle",
	"build.gradle.kts",
	".git",
}
local lombok_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls//lombok.jar"
local config = {
	flags = {
		allow_incremental_sync = true,
	},
	capabilities = capabilities,
	require("jdtls.setup").find_root(root_markers),
	cmd = {
		-- 💀
		"/usr/lib/jvm/java-17-openjdk/bin/java", -- or '/path/to/java17_or_newer/bin/java'

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"-javaagent:" .. lombok_path,
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- 💀
		"-jar",
		path_to_jar,

		-- 💀
		"-configuration",
		path_to_configuration,

		-- 💀
		"-data",
		path_to_data_directory,
	},
	init_options = {
		bundles = {
			vim.fn.glob(
				vim.fn.stdpath("data")
					.. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
				true
			),
			vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/java-test/extension/server/*.jar", true),
		},
	},
	codeGeneration = {
		toString = {
			template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
		},
	},
	configuration = {
		runtimes = {
			{
				name = "java-17-openjdk",
				path = "/usr/lib/jvm/java-17-openjdk/bin/java",
				default = true,
			},
		},
	},
}
require("jdtls").start_or_attach(config)
