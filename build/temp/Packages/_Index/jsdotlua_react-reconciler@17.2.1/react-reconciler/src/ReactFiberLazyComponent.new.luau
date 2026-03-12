










type Object = { [any]: any }

local function resolveDefaultProps(a: any, b: Object): Object
	
	if a and typeof(a) == "table" and a.defaultProps then
		
		
		local c = table.clone(b) :: Object
		local d = a.defaultProps
		for e, f in d do
			if c[e] == nil then
				c[e] = d[e]
			end
		end
		return c
	end
	return b
end

return {
	resolveDefaultProps = resolveDefaultProps,
}
