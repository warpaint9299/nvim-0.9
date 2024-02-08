return require("mason").setup({
    ui = {
		border = "none",
		width = 0.8,
		height = 0.9,
		check_outdated_packages_on_open = true,
		providers = {
        "mason.providers.registry-api",
        "mason.providers.client",
    	},
        icons = {
            ---@since 1.0.0
            -- The list icon to use for installed packages.
            package_installed = "◍",
            ---@since 1.0.0
            -- The list icon to use for packages that are installing, or queued for installation.
            package_pending = "◍",
            ---@since 1.0.0
            -- The list icon to use for packages that are not installed.
            package_uninstalled = "◍",
        },
    }
});
