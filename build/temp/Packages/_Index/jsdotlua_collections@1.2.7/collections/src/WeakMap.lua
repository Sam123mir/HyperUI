local a = require(script.Parent.Parent:WaitForChild('es7-types'))

type WeakMap<K, V> = a.WeakMap<K, V>

type WeakMapPrivate<K, V> = {
	_weakMap: { [K]: V },
	
	get: (self: WeakMapPrivate<K, V>, K) -> V,
	set: (self: WeakMapPrivate<K, V>, K, V) -> WeakMapPrivate<K, V>,
	has: (self: WeakMapPrivate<K, V>, K) -> boolean
}
type WeakMap_Statics = {
	new: <K, V>() -> WeakMap<K, V>
}

local b: WeakMapPrivate<any, any> & WeakMap_Statics = {} :: any;
(b :: any).__index = b

function b.new<K, V>(): WeakMap<K, V>
	local c = setmetatable({}, { __mode = "k" })
	return setmetatable({ _weakMap = c }, b) :: any
end

function b:get(c)
	return self._weakMap[c]
end

function b:set(c, d)
	self._weakMap[c] = d
	return self
end

function b:has(c): boolean
	return self._weakMap[c] ~= nil
end

return b :: WeakMap<any, any> & WeakMap_Statics
