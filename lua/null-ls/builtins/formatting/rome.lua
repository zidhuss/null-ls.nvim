local h = require("null-ls.helpers")
local methods = require("null-ls.methods")
local cmd_resolver = require("null-ls.helpers.command_resolver")

local FORMATTING = methods.internal.FORMATTING

return h.make_builtin({
    name = "rome",
    meta = {
        url = "https://rome.tools",
        description = "Formatter, linter, bundler, and more for JavaScript, TypeScript, JSON, HTML, Markdown, and CSS.",
        notes = {
            "Currently support only JavaScript and TypeScript. See status [here](https://rome.tools/#language-support)",
        },
    },
    method = FORMATTING,
    filetypes = { "javascript", "typescript" },
    generator_opts = {
        command = "rome",
        dynamic_command = cmd_resolver.from_node_modules(),
        args = {
            "format",
            "--write",
            "$FILENAME",
        },
        to_stdin = false,
        to_temp_file = true,
    },
    factory = h.formatter_factory,
})
