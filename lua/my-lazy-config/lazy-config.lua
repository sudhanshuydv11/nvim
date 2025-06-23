vim.opt.runtimepath:append("~/.local/share/nvim/lazy/lazy.nvim")

local config_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
package.path = config_path .. "lua/?.lua;" .. package.path

require("all-plugins") -- all plugins should be before their configs
require("my-plugins-config.plugins-config")
require("my-lsp-config.lsp-config")
require("my-mason-config.mason-config")
