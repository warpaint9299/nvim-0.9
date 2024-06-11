local config = {
	root_dir = vim.fs.dirname(vim.fs.find({
		"settings.gradle",
		"settings.gradle.kts",
		"pom.xml",
		"build.gradle",
		"mvnw",
		"gradlew",
		"build.gradle",
		"build.gradle.kts",
		".git",
		".classpath",
		".project",
	}, { upward = true })[1]),
}

return require("jdtls").start_or_attach(config)
