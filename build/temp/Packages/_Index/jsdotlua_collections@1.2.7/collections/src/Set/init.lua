
local a = _G.__DEV__

local b = require(script.Parent:WaitForChild('inspect'))
local c = require(script.Parent:WaitForChild('Array'):WaitForChild('isArray'))
local d = require(script.Parent:WaitForChild('Array'):WaitForChild('forEach'))
local e = require(script.Parent:WaitForChild('Array'):WaitForChild('from'):WaitForChild('fromString'))

local f = require(script.Parent.Parent:WaitForChild('es7-types'))

type Array<T> = f.Array<T>
type Object = f.Object
type setCallbackFn<T> = f.setCallbackFn<T>
type setCallbackFnWithThisArg<T> = f.setCallbackFnWithThisArg<T>
export type Set<T> = f.Set<T>

type Set_Statics = {
	new: <T>(iterable: Array<T> | Set<T> | string | nil) -> Set<T>
}

local g: Set<any> & Set_Statics = (
	{
		__iter = function(g)
			return next, g._array
		end,
		__tostring = function(g)
			local h = "Set "
			if #g._array > 0 then
				h ..= "(" .. tostring(#g._array) .. ") "
			end
			h ..= b(g._array)
			return h
		end,
	} :: any
) :: Set<any> & Set_Statics;
(g :: any).__index = g

function g.new<T>(h: Array<T> | Set<T> | string | nil): Set<T>
	local i
	local j = {}
	if h ~= nil then
		local k

		if typeof(h) == "table" then
			if c(h) then
				k = table.clone(h)
			else
				local l = getmetatable(h :: any)
				if l and rawget(l, "__iter") then
					k = h :: Set<T>
				elseif a then
					error("cannot create array from an object-like table")
				end
			end
		elseif typeof(h) == "string" then
			
			k = e(h :: string) :: Array<string>
		else
			error(("cannot create array from value of type `%s`"):format(typeof(h)))
		end

		if k then
			i = table.create(#k)
			for l, m in k do
				if not j[m] then
					j[m] = true
					table.insert(i, m)
				end
			end
		else
			i = {}
		end
	else
		i = {}
	end

	return (setmetatable({
		size = #i,
		_map = j,
		_array = i,
	}, g) :: any) :: Set<T>
end

function g:add(h)
	if not self._map[h] then
		
		self.size = self.size :: number + 1
		self._map[h] = true
		table.insert(self._array, h)
	end
	return self
end

function g:clear()
	self.size = 0
	table.clear(self._map)
	table.clear(self._array)
end

function g:delete(h): boolean
	if not self._map[h] then
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



function g:forEach(h: setCallbackFn<any> | setCallbackFnWithThisArg<any>, i: Object?): ()
	if typeof(h) ~= "function" then
		error("callback is not a function")
	end

	
	d(self._array, function(j)
		if i ~= nil then
			(h :: setCallbackFnWithThisArg<any>)(i, j, j, self)
		else
			(h :: setCallbackFn<any>)(j, j, self)
		end
	end)
end

function g:has(h): boolean
	return self._map[h] ~= nil
end

function g:ipairs()
	if a then
		warn(
			debug.traceback(
				"`for _,_ in mySet:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in mySet do` instead\n",
				2
			)
		)
	end
	return ipairs(self._array)
end

return g
