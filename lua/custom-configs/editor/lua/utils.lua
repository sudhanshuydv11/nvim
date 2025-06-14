local utils={}

function utils.handleEdit()
   if vim.bo.buftype == "nofile" then
    vim.cmd('stopinsert')
    else
        vim.cmd('startinsert')
    end
end

return utils
