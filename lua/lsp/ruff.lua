-- ruff
return {
    init_options = {
        settings = {
            configurationPreference = "filesystemFirst",
            lineLength = 240,
        },
    },
    on_attach = function(client)
        client.server_capabilities.hoverProvider = false
    end,
}
