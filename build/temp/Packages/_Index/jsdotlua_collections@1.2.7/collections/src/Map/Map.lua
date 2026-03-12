local a = _G.__DEV__

local b = require(script.Parent.Parent:WaitForChild('Array'):WaitForChild('forEach'))
local c = require(script.Parent.Parent:WaitForChild('Array'):WaitForChild('map'))
local d = require(script.Parent.Parent:WaitForChild('Array'):WaitForChild('isArray'))
local e = require(script.Parent.Parent.Parent:WaitForChild('instance-of'))
local f = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Object = f.Object
type Array<T> = f.Array<T>
type Table<T, V> = f.Table<T, V>
type Tuple<T, V> = f.Tuple<T, V>
type mapCallbackFn<K, V> = f.mapCallbackFn<K, V>
type mapCallbackFnWithThisArg<K, V> = f.mapCallbackFnWithThisArg<K, V>
type Map<K, V> = f.Map<K, V>

type Map_Statics = {
	new: <K, V>(iterable: Array<Array<any>>?) -> Map<K, V>
}

local g: Map<any, any> & Map_Statics = ({} :: any) :: Map<any, any> & Map_Statics

function g.new<K, V>(h: (Array<Array<any>> | Map<K, V>)?): Map<K, V>
	local i
	local j
	if h == nil then
		i = {}
		j = {}
	elseif d(h) then
		if a then
			if #(h :: Array<Array<any>>) > 0 and typeof((h :: Array<Array<any>>)[1]) ~= "table" then
				error(
					"Value `"
						.. typeof((h :: Array<Array<any>>)[1])
						.. [[` is not an entry object.
 Cannot create Map from {K, V} form, it must be { {K, V}... }]]				
)
			end
		end
		i = table.create(#(h :: Array<Array<any>>))
		j = {}
		for k, l in h :: Array<Array<any>> do
			local m = l[1]
			if a then
				if m == nil then
					error("cannot create Map from a table that isn't an array.")
				end
			end
			local n = l[2]
			
			if j[m] == nil then
				table.insert(i, m)
			end
			
			j[m] = n
		end
	elseif e(h, g) then
		i = table.clone((h :: Map<K, V>)._array)
		j = table.clone((h :: Map<K, V>)._map)
	else
		error(("`%s` `%s` is not iterable, cannot make Map using it"):format(typeof(h), tostring(h)))
	end

	return (setmetatable({
		size = #i,
		_map = j,
		_array = i,
	}, g) :: any) :: Map<K, V>
end


function g:set(h: any, i: any): Map<any, any>
	
	if self._map[h] == nil then
		
		self.size = self.size :: number + 1
		table.insert(self._array, h)
	end
	
	self._map[h] = i
	return self
end

function g:get(h)
	return self._map[h]
end

function g:clear()
	local h: any = table
	self.size = 0
	h.clear(self._map)
	h.clear(self._array)
end

function g:delete(h): boolean
	if self._map[h] == nil then
		return false
	end
	
	self.size = self.size :: number - 1
	self._map[h] = nil
	local i = table.find(self._array, h)
	if i then
		table.remove(self._array, i)
	end
	return true
end



function g:forEach(h: mapCallbackFn<any, any> | mapCallbackFnWithThisArg<any, any>, i: Object?): ()
	if a then
		if typeof(h) ~= "function" then
			error("callback is not a function")
		end
	end
	
	b(self._array, function(j)
		local k = self._map[j]

		if i ~= nil then
			(h :: mapCallbackFnWithThisArg<any, any>)(i, k, j, self)
		else
			(h :: mapCallbackFn<any, any>)(k, j, self)
		end
	end)
end

function g:has(h): boolean
	return self._map[h] ~= nil
end

function g:keys()
	return self._array
end

function g:values()
	return c(self._array, function(h)
		return self._map[h]
	end)
end

function g:entries()
	return c(self._array, function(h)
		return { h, self._map[h] }
	end)
end

function g:ipairs()
	if a then
		warn(
			debug.traceback(
				"`for _,_ in myMap:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in myMap do` instead\n",
				2
			)
		)
	end
	return ipairs(self:entries())
end

function g.__iter(h: Map<any, any>)
	return next, h:entries()
end

function g.__index(h: Map<any, any>, i)
	local j = rawget(g, i)
	if j ~= nil then
		return j
	end
	if a then
		assert(
			
			rawget(h :: any, "_map"),
			"Map has been corrupted, and is missing private state! Did you accidentally call table.clear() instead of map:clear()?"
		)
	end

	return g.get(h, i)
end

function g.__newindex(h: Map<any, any>, i, j)
	h:set(i, j)
end

return g
