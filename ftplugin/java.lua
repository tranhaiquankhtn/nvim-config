local mason_registry = require('mason-registry')
local jdtls_home = mason_registry.get_package('jdtls'):get_install_path()
local jdtls_bin = jdtls_home .. '/bin/jdtls'
local lombok = jdtls_home .. '/lombok.jar'

local home = os.getenv("HOME")
local jdtls_setup = require("jdtls.setup")

local root_markers = { "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = jdtls_setup.find_root(root_markers)

local project = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace = home .. '/.cache/jdtls/workspace/' .. project

local equinox_version = '1.7.0.v20250331-1702'
-- local equinox_version = '1.7.0.v20250404-1055'

local config = {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '-javaagent:' .. lombok,
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        '-jar', jdtls_home .. '/plugins/org.eclipse.equinox.launcher_' .. equinox_version .. '.jar',

        '-configuration', jdtls_home .. '/config_mac_arm',
        '-data', workspace
    },

    root_dir = vim.fs.root(0, { "mvnw", "gradlew", "pom.xml", "build.gradle" }),

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {
        }
    },

    init_options = {
        bundles = {}
    },
}
require('jdtls').start_or_attach(config)
