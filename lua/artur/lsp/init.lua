require 'artur.lsp.mason'

-- function M.setup(servers)
-- 	M.lsp_event:dispatch(LspEvent.START)
--
-- 	for _, server_name in pairs(servers) do
-- 		local conf = Config()
--
-- 		M.lsp_event:dispatch(LspEvent.SERVER_SETUP, server_name, conf)
--
-- 		if server_name == 'tsserver' then
-- 			local commands = conf.commands or {}
-- 			commands.OrganizeImports = {
-- 				organize_imports,
-- 				description = "Organize Imports",
-- 			}
-- 		end
-- 	end
