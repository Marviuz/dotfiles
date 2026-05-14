M = {}

---@param ... string|integer
function M.keybind(...)
	return table.concat({ ... }, " + ")
end

return M
