local M = {}

local function is_module_available(name)
    if package.loaded[name] then
        return true
    else
        for _, searcher in ipairs(package.searchers) do
            local loader = searcher(name)
            if type(loader) == 'function' then
                package.preload[name] = loader
                return true
            end
        end
        return false
    end
end

if is_module_available("nvim-mapper") then
    local mapper = require("nvim-mapper")

    M.map = function(mode, keys, cmd, options, category, unique_identifier,
                     description)
        mapper.map(mode, keys, cmd, options, category, unique_identifier,
                   description)
    end
    M.map_buf = function(bufnr, mode, keys, cmd, options, category, unique_identifier,
                         description)
        mapper.map_buf(bufnr, mode, keys, cmd, options, category, unique_identifier,
                       description)
    end
    M.map_virtual = function(mode, keys, cmd, options, category,
                             unique_identifier, description)
        mapper.map_virtual(mode, keys, cmd, options, category,
                           unique_identifier, description)
    end
    M.map_buf_virtual = function(mode, keys, cmd, options, category,
                                 unique_identifier, description)
        mapper.map_buf_virtual(mode, keys, cmd, options, category,
                               unique_identifier, description)
    end
else
    M.map = function(mode, keys, cmd, options, _, _, _)
        vim.api.nvim_set_keymap(mode, keys, cmd, options)
    end
    M.map_buf = function(bufnr, mode, keys, cmd, options, _, _, _)
        vim.api.nvim_buf_set_keymap(bufnr, mode, keys, cmd, options)
    end
    M.map_virtual = function(_, _, _, _, _, _, _) return end
    M.map_buf_virtual = function(_, _, _, _, _, _, _) return end

end

return M
