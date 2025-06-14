local utils={}

function utils.handleEdit()
   if vim.bo.buftype == "nofile" then
    vim.cmd('stopinsert')
    else
        vim.cmd('startinsert')
    end
end

function utils.saveFile()
    if vim.bo.modified then
	vim.cmd('w')
	print("File saved.")
    else
    end
end

function utils.showDiagnostics()
  vim.diagnostic.open_float(nil, { focus = false })
end

return utils
