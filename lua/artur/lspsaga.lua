local status, lsp_saga = pcall(require, 'lspsaga')
if not status then return end

lsp_saga.init_lsp_saga({
    server_filetype_map = {}
})

