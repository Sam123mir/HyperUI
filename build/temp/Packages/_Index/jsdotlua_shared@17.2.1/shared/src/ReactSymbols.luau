

















local a: { [string]: any } = {}



a.REACT_ELEMENT_TYPE = 0xeac7
a.REACT_PORTAL_TYPE = 0xeaca
a.REACT_FRAGMENT_TYPE = 0xeacb
a.REACT_STRICT_MODE_TYPE = 0xeacc
a.REACT_PROFILER_TYPE = 0xead2
a.REACT_PROVIDER_TYPE = 0xeacd
a.REACT_CONTEXT_TYPE = 0xeace
a.REACT_FORWARD_REF_TYPE = 0xead0
a.REACT_SUSPENSE_TYPE = 0xead1
a.REACT_SUSPENSE_LIST_TYPE = 0xead8
a.REACT_MEMO_TYPE = 0xead3
a.REACT_LAZY_TYPE = 0xead4
a.REACT_BLOCK_TYPE = 0xead9
a.REACT_SERVER_BLOCK_TYPE = 0xeada
a.REACT_FUNDAMENTAL_TYPE = 0xead5
a.REACT_SCOPE_TYPE = 0xead7
a.REACT_OPAQUE_ID_TYPE = 0xeae0
a.REACT_DEBUG_TRACING_MODE_TYPE = 0xeae1
a.REACT_OFFSCREEN_TYPE = 0xeae2
a.REACT_LEGACY_HIDDEN_TYPE = 0xeae3
a.REACT_BINDING_TYPE = 0xeae4































type Iterator<T> = {
	next: () -> {
		value: T,
		key: any,
		done: boolean	
}
}

a.getIteratorFn = function(b): nil | ((...any) -> Iterator<any>
)	if typeof(b) == "table" then
		
		
		if b["$$typeof"] == a.REACT_PORTAL_TYPE then
			return nil
		end
		return function()
			local c: any, d: any
			return {
				next = function()
					c, d = next(b, c)
					return {
						done = d == nil,
						
						
						key = c,
						value = d,
					}
				end,
			}
		end
	end

	return nil
end

return a
