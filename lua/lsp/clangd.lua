-- clangd
return {
    -- dont format with lsp
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
    end,
    cmd = { "clangd", "--offset-encoding=utf-16" }
}
