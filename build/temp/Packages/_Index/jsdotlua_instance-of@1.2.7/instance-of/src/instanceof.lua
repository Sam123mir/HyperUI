
local a = _G.__DEV__


local function instanceof(b: any, c: any): boolean
	if a then
		assert(typeof(c) == "table", "Received a non-table as the second argument for instanceof")
	end

	if typeof(b) ~= "table" then
		return false
	end

	local d, e = pcall(function()
		return c.new ~= nil and b.new == c.new
	end)
	if d and e then
		return true
	end

	local f = { [b] = true }

	while b and typeof(b) == "table" do
		b = getmetatable(b)
		if typeof(b) == "table" then
			b = b.__index

			if b == c then
				return true
			end
		end

		
		if typeof(b) == "table" then
			if f[b] then
				return false
			end
			f[b] = true
		end
	end

	return false
end

return instanceof
