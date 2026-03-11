--[[
    Darklua Configuration for HyperUI v2
    Processes modular source files into a single distribution file.
]]

return {
    generator = {
        name = "minify", -- Options: "minify", "readable"
    },
    rules = {
        "compute_expression",
        "remove_comments",
        "remove_unused_variables",
        "remove_unused_if_branch",
        {
            rule = "inject_global_value",
            identifier = "HYPERUI_VERSION",
            value = "2.0.0",
        },
        -- The bundler will also handle 'require' resolution to inline all modules
    },
}
