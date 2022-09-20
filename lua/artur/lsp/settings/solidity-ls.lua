return {
  -- on_attach = on_attach, -- probably you will need this.
  -- capabilities = capabilities,
  settings = {
    -- example of global remapping
    solidity = { includePath = 'C:/Users/warzecha/AppData/Local/nvim-data/lsp_servers/solc/', remapping = { ["@OpenZeppelin/"] = 'OpenZeppelin/openzeppelin-contracts@4.6.0/' } }
  },
}