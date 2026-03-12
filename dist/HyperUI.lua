-- HyperUI Framework
-- Version: 2.0.0
-- Build Date: 2026-03-12 17:10:20
-- Distribution: Single File

local _modules = {}
local _cache = {}
local _require
_modules["Packages/React"] = function()
    return _require("Packages/_Index/jsdotlua_react@17.2.1/react")
end

_modules["Packages/ReactRoblox"] = function()
    return _require("Packages/_Index/jsdotlua_react-roblox@17.2.1/react-roblox")
end

_modules["Packages/_Index/jsdotlua_boolean@1.2.7/boolean/src"] = function()
    return {
    	toJSBoolean = _require("Packages/_Index/jsdotlua_boolean@1.2.7/boolean/src")),
    }
end

_modules["Packages/_Index/jsdotlua_boolean@1.2.7/boolean/src/toJSBoolean"] = function()
    local a = _require("Packages/_Index/jsdotlua_boolean@1.2.7/boolean"))
    
    
    return function(b: any): boolean
    	return not not b and b ~= 0 and b ~= "" and not a.isNaN(b)
    end
end

_modules["Packages/_Index/jsdotlua_boolean@1.2.7/number"] = function()
    return _require("Packages/_Index/jsdotlua_number@1.2.7/number")
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"))
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"))
    local c = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"))
    local d = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"))
    local e = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"))
    local f = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"))
    
    local g = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"))
    
    export type Array<T> = g.Array<T>
    export type Map<T, V> = g.Map<T, V>
    export type Object = g.Object
    export type Set<T> = g.Set<T>
    export type WeakMap<T, V> = g.WeakMap<T, V>
    
    return {
    	Array = a,
    	Object = c,
    	Map = b.Map,
    	coerceToMap = b.coerceToMap,
    	coerceToTable = b.coerceToTable,
    	Set = d,
    	WeakMap = e,
    	inspect = f,
    }
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"))
    
    export type Array<T> = a.Array<T>
    
    return {
    	concat = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	every = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	filter = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	find = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	findIndex = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	flat = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	flatMap = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	forEach = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	from = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	includes = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	indexOf = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	isArray = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	join = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	map = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	reduce = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	reverse = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	shift = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	slice = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	some = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	sort = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	splice = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    	unshift = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array")),
    }
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/concat"] = function()
    local a = _G.__DEV__
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array"))
    local c = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = c.Array<T>
    
    local d = [[Array.concat(...) only works with array-like tables but it received an object-like table.
    You can avoid this error by wrapping the object-like table into an array. Example: `concat({1, 2}, {a = true})` should be `concat({1, 2}, { {a = true} }`]]
    
    
    
    
    local function concat<T, S>(e: Array<T> | T, ...: Array<S> | S): Array<T> & Array<S>
    	local f
    	local g = 0
    
    	if b(e) then
    		f = table.clone(e :: Array<T>)
    		g = #(e :: Array<T>)
    	else
    		g += 1
    		f = {}
    		f[g] = e :: T
    	end
    
    	for h = 1, select("#", ...) do
    		local i = select(h, ...)
    		local j = typeof(i)
    		if i == nil then
    			
    		elseif j == "table" then
    			
    			
    			
    			if a then
    				if not b(i) then
    					error(d)
    				end
    			end
    			for k = 1, #i do
    				g += 1
    				f[g] = i[k]
    			end
    		else
    			g += 1
    			f[g] = i
    		end
    	end
    
    	return (f :: any) :: Array<T> & Array<S>
    end
    
    return concat
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/every"] = function()
    local a = _G.__DEV__
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = b.Array<T>
    type Object = b.Object
    type callbackFn<T> = (element: T, index: number, array: Array<T>) -> boolean
    type callbackFnWithThisArg<T, U> = (self: U, element: T, index: number, array: Array<T>) -> boolean
    
    
    
    return function<T, U>(c: Array<T>, d: callbackFn<T> | callbackFnWithThisArg<T, U>, e: U?): boolean
    	if a then
    		if typeof(c) ~= "table" then
    			error(string.format("Array.every called on %s", typeof(c)))
    		end
    		if typeof(d) ~= "function" then
    			error("callback is not a function")
    		end
    	end
    
    	local f = #c
    	local g = 1
    
    	while g <= f do
    		local h = c[g]
    		local i
    
    		if h ~= nil then
    			if e ~= nil then
    				i = (d :: callbackFnWithThisArg<T, U>)(e, h, g, c)
    			else
    				i = (d :: callbackFn<T>)(h, g, c)
    			end
    
    			if not i then
    				return false
    			end
    		end
    		g += 1
    	end
    	return true
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/filter"] = function()
    local a = _G.__DEV__
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = b.Array<T>
    type Object = b.Object
    type callbackFn<T> = (element: T, index: number, array: Array<T>) -> boolean
    type callbackFnWithThisArg<T, U> = (thisArg: U, element: T, index: number, array: Array<T>) -> boolean
    
    
    
    return function<T, U>(c: Array<T>, d: callbackFn<T> | callbackFnWithThisArg<T, U>, e: U?): Array<T>
    	if a then
    		if typeof(c) ~= "table" then
    			error(string.format("Array.filter called on %s", typeof(c)))
    		end
    		if typeof(d) ~= "function" then
    			error("callback is not a function")
    		end
    	end
    
    	local f = #c
    	local g = {}
    	local h = 1
    
    	if e == nil then
    		for i = 1, f do
    			local j = c[i]
    			if j ~= nil then
    				if (d :: callbackFn<T>)(j, i, c) then
    					g[h] = j
    					h += 1
    				end
    			end
    		end
    	else
    		for i = 1, f do
    			local j = c[i]
    			if j ~= nil then
    				if (d :: callbackFnWithThisArg<T, U>)(e, j, i, c) then
    					g[h] = j
    					h += 1
    				end
    			end
    		end
    	end
    
    	return g
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/find"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = a.Array<T>
    type PredicateFunction<T> = (value: T, index: number, array: Array<T>) -> boolean
    
    return function<T>(b: Array<T>, c: PredicateFunction<T>): T | nil
    	for d = 1, #b do
    		local e = b[d]
    		if c(e, d, b) then
    			return e
    		end
    	end
    	return nil
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/findIndex"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = a.Array<T>
    type PredicateFunction<T> = (T, number, Array<T>) -> boolean
    
    return function<T>(b: Array<T>, c: PredicateFunction<T>): number
    	for d = 1, #b do
    		local e = b[d]
    		if c(e, d, b) then
    			return d
    		end
    	end
    	return -1
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/flat"] = function()
    local a = _G.__DEV__
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array"))
    local c = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = c.Array<T>
    local function flat<T>(d: Array<T>, e: number?): Array<T>
    	if a then
    		if typeof(d) ~= "table" then
    			error(string.format("Array.flat called on %s", typeof(d)))
    		end
    		if e ~= nil and typeof(e) ~= "number" then
    			error("depth is not a number or nil")
    		end
    	end
    	local f = e or 1
    	local g = {}
    
    	for h, i in d do
    		if b(i) then
    			local j = (i :: any) :: Array<T>
    			local k: Array<T> = if f > 1 then flat(j, f - 1) else j
    			for l, m in k do
    				table.insert(g, m)
    			end
    		else
    			table.insert(g, i)
    		end
    	end
    
    	return g
    end
    
    return flat
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/flatMap"] = function()
    local a = _G.__DEV__
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array"))
    local c = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array"))
    local d = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = d.Array<T>
    type callbackFn<T, U> = (element: T, index: number, array: Array<T>) -> U
    type callbackFnWithThisArg<T, U, V> = (thisArg: V, element: T, index: number, array: Array<T>) -> U
    
    local function flatMap<T, U, V>(
    	e: Array<T>,
    	f: callbackFn<T, U> | callbackFnWithThisArg<T, U, V>,
    	g: V?
    ): Array<U>
    	if a then
    		if typeof(e) ~= "table" then
    			error(string.format("Array.flatMap called on %s", typeof(e)))
    		end
    		if typeof(f) ~= "function" then
    			error("callback is not a function")
    		end
    	end
    	return b(c(e, f, g))
    end
    
    return flatMap
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/forEach"] = function()
    local a = _G.__DEV__
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = b.Array<T>
    type Object = b.Object
    type callbackFn<T> = (element: T, index: number, array: Array<T>) -> ()
    type callbackFnWithThisArg<T, U> = (thisArg: U, element: T, index: number, array: Array<T>) -> ()
    
    
    
    return function<T, U>(c: Array<T>, d: callbackFn<T> | callbackFnWithThisArg<T, U>, e: U?): ()
    	if a then
    		if typeof(c) ~= "table" then
    			error(string.format("Array.forEach called on %s", typeof(c)))
    		end
    		if typeof(d) ~= "function" then
    			error("callback is not a function")
    		end
    	end
    
    	local f = #c
    	local g = 1
    
    	while g <= f do
    		local h = c[g]
    
    		if e ~= nil then
    			(d :: callbackFnWithThisArg<T, U>)(e, h, g, c)
    		else
    			(d :: callbackFn<T>)(h, g, c)
    		end
    
    		if #c < f then
    			
    			f = #c
    		end
    		g += 1
    	end
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/from"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array"))
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array"):WaitForChild('Map'))
    local c = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/from"))
    local d = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"))
    local e = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"))
    
    local f = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/from"))
    local g = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/from"))
    local h = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/from"))
    local i = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/from"))
    
    type Array<T> = e.Array<T>
    type Object = e.Object
    type Set<T> = e.Set<T>
    type Map<K, V> = e.Map<K, V>
    type mapFn<T, U> = (element: T, index: number) -> U
    type mapFnWithThisArg<T, U> = (thisArg: any, element: T, index: number) -> U
    
    return function<T, U>(
    	j: string | Array<T> | Set<T> | Map<any, any>,
    	k: (mapFn<T, U> | mapFnWithThisArg<T, U>)?,
    	l: Object?
    	
    ): Array<U> | Array<T> | Array<string>
    	if j == nil then
    		error("cannot create array from a nil value")
    	end
    	local m = typeof(j)
    
    	local n: Array<U> | Array<T> | Array<string>
    
    	if m == "table" and c(j) then
    		n = i(j :: Array<T>, k, l)
    	elseif d(j, a) then
    		n = g(j :: Set<T>, k, l)
    	elseif d(j, b) then
    		n = h(j :: Map<any, any>, k, l)
    	elseif m == "string" then
    		n = f(j :: string, k, l)
    	else
    		n = {}
    	end
    
    	return n
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/from/fromArray"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Object = a.Object
    
    type Array<T> = a.Array<T>
    type mapFn<T, U> = (element: T, index: number) -> U
    type mapFnWithThisArg<T, U> = (thisArg: any, element: T, index: number) -> U
    
    return function<T, U>(
    	b: Array<T>,
    	c: (mapFn<T, U> | mapFnWithThisArg<T, U>)?,
    	d: Object?
    	
    ): Array<U> | Array<T> | Array<string>
    	local e = {}
    
    	if c then
    		local f = #(b :: Array<T>)
    		e = table.create(f)
    		for g = 1, f do
    			if d ~= nil then
    				(e :: Array<U>)[g] = (c :: mapFnWithThisArg<T, U>)(d, (b :: Array<T>)[g], g)
    			else
    				(e :: Array<U>)[g] = (c :: mapFn<T, U>)((b :: Array<T>)[g], g)
    			end
    		end
    	else
    		e = table.clone(b :: Array<T>)
    	end
    
    	return e
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/from/fromMap"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Object = a.Object
    type Array<T> = a.Array<T>
    type Map<K, V> = a.Map<K, V>
    type mapFn<T, U> = (element: T, index: number) -> U
    type mapFnWithThisArg<T, U> = (thisArg: any, element: T, index: number) -> U
    
    return function<T, U>(
    	b: Map<any, any>,
    	c: (mapFn<T, U> | mapFnWithThisArg<T, U>)?,
    	d: Object?
    	
    ): Array<U> | Array<T> | Array<string>
    	local e = {}
    
    	if c then
    		e = {}
    		for f, g in b :: any do
    			if d ~= nil then
    				(e :: Array<U>)[f] = (c :: mapFnWithThisArg<T, U>)(d, g, f)
    			else
    				(e :: Array<U>)[f] = (c :: mapFn<T, U>)(g, f)
    			end
    		end
    	else
    		e = {}
    		for f, g in b :: any do
    			(e :: Array<T>)[f] = g
    		end
    	end
    
    	return e
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/from/fromSet"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Object = a.Object
    type Array<T> = a.Array<T>
    type Set<T> = a.Set<T>
    type mapFn<T, U> = (element: T, index: number) -> U
    type mapFnWithThisArg<T, U> = (thisArg: any, element: T, index: number) -> U
    
    return function<T, U>(
    	b: Set<T>,
    	c: (mapFn<T, U> | mapFnWithThisArg<T, U>)?,
    	d: Object?
    	
    ): Array<U> | Array<T> | Array<string>
    	local e = {}
    
    	if c then
    		e = {}
    		for f, g in b :: any do
    			if d ~= nil then
    				(e :: Array<U>)[f] = (c :: mapFnWithThisArg<T, U>)(d, g, f)
    			else
    				(e :: Array<U>)[f] = (c :: mapFn<T, U>)(g, f)
    			end
    		end
    	else
    		e = table.clone((b :: any)._array)
    	end
    
    	return e
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/from/fromString"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Object = a.Object
    type Array<T> = a.Array<T>
    
    type mapFn<T, U> = (element: T, index: number) -> U
    type mapFnWithThisArg<T, U> = (thisArg: any, element: T, index: number) -> U
    
    return function<T, U>(
    	b: string,
    	c: (mapFn<T, U> | mapFnWithThisArg<T, U>)?,
    	d: Object?
    	
    ): Array<U> | Array<T> | Array<string>
    	local e = {}
    
    	local f = #b
    	e = table.create(f)
    	if c then
    		for g = 1, f do
    			if d ~= nil then
    				(e :: Array<U>)[g] = (c :: mapFnWithThisArg<T, U>)(d, string.sub(b, g, g) :: any, g)
    			else
    				(e :: Array<U>)[g] = (c :: mapFn<T, U>)(string.sub(b, g, g) :: any, g)
    			end
    		end
    	else
    		for g = 1, f do
    			(e :: Array<string>)[g] = string.sub(b, g, g)
    		end
    	end
    
    	return e
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/includes"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = a.Array<T>
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array"))
    
    return function<T>(c: Array<T>, d: T, e: number?): boolean
    	return b(c, d, e) ~= -1
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/indexOf"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = a.Array<T>
    
    
    
    
    
    
    
    return function<T>(b: Array<T>, c: T, d: number?): number
    	local e = d or 1
    	local f = #b
    
    	
    	
    	
    	if e < 1 then
    		e = math.max(f - math.abs(e), 1)
    	end
    
    	for g = e, f do
    		if b[g] == c then
    			return g
    		end
    	end
    
    	return -1
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/isArray"] = function()
    return function(a: any): boolean
    	if typeof(a) ~= "table" then
    		return false
    	end
    	if next(a) == nil then
    		
    		return true
    	end
    
    	local b = #a
    
    	if b == 0 then
    		return false
    	end
    
    	local c = 0
    	local d = 0
    	for e in pairs(a) do
    		if typeof(e) ~= "number" then
    			return false
    		end
    		if e % 1 ~= 0 or e < 1 then
    			return false
    		end
    		c += 1
    		d += e
    	end
    
    	return d == (c * (c + 1) / 2)
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/join"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = a.Array<T>
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array"))
    
    return function<T>(c: Array<T>, d: string?): string
    	if #c == 0 then
    		return ""
    	end
    	
    	local e = b(c, function(e)
    		return tostring(e)
    	end)
    
    	return table.concat(e, d or ",")
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/map"] = function()
    local a = _G.__DEV__
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = b.Array<T>
    type Object = b.Object
    type callbackFn<T, U> = (element: T, index: number, array: Array<T>) -> U
    type callbackFnWithThisArg<T, U, V> = (thisArg: V, element: T, index: number, array: Array<T>) -> U
    
    
    
    return function<T, U, V>(c: Array<T>, d: callbackFn<T, U> | callbackFnWithThisArg<T, U, V>, e: V?): Array<U>
    	if a then
    		if typeof(c) ~= "table" then
    			error(string.format("Array.map called on %s", typeof(c)))
    		end
    		if typeof(d) ~= "function" then
    			error("callback is not a function")
    		end
    	end
    
    	local f = #c
    	local g = {}
    	local h = 1
    
    	while h <= f do
    		local i = c[h]
    
    		if i ~= nil then
    			local j
    
    			if e ~= nil then
    				j = (d :: callbackFnWithThisArg<T, U, V>)(e, i, h, c)
    			else
    				j = (d :: callbackFn<T, U>)(i, h, c)
    			end
    
    			g[h] = j
    		end
    		h += 1
    	end
    
    	return g
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/reduce"] = function()
    local a = _G.__DEV__
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = b.Array<T>
    type reduceFn<T, U> = (previousValue: U, currentValue: T, currentIndex: number, array: Array<T>) -> U
    
    
    
    
    return function<T, U>(c: Array<T>, d: reduceFn<T, U>, e: U?): U
    	if a then
    		if typeof(c) ~= "table" then
    			error(string.format("Array.reduce called on %s", typeof(c)))
    		end
    		if typeof(d) ~= "function" then
    			error("callback is not a function")
    		end
    	end
    
    	local f = #c
    
    	local g: T | U
    	local h = 1
    
    	if e ~= nil then
    		g = e
    	else
    		h = 2
    		if f == 0 then
    			error("reduce of empty array with no initial value")
    		end
    		g = c[1]
    	end
    
    	for i = h, f do
    		g = d(g :: U, c[i], i, c)
    	end
    
    	return g :: U
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/reverse"] = function()
    
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = a.Array<T>
    
    return function<T>(b: Array<T>): Array<T>
    	local c = #b
    	local d = 1
    	while d < c do
    		b[d], b[c] = b[c], b[d]
    		d = d + 1
    		c = c - 1
    	end
    	return b
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/shift"] = function()
    local a = _G.__DEV__
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array"))
    local c = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = c.Array<T>
    
    return function<T>(d: Array<T>): T?
    	if a then
    		if not b(d) then
    			error(string.format("Array.shift called on non-array %s", typeof(d)))
    		end
    	end
    
    	if #d > 0 then
    		return table.remove(d, 1)
    	else
    		return nil
    	end
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/slice"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = a.Array<T>
    
    
    
    return function<T>(b: Array<T>, c: number?, d: number?): Array<T>
    	if typeof(b) ~= "table" then
    		error(string.format("Array.slice called on %s", typeof(b)))
    	end
    	local e = #b
    
    	local f = c or 1
    	local g
    	if d == nil or d > e + 1 then
    		g = e + 1
    	else
    		g = d
    	end
    
    	if f > e + 1 then
    		return {}
    	end
    
    	local h = {}
    
    	if f < 1 then
    		f = math.max(e - math.abs(f), 1)
    	end
    	if g < 1 then
    		g = math.max(e - math.abs(g), 1)
    	end
    
    	local i = f
    	local j = 1
    	while i < g do
    		h[j] = b[i]
    		i = i + 1
    		j = j + 1
    	end
    
    	return h
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/some"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = a.Array<T>
    type Object = a.Object
    
    
    type callbackFn<T> = (element: T, index: number, array: Array<T>) -> boolean
    type callbackFnWithThisArg<T, U> = (thisArg: U, element: T, index: number, array: Array<T>) -> boolean
    
    
    
    return function<T, U>(b: Array<T>, c: callbackFn<T> | callbackFnWithThisArg<T, U>, d: U?): boolean
    	if typeof(b) ~= "table" then
    		error(string.format("Array.some called on %s", typeof(b)))
    	end
    	if typeof(c) ~= "function" then
    		error("callback is not a function")
    	end
    
    	for e, f in b do
    		if d ~= nil then
    			if f ~= nil and (c :: callbackFnWithThisArg<T, U>)(d, f, e, b) then
    				return true
    			end
    		else
    			if f ~= nil and (c :: callbackFn<T>)(f, e, b) then
    				return true
    			end
    		end
    	end
    	return false
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/sort"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"):WaitForChild('None'))
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = b.Array<T>
    type Comparable = (any, any) -> number
    local c = function<T>(c: T, d: T): boolean
    	return type(c) .. tostring(c) < type(d) .. tostring(d)
    end
    
    return function<T>(d: Array<T>, e: Comparable?): Array<T>
    	
    	local f = c
    	if e ~= nil and e ~= a then
    		if typeof(e :: any) ~= "function" then
    			error("invalid argument to Array.sort: compareFunction must be a function")
    		end
    		f = function<T>(g: T, h: T)
    			local i = e(g, h)
    			if typeof(i) ~= "number" then
    				
    				
    				
    				
    				error(("invalid result from compare function, expected number but got %s"):format(typeof(i)))
    			end
    			return i < 0
    		end
    	end
    	table.sort(d, f)
    	return d
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/splice"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = a.Array<T>
    
    
    
    
    return function<T>(b: Array<T>, c: number, d: number?, ...: T): Array<T>
    	
    	if c > #b then
    		local e = select("#", ...)
    		for f = 1, e do
    			local g = select(f, ...)
    			table.insert(b, g)
    		end
    		return {}
    	else
    		local e = #b
    		
    		
    		
    		if c < 1 then
    			c = math.max(e - math.abs(c), 1)
    		end
    
    		local f = {} :: Array<T>
    		
    		
    		local g: number = d or e
    		if g > 0 then
    			local h = math.min(e, c + math.max(0, g - 1))
    
    			for i = c, h do
    				local j = table.remove(b, c) :: T
    				table.insert(f, j)
    			end
    		end
    
    		local h = select("#", ...)
    		
    		for i = h, 1, -1 do
    			local j = select(i, ...)
    			table.insert(b, c, j)
    		end
    
    		return f
    	end
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array/unshift"] = function()
    local a = _G.__DEV__
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Array"))
    local c = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = c.Array<T>
    
    return function<T>(d: Array<T>, ...: T): number
    	if a then
    		if not b(d) then
    			error(string.format("Array.unshift called on non-array %s", typeof(d)))
    		end
    	end
    
    	local e = select("#", ...)
    	if e > 0 then
    		for f = e, 1, -1 do
    			local g = select(f, ...)
    			table.insert(d, 1, g)
    		end
    	end
    
    	return #d
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Map"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"))
    
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Map"))
    local c = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Map"))
    local d = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Map"))
    
    export type Map<K, V> = a.Map<K, V>
    
    return {
    	Map = b,
    	coerceToMap = c,
    	coerceToTable = d,
    }
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Map/Map"] = function()
    local a = _G.__DEV__
    
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"):WaitForChild('forEach'))
    local c = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"):WaitForChild('map'))
    local d = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"):WaitForChild('isArray'))
    local e = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    local f = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
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
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Map/coerceToMap"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Map"))
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"))
    local c = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    local d = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    
    type Map<K, V> = d.Map<K, V>
    type Table<K, V> = d.Table<K, V>
    
    local function coerceToMap(e: Map<any, any> | Table<any, any>): Map<any, any>
    	return c(e, a) and e :: Map<any, any> 
    		or a.new(b.entries(e)) 
    end
    
    return coerceToMap
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Map/coerceToTable"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Map"))
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    local c = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"):WaitForChild('reduce'))
    local d = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    
    type Map<K, V> = d.Map<K, V>
    type Table<K, V> = d.Table<K, V>
    
    local function coerceToTable(e: Map<any, any> | Table<any, any>): Table<any, any>
    	if not b(e, a) then
    		return e :: Table<any, any>
    	end
    
    	
    	return c(e:entries(), function(f, g)
    		f[g[1] ] = g[2]
    		return f
    	end, {})
    end
    
    return coerceToTable
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object"] = function()
    return {
    	assign = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object")),
    	entries = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object")),
    	freeze = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object")),
    	is = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object")),
    	isFrozen = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object")),
    	keys = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object")),
    	preventExtensions = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object")),
    	seal = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object")),
    	values = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object")),
    	
    	
    	None = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object")),
    }
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object/None"] = function()
    
    
    
    local a = newproxy(true)
    local b = getmetatable(a)
    b.__tostring = function()
    	return "Object.None"
    end
    
    return a
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object/assign"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object"))
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Object = b.Object
    
    
    
    
    
    
    
    
    return function<T, U, V, W>(c: T, d: U?, e: V?, f: W?, ...): T & U & V & W
    	if d ~= nil and typeof(d :: any) == "table" then
    		for g, h in pairs(d :: any) do
    			if h == a then
    				(c :: any)[g] = nil
    			else
    				(c :: any)[g] = h
    			end
    		end
    	end
    
    	if e ~= nil and typeof(e :: any) == "table" then
    		for g, h in pairs(e :: any) do
    			if h == a then
    				(c :: any)[g] = nil
    			else
    				(c :: any)[g] = h
    			end
    		end
    	end
    
    	if f ~= nil and typeof(f :: any) == "table" then
    		for g, h in pairs(f :: any) do
    			if h == a then
    				(c :: any)[g] = nil
    			else
    				(c :: any)[g] = h
    			end
    		end
    	end
    
    	for g = 1, select("#", ...) do
    		local h = select(g, ...)
    
    		if h ~= nil and typeof(h) == "table" then
    			for i, j in pairs(h) do
    				if j == a then
    					(c :: any)[i] = nil
    				else
    					(c :: any)[i] = j
    				end
    			end
    		end
    	end
    
    	
    	return (c :: any) :: T & U & V & W
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object/entries"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = a.Array<T>
    type Map<K, V> = a.Map<K, V>
    type Tuple<T, V> = a.Tuple<T, V>
    
    return function<T>(b: string | { [string]: T } | Array<T> | Map<any, T>): Array<Tuple<string, T>>
    	assert(b :: any ~= nil, "cannot get entries from a nil value")
    	local c = typeof(b)
    
    	local d: Array<Tuple<string, T>> = {}
    	if c == "table" then
    		for e, f in pairs(b :: { [string]: T } | Array<T>) do
    			
    			table.insert(d, { e, f })
    		end
    	elseif c == "string" then
    		
    		for e = 1, string.len(b :: string) do
    			d[e] = { tostring(e), string.sub(b :: string, e, e) }
    		end
    	end
    
    	return d
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object/freeze"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = a.Array<T>
    type Object = a.Object
    
    return function<T>(b: T & (Object | Array<any>)): T
    	
    	return (table.freeze(b :: any) :: any) :: T
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object/is"] = function()
    
    
    return function(a: any, b: any): boolean
    	if a == b then
    		return a ~= 0 or 1 / a == 1 / b
    	else
    		return a ~= a and b ~= b
    	end
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object/isFrozen"] = function()
    local a = _G.__DEV__
    
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = b.Array<T>
    type Object = b.Object
    
    return function(c: Object | Array<any>): boolean
    	if a then
    		print("Luau now has a direct table.isfrozen call that can save the overhead of this library function call")
    	end
    	return table.isfrozen(c)
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object/keys"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"))
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    local c = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = b.Array<T>
    type Set<T> = b.Set<T>
    type Table = { [any]: any }
    
    return function(d: Set<any> | Table | string): Array<string>
    	if d == nil then
    		error("cannot extract keys from a nil value")
    	end
    
    	local e = typeof(d)
    
    	local f
    	if e == "table" then
    		f = {}
    		if c(d, a) then
    			return f
    		end
    
    		for g in pairs(d :: Table) do
    			table.insert(f, g)
    		end
    	elseif e == "string" then
    		local g = (d :: string):len()
    		f = table.create(g)
    		for h = 1, g do
    			f[h] = tostring(h)
    		end
    	end
    
    	return f
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object/preventExtensions"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = a.Array<T>
    type Object = a.Object
    
    
    
    
    local function preventExtensions<T>(b: T & (Object | Array<any>)): T
    	local c = tostring(b)
    
    	return (
    		setmetatable(b :: any, {
    			__newindex = function(d, e, f)
    				local g = ("%q (%s) is not a valid member of %s"):format(tostring(e), typeof(e), c)
    
    				error(g, 2)
    			end,
    			__metatable = false,
    		}) :: any
    	) :: T
    end
    
    return preventExtensions
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object/seal"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = a.Array<T>
    type Object = a.Object
    
    return function<T>(b: T & (Object | Array<any>)): T
    	
    	return (table.freeze(b :: any) :: any) :: T
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Object/values"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    type Array<T> = a.Array<T>
    
    
    return function<T>(b: { [string]: T } | Array<T> | string): Array<T> | Array<string>
    	if b == nil then
    		error("cannot extract values from a nil value")
    	end
    	local c = typeof(b)
    
    	local d: Array<T> | Array<string>
    	if c == "table" then
    		d = {} :: Array<T>
    		for e, f in pairs(b :: { [string]: T } | Array<T>) do
    			table.insert(d, f)
    		end
    	elseif c == "string" then
    		
    		local e = (b :: string):len()
    		d = table.create(e)
    		for f = 1, e do
    			(d :: Array<string>)[f] = (b :: string):sub(f, f)
    		end
    	end
    
    	return d
    end
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Set"] = function()
    
    local a = _G.__DEV__
    
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Set"))
    local c = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Set"):WaitForChild('isArray'))
    local d = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Set"):WaitForChild('forEach'))
    local e = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src/Set"):WaitForChild('from'):WaitForChild('fromString'))
    
    local f = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"))
    
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
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/WeakMap"] = function()
    local a = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    
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
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/collections/src/inspect"] = function()
    
    
    local a = game:GetService("HttpService")
    
    local b = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections/src"):WaitForChild('isArray'))
    local c = _require("Packages/_Index/jsdotlua_collections@1.2.7/collections"))
    
    type Array<T> = c.Array<T>
    
    
    
    
    export type InspectOptions = {
    	depth: number?
    }
    
    type FormatOptions = {
    	depth: number
    }
    
    local d = 10
    local e = 2
    
    
    local f
    local g
    local h
    local i
    local j
    
    
    
    
    local function inspect(k, l: InspectOptions?): string
    	local m: InspectOptions = l or { depth = e }
    	local n = m.depth or e
    	m.depth = if n >= 0 then n else e
    	return f(k, {}, m :: FormatOptions)
    end
    
    local function isIndexKey(k, l)
    	return type(k) == "number"
    		and k <= l 
    		and 1 <= k 
    		and math.floor(k) == k 
    end
    
    local function getTableLength(k)
    	local l = 1
    	local m = rawget(k, l)
    	while m ~= nil do
    		l += 1
    		m = rawget(k, l)
    	end
    	return l - 1
    end
    
    local function sortKeysForPrinting(k: any, l)
    	local m = type(k)
    	local n = type(l)
    
    	
    	if m == n and (m == "number" or m == "string") then
    		return k < l
    	end
    
    	
    	return m < n
    end
    
    local function rawpairs(k)
    	return next, k, nil
    end
    
    local function getFragmentedKeys(k)
    	local l = {}
    	local m = 0
    	local n = getTableLength(k)
    	for o, p in rawpairs(k) do
    		if not isIndexKey(o, n) then
    			m = m + 1
    			l[m] = o
    		end
    	end
    	table.sort(l, sortKeysForPrinting)
    	return l, m, n
    end
    
    function f(k, l, m: FormatOptions)
    	local n = typeof(k)
    	if n == "string" then
    		return a:JSONEncode(k)
    		
    	elseif n == "number" then
    		if k ~= k then
    			return "NaN"
    		elseif k == math.huge then
    			return "Infinity"
    		elseif k == -math.huge then
    			return "-Infinity"
    		else
    			return tostring(k)
    		end
    	elseif n == "function" then
    		local o = "[function"
    		local p = debug.info(k :: (any) -> any, "n")
    		if p ~= nil and p ~= "" then
    			o ..= " " .. p
    		end
    		return o .. "]"
    	elseif n == "table" then
    		
    		
    		
    		
    		return g(k, l, m)
    	else
    		return tostring(k)
    	end
    end
    
    function g(k, l, m: FormatOptions)
    	if table.find(l, k) ~= nil then
    		return "[Circular]"
    	end
    
    	local n = { unpack(l) }
    	table.insert(n, k)
    
    	if typeof(k.toJSON) == "function" then
    		local o = k:toJSON(k)
    
    		if o ~= k then
    			if typeof(o) == "string" then
    				return o
    			else
    				return f(o, n, m)
    			end
    		end
    	elseif b(k) then
    		return h(k, n, m)
    	end
    
    	return i(k, n, m)
    end
    
    function i(k, l, m: FormatOptions)
    	local n = ""
    	local o = getmetatable(k)
    	if o and rawget(o, "__tostring") then
    		return tostring(k)
    	end
    
    	local p, q, r = getFragmentedKeys(k)
    
    	if r == 0 and q == 0 then
    		n ..= "{}"
    		return n
    	end
    	if #l > m.depth then
    		n ..= "[" .. j(k) .. "]"
    		return n
    	end
    
    	local s = {}
    	for t = 1, r do
    		local u = f(k[t], l, m)
    
    		table.insert(s, u)
    	end
    
    	for t = 1, q do
    		local u = p[t]
    		local v = f(k[u], l, m)
    
    		table.insert(s, u .. ": " .. v)
    	end
    
    	n ..= "{ " .. table.concat(s, ", ") .. " }"
    	return n
    end
    
    function h(k: Array<any>, l: Array<any>, m: FormatOptions): string
    	local n = #k
    	if n == 0 then
    		return "[]"
    	end
    	if #l > m.depth then
    		return "[Array]"
    	end
    
    	local o = math.min(d, n)
    	local p = n - o
    	local q = {}
    
    	for r = 1, o do
    		q[r] = (f(k[r], l, m))
    	end
    
    	if p == 1 then
    		table.insert(q, "... 1 more item")
    	elseif p > 1 then
    		table.insert(q, ("... %s more items"):format(tostring(p)))
    	end
    
    	return "[" .. table.concat(q, ", ") .. "]"
    end
    
    function j(k): string
    	
    	
    	
    	
    
    	
    	
    
    	
    	
    	
    	
    
    	
    	return "Object"
    end
    
    return inspect
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/es7-types"] = function()
    return _require("Packages/_Index/jsdotlua_es7-types@1.2.7/es7-types")
end

_modules["Packages/_Index/jsdotlua_collections@1.2.7/instance-of"] = function()
    return _require("Packages/_Index/jsdotlua_instance-of@1.2.7/instance-of")
end

_modules["Packages/_Index/jsdotlua_console@1.2.7/collections"] = function()
    return _require("Packages/_Index/jsdotlua_collections@1.2.7/collections")
end

_modules["Packages/_Index/jsdotlua_console@1.2.7/console/src"] = function()
    local a = _require("Packages/_Index/jsdotlua_console@1.2.7/console/src"))
    
    return a()
end

_modules["Packages/_Index/jsdotlua_console@1.2.7/console/src/makeConsoleImpl"] = function()
    local a = _require("Packages/_Index/jsdotlua_console@1.2.7/console")).inspect
    
    local b = "  "
    
    return function()
    	local c = {}
    	local d = 0
    
    	local function indent()
    		return string.rep(b, d)
    	end
    
    	function c.log(e, ...)
    		local f
    		if typeof(e) == "string" then
    			f = string.format(e, ...)
    		else
    			f = a(e)
    		end
    		print(indent() .. f)
    	end
    
    	function c.debug(e, ...)
    		local f
    		if typeof(e) == "string" then
    			f = string.format(e, ...)
    		else
    			f = a(e)
    		end
    		print(indent() .. f)
    	end
    
    	function c.info(e, ...)
    		local f
    		if typeof(e) == "string" then
    			f = string.format(e, ...)
    		else
    			f = a(e)
    		end
    		print(indent() .. f)
    	end
    
    	function c.warn(e, ...)
    		local f
    		if typeof(e) == "string" then
    			f = string.format(e, ...)
    		else
    			f = a(e)
    		end
    		warn(indent() .. f)
    	end
    
    	function c.error(e, ...)
    		
    		
    		local f
    		if typeof(e) == "string" then
    			f = string.format(e, ...)
    		else
    			f = a(e)
    		end
    		warn(indent() .. f)
    	end
    
    	function c.group(e, ...)
    		local f
    		if typeof(e) == "string" then
    			f = string.format(e, ...)
    		else
    			f = a(e)
    		end
    		print(indent() .. f)
    		d = d + 1
    	end
    
    	function c.groupCollapsed(e, ...)
    		
    		local f
    		if typeof(e) == "string" then
    			f = string.format(e, ...)
    		else
    			f = a(e)
    		end
    		print(indent() .. f)
    		d = d + 1
    	end
    
    	function c.groupEnd()
    		if d > 0 then
    			d = d - 1
    		end
    	end
    
    	return c
    end
end

_modules["Packages/_Index/jsdotlua_es7-types@1.2.7/es7-types/src"] = function()
    export type Object = { [string]: any }
    export type Array<T> = { [number]: T }
    export type Function = (...any) -> ...any
    export type Table<T, V> = { [T]: V }
    export type Tuple<T, V> = Array<T | V>
    export type mapCallbackFn<K, V> = (element: V, key: K, map: Map<K, V>) -> ()
    export type mapCallbackFnWithThisArg<K, V> = (thisArg: Object, value: V, key: K, map: Map<K, V>) -> ()
    
    export type Map<K, V> = typeof(setmetatable(
    	{} :: {
    		size: number,
    		
    		set: (self: Map<K, V>, K, V) -> Map<K, V>,
    		get: (self: Map<K, V>, K) -> V | nil,
    		clear: (self: Map<K, V>) -> (),
    		delete: (self: Map<K, V>, K) -> boolean,
    		forEach: (
    			self: Map<K, V>,
    			callback: mapCallbackFn<K, V> | mapCallbackFnWithThisArg<K, V>,
    			thisArg: Object?
    		) -> (),
    		[K]: V,
    		has: (self: Map<K, V>, K) -> boolean,
    		keys: (self: Map<K, V>) -> Array<K>,
    		values: (self: Map<K, V>) -> Array<V>,
    		entries: (self: Map<K, V>) -> Array<Tuple<K, V>>,
    		ipairs: (self: Map<K, V>) -> any,
    		_map: { [K]: V },
    		_array: { [number]: K },
    		__index: (self: Map<K, V>, key: K) -> V,
    		__iter: (self: Map<K, V>) -> (<K, V>({ [K]: V }, K?) -> (K?, V), V),
    		__newindex: (self: Map<K, V>, key: K, value: V) -> ()	
    },
    	{} :: {
    		__index: Map<K, V>,
    		__iter: (self: Map<K, V>) -> (<K, V>({ [K]: V }, K?) -> (K, V), V),
    		__newindex: (self: Map<K, V>, key: K, value: V) -> ()	
    }
    ))
    
    export type WeakMap<K, V> = {
    	
    	get: (self: WeakMap<K, V>, K) -> V,
    	set: (self: WeakMap<K, V>, K, V) -> WeakMap<K, V>,
    	has: (self: WeakMap<K, V>, K) -> boolean
    }
    
    export type setCallbackFn<T> = (value: T, key: T, set: Set<T>) -> ()
    export type setCallbackFnWithThisArg<T> = (thisArg: Object, value: T, key: T, set: Set<T>) -> ()
    
    export type Set<T> = typeof(setmetatable(
    	{} :: {
    		size: number,
    		
    		add: (self: Set<T>, T) -> Set<T>,
    		clear: (self: Set<T>) -> (),
    		delete: (self: Set<T>, T) -> boolean,
    		forEach: (self: Set<T>, callback: setCallbackFn<T> | setCallbackFnWithThisArg<T>, thisArg: Object?) -> (),
    		has: (self: Set<T>, T) -> boolean,
    		ipairs: (self: Set<T>) -> any	
    },
    	{} :: {
    		__index: Set<T>,
    		__iter: (self: Set<T>) -> (<K, V>({ [K]: V }, K?) -> (K, V), T)	
    }
    ))
    return {}
end

_modules["Packages/_Index/jsdotlua_instance-of@1.2.7/instance-of/src"] = function()
    local a = _require("Packages/_Index/jsdotlua_instance-of@1.2.7/instance-of/src"))
    
    return a
end

_modules["Packages/_Index/jsdotlua_instance-of@1.2.7/instance-of/src/instanceof"] = function()
    
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
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/boolean"] = function()
    return _require("Packages/_Index/jsdotlua_boolean@1.2.7/boolean")
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/collections"] = function()
    return _require("Packages/_Index/jsdotlua_collections@1.2.7/collections")
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/console"] = function()
    return _require("Packages/_Index/jsdotlua_console@1.2.7/console")
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/es7-types"] = function()
    return _require("Packages/_Index/jsdotlua_es7-types@1.2.7/es7-types")
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/instance-of"] = function()
    return _require("Packages/_Index/jsdotlua_instance-of@1.2.7/instance-of")
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"] = function()
    local a = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    local b = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    local c = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    local d = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    local e = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    local f = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    local g = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    local h = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    local i = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    
    local j = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    local k = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    local l = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    local m = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    local n = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    
    export type Array<T> = i.Array<T>
    export type AssertionError = j.AssertionError
    export type Error = k.Error
    export type Map<T, V> = i.Map<T, V>
    export type Object = i.Object
    
    export type PromiseLike<T> = l.PromiseLike<T>
    export type Promise<T> = l.Promise<T>
    
    export type Set<T> = i.Set<T>
    export type Symbol = g.Symbol
    export type Timeout = h.Timeout
    export type Interval = h.Interval
    export type WeakMap<T, V> = b.WeakMap<T, V>
    
    return {
    	Array = b.Array,
    	AssertionError = j,
    	Boolean = a,
    	console = c,
    	Error = k,
    	extends = m,
    	instanceof = n,
    	Math = d,
    	Number = e,
    	Object = b.Object,
    	Map = b.Map,
    	coerceToMap = b.coerceToMap,
    	coerceToTable = b.coerceToTable,
    	Set = b.Set,
    	WeakMap = b.WeakMap,
    	String = f,
    	Symbol = g,
    	setTimeout = h.setTimeout,
    	clearTimeout = h.clearTimeout,
    	setInterval = h.setInterval,
    	clearInterval = h.clearInterval,
    	util = {
    		inspect = b.inspect,
    	},
    }
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src/AssertionError"] = function()
    local a = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src/AssertionError/global"))
    
    export type AssertionError = a.AssertionError
    
    return a.AssertionError
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src/AssertionError/AssertionError.global"] = function()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    local a = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill"))
    local b = a.Array
    local c = a.Object
    local d = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill"))
    local e = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill"))
    local f = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill"))
    local g = a.inspect
    
    local h = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    local i = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill"))
    
    type Error = h.Error
    type Array<T> = f.Array<T>
    type Object = f.Object
    type Function = f.Function
    
    
    local j = {
    	stderr = {
    		isTTY = false,
    		columns = 0,
    		hasColors = function(...)
    			return true
    		end,
    	},
    }
    
    
    function ErrorCaptureStackTrace(k, ...)
    	h.captureStackTrace(k, ...)
    end
    
    
    local function removeColors(k)
    	return k
    end
    
    
    
    
    
    
    local k = ""
    local l = ""
    local m = ""
    local n = ""
    local o = {
    	deepStrictEqual = "Expected values to be strictly deep-equal:",
    	strictEqual = "Expected values to be strictly equal:",
    	strictEqualObject = 'Expected "actual" to be reference-equal to "expected":',
    	deepEqual = "Expected values to be loosely deep-equal:",
    	notDeepStrictEqual = 'Expected "actual" not to be strictly deep-equal to:',
    	notStrictEqual = 'Expected "actual" to be strictly unequal to:',
    	notStrictEqualObject = 'Expected "actual" not to be reference-equal to "expected":',
    	notDeepEqual = 'Expected "actual" not to be loosely deep-equal to:',
    	notIdentical = "Values have same structure but are not reference-equal:",
    	notDeepEqualUnequal = "Expected values not to be loosely deep-equal:",
    }
    
    
    local p = 12
    local function copyError(q: Object)
    	local r = c.keys(q)
    	
    	local s = {} 
    	for t, u in r do
    		s[u] = q[u]
    	end
    	s.message = q.message
    	return s
    end
    
    local function inspectValue(q)
    	
    	
    	return g(q, {
    		compact = false,
    		customInspect = false,
    		depth = 1000,
    		maxArrayLength = math.huge, 
    		showHidden = false, 
    		showProxy = false,
    		sorted = true, 
    		getters = true,
    	})
    end
    
    local function createErrDiff(q, r, s)
    	local t = ""
    	local u = ""
    	local v = ""
    	local w = false
    	local x = inspectValue(q)
    	local y = e.split(x, "\n")
    	local z = e.split(inspectValue(r), "\n")
    
    	local A = 0
    	local B = ""
    
    	
    	
    	if
    		s == "strictEqual"
    		and (
    			typeof(q) == "table" and q ~= nil and typeof(r) == "table" and r ~= nil
    			or typeof(q) == "function" and typeof(r) == "function"
    		)
    	then
    		s = "strictEqualObject"
    	end
    
    	
    	
    	if #y == 1 and #z == 1 and y[1] ~= z[1] then
    		
    		
    		
    		local C = false
    		
    		
    		local D = if C then removeColors(y[1]) else y[1]
    		local E = if d.toJSBoolean(C) then removeColors(z[1]) else z[1]
    		local F = string.len(D) + string.len(E)
    		
    		
    		
    		if F <= p then
    			if
    				(typeof(q) ~= "table" or q == nil)
    				and (typeof(r) ~= "table" or r == nil)
    				and (q ~= 0 or r ~= 0)
    			then
    				
    				return ("%s\n\n"):format(o[s])
    					.. ("%s !== %s\n"):format(y[1], z[1])
    			end
    		elseif s ~= "strictEqualObject" then
    			
    			
    			
    			local G = if j.stderr.isTTY then j.stderr.columns else 80
    			if F < G then
    				while string.sub(D, A + 1, A + 1) == string.sub(E, A + 1, A + 1) do
    					A += 1
    				end
    				
    				if A > 2 then
    					
    					
    					B = ("\n  %s^"):format(string.rep(" ", A))
    					A = 0
    				end
    			end
    		end
    	end
    
    	
    	
    	local C = y[#y]
    	local D = z[#z]
    	while C == D do
    		local E = A
    		A += 1
    		if E < 3 then
    			v = ("\n  %s%s"):format(C, v)
    		else
    			t = C
    		end
    		table.remove(y)
    		table.remove(z)
    		if #y == 0 or #z == 0 then
    			break
    		end
    		C = y[#y]
    		D = z[#z]
    	end
    
    	local E = math.max(#y, #z)
    	
    	
    	if E == 0 then
    		
    		local F = e.split(x, "\n")
    
    		
    		
    		if #F > 50 then
    			F[47] = ("%s...%s"):format(k, n)
    			while #F > 47 do
    				table.remove(F)
    			end
    		end
    
    		return ("%s\n\n"):format(o.notIdentical) .. ("%s\n"):format(b.join(F, "\n"))
    	end
    
    	
    	
    	if A >= 5 then
    		v = ("\n%s...%s%s"):format(k, n, v)
    		w = true
    	end
    	if t ~= "" then
    		v = ("\n  %s%s"):format(t, v)
    		t = ""
    	end
    
    	local F = 0
    	local G = 0
    	local H = o[s] .. ("\n%s+ actual%s %s- expected%s"):format(l, n, m, n)
    	local I = (" %s...%s Lines skipped"):format(k, n)
    
    	local J = y
    	local K = ("%s+%s"):format(l, n)
    	local L = #z
    	if #y < E then
    		J = z
    		K = ("%s-%s"):format(m, n)
    		L = #y
    	end
    
    	for M = 1, E do
    		A = M
    		if L < M then
    			
    			
    			if G > 2 then
    				if G > 3 then
    					if G > 4 then
    						if G == 5 then
    							u ..= ("\n  %s"):format(J[(M - 3)])
    							F += 1
    						else
    							u ..= ("\n%s...%s"):format(k, n)
    							w = true
    						end
    					end
    					u ..= ("\n  %s"):format(J[(M - 2)])
    					F += 1
    				end
    				u ..= ("\n  %s"):format(J[(M - 1)])
    				F += 1
    			end
    			
    			G = 0
    			
    			if J == y then
    				u ..= ("\n%s %s"):format(K, J[M])
    			else
    				t ..= ("\n%s %s"):format(K, J[M])
    			end
    			F += 1
    			
    			
    		else
    			local N = z[M]
    			local O = y[M]
    			
    			
    			
    			local P = O ~= N
    				and (
    					not d.toJSBoolean(e.endsWith(O, ","))
    					or e.slice(O, 0, -1) ~= N
    				)
    			
    			
    			
    			
    			
    			
    			
    			
    			
    			if
    				P
    				and e.endsWith(N, ",")
    				and e.slice(N, 0, -1) == O
    			then
    				P = false
    				O ..= ","
    			end
    			if P then
    				
    				
    				if G > 2 then
    					if G > 3 then
    						if G > 4 then
    							if G == 5 then
    								u ..= ("\n  %s"):format(y[M - 3])
    								F += 1
    							else
    								u ..= ("\n%s...%s"):format(k, n)
    								w = true
    							end
    						end
    						u ..= ("\n  %s"):format(y[M - 2])
    						F += 1
    					end
    					u ..= ("\n  %s"):format(y[M - 1])
    					F += 1
    				end
    				
    				G = 0
    				
    				
    				u ..= ("\n%s+%s %s"):format(l, n, O)
    				t ..= ("\n%s-%s %s"):format(m, n, N)
    				F += 2
    				
    			else
    				
    				
    				u ..= t
    				t = ""
    				G += 1
    				
    				
    				if G <= 2 then
    					u ..= ("\n  %s"):format(O)
    					F += 1
    				end
    			end
    		end
    		
    		if F > 50 and M < E - 2 then
    			return ("%s%s\n%s\n%s...%s%s\n"):format(H, I, u, k, n, t)
    				.. ("%s...%s"):format(k, n)
    		end
    	end
    
    	return ("%s%s\n%s%s%s%s"):format(H, if w then I else "", u, t, v, B)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    export type AssertionError = Error & {
    	actual: any,
    	expected: any,
    	operator: string?,
    	generatedMessage: boolean,
    	code: "ERR_ASSERTION",
    	toString: (self: AssertionError) -> any	
    	
    
    }
    
    type AssertionErrorStatics = {
    	new: (options: AssertionErrorOptions) -> AssertionError,
    	__index: AssertionError,
    	__tostring: (self: AssertionError) -> string
    }
    
    local q: AssertionError & AssertionErrorStatics = (
    	setmetatable({}, { __index = h }) :: any
    ) :: AssertionError & AssertionErrorStatics
    q.__index = q
    q.__tostring = function(r: AssertionError)
    	return r:toString()
    end
    
    type AssertionErrorOptions = {
    	message: string?,
    	actual: any?,
    	expected: any?,
    	
    	operator: string?,
    	stackStartFn: Function?
    }
    
    function q.new(r: AssertionErrorOptions): AssertionError
    	local s: AssertionError
    	
    	
    	local t, u, v =
    		r.message,
    		r.operator,
    		r.stackStartFn
    	local w, x = r.actual, r.expected
    	
    	
    	
    	
    	
    	
    	if t ~= nil then
    		s = (setmetatable(h.new(tostring(t)), q) :: any) :: AssertionError
    	else
    		if j.stderr.isTTY then
    			
    			
    			if j.stderr:hasColors() then
    				k = "\u{001b}[34m"
    				l = "\u{001b}[32m"
    				n = "\u{001b}[39m"
    				m = "\u{001b}[31m"
    			else
    				k = ""
    				l = ""
    				n = ""
    				m = ""
    			end
    		end
    		
    		
    		
    		if
    			typeof(w) == "table"
    			and w ~= nil
    			and typeof(x) == "table"
    			and x ~= nil
    			and b.indexOf(c.keys(w), "stack") ~= -1
    and i(w, h)
    			and b.indexOf(c.keys(x), "stack") ~= -1
    and i(x, h)
    		then
    			w = copyError(w)
    			x = copyError(x)
    		end
    		if u == "deepStrictEqual" or u == "strictEqual" then
    			s = (
    				setmetatable(h.new(createErrDiff(w, x, u)), q) :: any
    			) :: AssertionError
    		elseif u == "notDeepStrictEqual" or u == "notStrictEqual" then
    			
    			
    			local y = o[u]
    			local z = e.split(inspectValue(w), "\n")
    
    			
    			
    			if
    				u == "notStrictEqual"
    				and (typeof(w) == "table" and w ~= nil or typeof(w) == "function")
    			then
    				y = o.notStrictEqualObject
    			end
    
    			
    			
    			if #z > 50 then
    				z[47] = ("%s...%s"):format(k, n)
    				while #z > 47 do
    					table.remove(z)
    				end
    			end
    
    			
    			if #z == 1 then
    				s = (
    					setmetatable(
    						h.new(("%s%s%s"):format(y, if string.len(z[1]) > 5 then "\n\n" else " ", z[1])),
    						q
    					) :: any
    				) :: AssertionError
    			else
    				s = (
    					setmetatable(h.new(("%s\n\n%s\n"):format(y, b.join(z, "\n"))), q) :: any
    				) :: AssertionError
    			end
    		else
    			local y = inspectValue(w)
    			local z = inspectValue(x)
    			local A = o[tostring(u)]
    			if u == "notDeepEqual" and y == z then
    				y = ("%s\n\n%s"):format(A, y)
    				if string.len(y) > 1024 then
    					y = ("%s..."):format(e.slice(y, 0, 1021))
    				end
    				s = (setmetatable(h.new(y), q) :: any) :: AssertionError
    			else
    				if string.len(y) > 512 then
    					y = ("%s..."):format(e.slice(y, 0, 509))
    				end
    				if string.len(z) > 512 then
    					z = ("%s..."):format(e.slice(z, 0, 509))
    				end
    				if u == "deepEqual" then
    					y = ("%s\n\n%s\n\nshould loosely deep-equal\n\n"):format(A, y)
    				else
    					local B = o[("%sUnequal"):format(tostring(u))]
    					if d.toJSBoolean(B) then
    						y = ("%s\n\n%s\n\nshould not loosely deep-equal\n\n"):format(B, y)
    					else
    						z = (" %s %s"):format(tostring(u), z)
    					end
    				end
    				s = (setmetatable(h.new(("%s%s"):format(y, z)), q) :: any) :: AssertionError
    			end
    		end
    	end
    	
    	
    	
    	
    	
    	s.generatedMessage = not d.toJSBoolean(t)
    	
    	
    
    
    
    
    
    
    
    
    s.name = "AssertionError [ERR_ASSERTION]"
    	s.code = "ERR_ASSERTION"
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	s.actual = w
    	s.expected = x
    	s.operator = u
    	
    	
    	ErrorCaptureStackTrace(s, v or q.new)
    	
    	
    	
    	
    
    
    
    s.name = "AssertionError"
    	return (s :: any) :: AssertionError
    end
    
    function q:toString()
    	return ("%s [%s]: %s"):format(self.name, self.code, self.message)
    end
    
    q.name = "AssertionError"
    
    return { AssertionError = q }
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src/Error"] = function()
    local a = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src/Error/global"))
    export type Error = a.Error
    return a
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src/Error/Error.global"] = function()
    local a = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill"))
    
    type Function = a.Function
    
    export type Error = { name: string, message: string, stack: string? }
    type Error_private = Error & { __stack: string? }
    
    local b = {}
    
    local c = "Error"
    b.__index = b
    b.__tostring = function(d)
    	
    	return getmetatable(b :: any).__tostring(d)
    end
    
    
    local function __createError(d: string?): Error
    	local e = (setmetatable({
    		name = c,
    		message = d or "",
    	}, b) :: any) :: Error
    	b.__captureStackTrace(e, 4)
    	return e
    end
    
    function b.new(d: string?): Error
    	return __createError(d)
    end
    
    function b.captureStackTrace(d: Error, e: Function?)
    	b.__captureStackTrace(d, 3, e)
    end
    
    function b.__captureStackTrace(d: Error, e: number, f: Function?)
    	local g = d :: Error_private
    	if typeof(f) == "function" then
    		local h = debug.traceback(nil, e)
    		local i: string = debug.info(f, "n")
    		local j: string = debug.info(f, "s")
    
    		local k = string.gsub(j, "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1")
    		local l = k .. ":%d* function " .. i
    		local m = string.find(h, l)
    		local n 		
    if m ~= nil then
    			m, n = string.find(h, "\n", m + 1)
    		end
    		if n ~= nil then
    			h = string.sub(h, n + 1)
    		end
    		g.__stack = h
    	else
    		g.__stack = debug.traceback(nil, e)
    	end
    	b.__recalculateStacktrace(g)
    end
    
    function b.__recalculateStacktrace(d: Error)
    	local e = d :: Error_private
    	local f = e.message
    	local g = e.name or c
    
    	local h = g .. (if f ~= nil and f ~= "" then (": " .. f) else "")
    	local i = if e.__stack then e.__stack else ""
    
    	e.stack = h .. "\n" .. i
    end
    
    return setmetatable(b, {
    	__call = function(d, ...)
    		return __createError(...)
    	end,
    	__tostring = function(d)
    		if d.name ~= nil then
    			if d.message and d.message ~= "" then
    				return string.format("%s: %s", tostring(d.name), tostring(d.message))
    			end
    			return tostring(d.name)
    		end
    		return tostring(c)
    	end,
    })
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src/Promise"] = function()
    
    export type PromiseLike<T> = {
    	andThen: (
    		self: PromiseLike<T>,
    		resolve: ((T) -> ...(nil | T | PromiseLike<T>))?,
    		reject: ((any) -> ...(nil | T | PromiseLike<T>))?
    	) -> PromiseLike<T>
    }
    
    type PromiseStatus = "Started" | "Resolved" | "Rejected" | "Cancelled"
    
    export type Promise<T> = {
    	andThen: (
    		self: Promise<T>,
    		resolve: ((T) -> ...(nil | T | PromiseLike<T>))?,
    		reject: ((any) -> ...(nil | T | PromiseLike<T>))?
    	) -> Promise<T>,
    
    	catch: (Promise<T>, ((any) -> ...(nil | T | PromiseLike<nil>))) -> Promise<T>,
    
    	onCancel: (Promise<T>, (() -> ())?) -> boolean,
    
    	expect: (Promise<T>) -> ...T,
    
    	
    	await: (Promise<T>) -> (boolean, ...(T | any)),
    
    	getStatus: (self: Promise<T>) -> PromiseStatus,
    	
    	awaitStatus: (self: Promise<T>) -> (PromiseStatus, ...(T | any))
    }
    
    return {}
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src/encodeURIComponent"] = function()
    
    local a = game:GetService("HttpService")
    
    local b = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill"))
    local c = b.charCodeAt
    local d = _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src"))
    
    local function encodeURIComponent(e: string): string
    	local f = utf8.len(e)
    	if f == 0 or f == nil then
    		return ""
    	end
    	
    	local g = c(e, 1)
    	if f == 1 then
    		if g == 0xD800 then
    			error(d.new("URI malformed"))
    		end
    		if g == 0xDFFF then
    			error(d.new("URI malformed"))
    		end
    	end
    	if g >= 0xDC00 and g < 0xDFFF then
    		error(d.new("URI malformed"))
    	end
    	local h = a:UrlEncode(e)
    	
    	local i = h
    		:gsub("%%2D", "-")
    		:gsub("%%5F", "_")
    		:gsub("%%2E", ".")
    		:gsub("%%21", "!")
    		:gsub("%%7E", "~")
    		:gsub("%%2A", "*")
    		:gsub("%%27", "'")
    		:gsub("%%28", "(")
    		:gsub("%%29", ")")
    	return i
    end
    
    return encodeURIComponent
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill/src/extends"] = function()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return function(a, b, c)
    	local d = {}
    	d.__index = d
    	d.__tostring = function(e)
    		return getmetatable(a).__tostring(e)
    	end
    
    	local e = {}
    
    	d.new = function(...)
    		local f = {}
    		c(f, ...)
    		return setmetatable(f, d)
    	end
    
    	if typeof(getmetatable(a)) == "table" and getmetatable(a).__call then
    		e.__call = function(f, ...)
    			return d.new(...)
    		end
    	end
    
    	e.__index = a
    	e.__tostring = function(f)
    		
    		if f == d then
    			return tostring(b)
    		end
    		return getmetatable(a).__tostring(f)
    	end
    
    	setmetatable(d, e)
    
    	return d
    end
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/math"] = function()
    return _require("Packages/_Index/jsdotlua_math@1.2.7/math")
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/number"] = function()
    return _require("Packages/_Index/jsdotlua_number@1.2.7/number")
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/string"] = function()
    return _require("Packages/_Index/jsdotlua_string@1.2.7/string")
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/symbol-luau"] = function()
    return _require("Packages/_Index/jsdotlua_symbol-luau@1.0.1/symbol-luau")
end

_modules["Packages/_Index/jsdotlua_luau-polyfill@1.2.7/timers"] = function()
    return _require("Packages/_Index/jsdotlua_timers@1.2.7/timers")
end

_modules["Packages/_Index/jsdotlua_math@1.2.7/math/src"] = function()
    return {
    	clz32 = _require("Packages/_Index/jsdotlua_math@1.2.7/math/src")),
    }
end

_modules["Packages/_Index/jsdotlua_math@1.2.7/math/src/clz32"] = function()
    return bit32.countlz
end

_modules["Packages/_Index/jsdotlua_number@1.2.7/number/src"] = function()
    return {
    	isFinite = _require("Packages/_Index/jsdotlua_number@1.2.7/number/src")),
    	isInteger = _require("Packages/_Index/jsdotlua_number@1.2.7/number/src")),
    	isNaN = _require("Packages/_Index/jsdotlua_number@1.2.7/number/src")),
    	isSafeInteger = _require("Packages/_Index/jsdotlua_number@1.2.7/number/src")),
    	MAX_SAFE_INTEGER = _require("Packages/_Index/jsdotlua_number@1.2.7/number/src")),
    	MIN_SAFE_INTEGER = _require("Packages/_Index/jsdotlua_number@1.2.7/number/src")),
    	NaN = 0/0,
    	toExponential = _require("Packages/_Index/jsdotlua_number@1.2.7/number/src")),
    }
end

_modules["Packages/_Index/jsdotlua_number@1.2.7/number/src/MAX_SAFE_INTEGER"] = function()
    
    return 9007199254740991
end

_modules["Packages/_Index/jsdotlua_number@1.2.7/number/src/MIN_SAFE_INTEGER"] = function()
    
    return -9007199254740991
end

_modules["Packages/_Index/jsdotlua_number@1.2.7/number/src/isFinite"] = function()
    return function(a)
    	return typeof(a) == "number" and a == a and a ~= math.huge and a ~= -math.huge
    end
end

_modules["Packages/_Index/jsdotlua_number@1.2.7/number/src/isInteger"] = function()
    
    return function(a)
    	return type(a) == "number" and a ~= math.huge and a == math.floor(a)
    end
end

_modules["Packages/_Index/jsdotlua_number@1.2.7/number/src/isNaN"] = function()
    
    return function(a)
    	return type(a) == "number" and a ~= a
    end
end

_modules["Packages/_Index/jsdotlua_number@1.2.7/number/src/isSafeInteger"] = function()
    
    local a = _require("Packages/_Index/jsdotlua_number@1.2.7/number/src"))
    local b = _require("Packages/_Index/jsdotlua_number@1.2.7/number/src"))
    
    return function(c)
    	return a(c) and math.abs(c) <= b
    end
end

_modules["Packages/_Index/jsdotlua_number@1.2.7/number/src/toExponential"] = function()
    
    return function(a: string | number, b: number?): string | nil
    	local c = a
    	if typeof(a) == "string" then
    		
    		local d = 0/0
    c = tonumber(a) or d 
    	end
    	
    	if typeof(c) ~= "number" then
    		return "nan"
    	end
    
    	if b ~= nil then
    		if typeof(b) ~= "number" then
    			error("TypeError: fractionDigits must be a number between 0 and 100")
    		end
    		if b < 0 or b > 100 then
    			error("RangeError: fractionDigits must be between 0 and 100")
    		end
    	end
    
    	local d
    	if b == nil then
    		d = "%e"
    	else
    		d = "%." .. tostring(b) .. "e"
    	end
    
    	local e = string.format(d, c):gsub("%+0", "+"):gsub("%-0", "-"):gsub("0*e", "e")
    
    	return e
    end
end

_modules["Packages/_Index/jsdotlua_promise@3.5.2/promise/lib"] = function()
    
    
    
    
    local a = "Non-promise value passed into %s at index %s"
    local b = "Please pass a list of promises to %s"
    local c = "Please pass a handler function to %s!"
    local d = { __mode = "k" }
    
    local function isCallable(e)
    	if type(e) == "function" then
    		return true
    	end
    
    	if type(e) == "table" then
    		local f = getmetatable(e)
    		if f and type(rawget(f, "__call")) == "function" then
    			return true
    		end
    	end
    
    	return false
    end
    
    
    
    
    local function makeEnum(e, f)
    	local g = {}
    
    	for h, i in ipairs(f) do
    		g[i] = i
    	end
    
    	return setmetatable(g, {
    		__index = function(h, i)
    			error(string.format("%s is not in %s!", i, e), 2)
    		end,
    		__newindex = function()
    			error(string.format("Creating new members in %s is not allowed!", e), 2)
    		end,
    	})
    end
    
    
    
    
    
    
    
    
    local e
    do
    	e = {
    		Kind = makeEnum("Promise.Error.Kind", {
    			"ExecutionError",
    			"AlreadyCancelled",
    			"NotResolvedInTime",
    			"TimedOut",
    		}),
    	}
    	e.__index = e
    
    	function e.new(f, g)
    		f = f or {}
    		return setmetatable({
    			error = tostring(f.error) or "[This error has no error text.]",
    			trace = f.trace,
    			context = f.context,
    			kind = f.kind,
    			parent = g,
    			createdTick = os.clock(),
    			createdTrace = debug.traceback(),
    		}, e)
    	end
    
    	function e.is(f)
    		if type(f) == "table" then
    			local g = getmetatable(f)
    
    			if type(g) == "table" then
    				return rawget(f, "error") ~= nil and type(rawget(g, "extend")) == "function"
    			end
    		end
    
    		return false
    	end
    
    	function e.isKind(f, g)
    		assert(g ~= nil, "Argument #2 to Promise.Error.isKind must not be nil")
    
    		return e.is(f) and f.kind == g
    	end
    
    	function e:extend(f)
    		f = f or {}
    
    		f.kind = f.kind or self.kind
    
    		return e.new(f, self)
    	end
    
    	function e:getErrorChain()
    		local f = { self }
    
    		while f[#f].parent do
    			table.insert(f, f[#f].parent)
    		end
    
    		return f
    	end
    
    	function e:__tostring()
    		local f = {
    			string.format("-- Promise.Error(%s) --", self.kind or "?"),
    		}
    
    		for g, h in ipairs(self:getErrorChain()) do
    			table.insert(
    				f,
    				table.concat({
    					h.trace or h.error,
    					h.context,
    				}, "\n")
    			)
    		end
    
    		return table.concat(f, "\n")
    	end
    end
    
    
    
    
    
    
    local function pack(...)
    	return select("#", ...), { ... }
    end
    
    
    
    
    local function packResult(f, ...)
    	return f, select("#", ...), { ... }
    end
    
    local function makeErrorHandler(f)
    	assert(f ~= nil, "traceback is nil")
    
    	return function(g)
    		
    		
    
    		if type(g) == "table" then
    			return g
    		end
    
    		return e.new({
    			error = g,
    			kind = e.Kind.ExecutionError,
    			trace = debug.traceback(tostring(g), 2),
    			context = "Promise created at:\n\n" .. f,
    		})
    	end
    end
    
    
    
    
    local function runExecutor(f, g, ...)
    	return packResult(xpcall(g, makeErrorHandler(f), ...))
    end
    
    
    
    
    
    local function createAdvancer(f, g, h, i)
    	return function(...)
    		local j, k, l = runExecutor(f, g, ...)
    
    		if j then
    			h(unpack(l, 1, k))
    		else
    			i(l[1])
    		end
    	end
    end
    
    local function isEmpty(f)
    	return next(f) == nil
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    local f = {
    	Error = e,
    	Status = makeEnum("Promise.Status", { "Started", "Resolved", "Rejected", "Cancelled" }),
    	_getTime = os.clock,
    	_timeEvent = game:GetService("RunService").Heartbeat,
    	_unhandledRejectionCallbacks = {},
    }
    f.prototype = {}
    f.__index = f.prototype
    
    function f._new(g, h, i)
    	if i ~= nil and not f.is(i) then
    		error("Argument #2 to Promise.new must be a promise or nil", 2)
    	end
    
    	local j = {
    		
    		_thread = nil,
    
    		
    		_source = g,
    
    		_status = f.Status.Started,
    
    		
    		
    		_values = nil,
    
    		
    		
    		_valuesLength = -1,
    
    		
    		_unhandledRejection = true,
    
    		
    		_queuedResolve = {},
    		_queuedReject = {},
    		_queuedFinally = {},
    
    		
    		_cancellationHook = nil,
    
    		
    		
    		_parent = i,
    
    		
    		
    		_consumers = setmetatable({}, d),
    	}
    
    	if i and i._status == f.Status.Started then
    		i._consumers[j] = true
    	end
    
    	setmetatable(j, f)
    
    	local function resolve(...)
    		j:_resolve(...)
    	end
    
    	local function reject(...)
    		j:_reject(...)
    	end
    
    	local function onCancel(k)
    		if k then
    			if j._status == f.Status.Cancelled then
    				k()
    			else
    				j._cancellationHook = k
    			end
    		end
    
    		return j._status == f.Status.Cancelled
    	end
    
    	j._thread = coroutine.create(function()
    		local k, l, m = runExecutor(j._source, h, resolve, reject, onCancel)
    
    		if not k then
    			reject(m[1])
    		end
    	end)
    
    	task.spawn(j._thread)
    
    	return j
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.new(g)
    	return f._new(debug.traceback(nil, 2), g)
    end
    
    function f:__tostring()
    	return string.format("Promise(%s)", self._status)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.defer(g)
    	local h = debug.traceback(nil, 2)
    	local i
    	i = f._new(h, function(j, k, l)
    		local m
    		m = f._timeEvent:Connect(function()
    			m:Disconnect()
    			local n, o, p = runExecutor(h, g, j, k, l)
    
    			if not n then
    				k(p[1])
    			end
    		end)
    	end)
    
    	return i
    end
    
    
    f.async = f.defer
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.resolve(...)
    	local g, h = pack(...)
    	return f._new(debug.traceback(nil, 2), function(i)
    		i(unpack(h, 1, g))
    	end)
    end
    
    
    
    
    
    
    
    
    
    
    
    function f.reject(...)
    	local g, h = pack(...)
    	return f._new(debug.traceback(nil, 2), function(i, j)
    		j(unpack(h, 1, g))
    	end)
    end
    
    
    
    
    
    function f._try(g, h, ...)
    	local i, j = pack(...)
    
    	return f._new(g, function(k)
    		k(h(unpack(j, 1, i)))
    	end)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.try(g, ...)
    	return f._try(debug.traceback(nil, 2), g, ...)
    end
    
    
    
    
    
    
    function f._all(g, h, i)
    	if type(h) ~= "table" then
    		error(string.format(b, "Promise.all"), 3)
    	end
    
    	
    	
    	for j, k in pairs(h) do
    		if not f.is(k) then
    			error(string.format(a, "Promise.all", tostring(j)), 3)
    		end
    	end
    
    	
    	if #h == 0 or i == 0 then
    		return f.resolve({})
    	end
    
    	return f._new(g, function(j, k, l)
    		
    		local m = {}
    		local n = {}
    
    		
    		
    		local o = 0
    		local p = 0
    		local q = false
    
    		local function cancel()
    			for r, s in ipairs(n) do
    				s:cancel()
    			end
    		end
    
    		
    		local function resolveOne(r, ...)
    			if q then
    				return
    			end
    
    			o = o + 1
    
    			if i == nil then
    				m[r] = ...
    			else
    				m[o] = ...
    			end
    
    			if o >= (i or #h) then
    				q = true
    				j(m)
    				cancel()
    			end
    		end
    
    		l(cancel)
    
    		
    		
    		for r, s in ipairs(h) do
    			n[r] = s:andThen(function(...)
    				resolveOne(r, ...)
    			end, function(...)
    				p = p + 1
    
    				if i == nil or #h - p < i then
    					cancel()
    					q = true
    
    					k(...)
    				end
    			end)
    		end
    
    		if q then
    			cancel()
    		end
    	end)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.all(...)
    	local g = { ... }
    
    	
    	if type(g[1]) == "table" and not f.is(g[1]) then
    		
    		g = g[1]
    	end
    
    	return f._all(debug.traceback(nil, 2), g)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.fold(g, h, i)
    	assert(type(g) == "table", "Bad argument #1 to Promise.fold: must be a table")
    	assert(isCallable(h), "Bad argument #2 to Promise.fold: must be a function")
    
    	local j = f.resolve(i)
    	return f.each(g, function(k, l)
    		j = j:andThen(function(m)
    			return h(m, k, l)
    		end)
    	end):andThen(function()
    		return j
    	end)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.some(g, h)
    	assert(type(h) == "number", "Bad argument #2 to Promise.some: must be a number")
    
    	return f._all(debug.traceback(nil, 2), g, h)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.any(g)
    	return f._all(debug.traceback(nil, 2), g, 1):andThen(function(h)
    		return h[1]
    	end)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.allSettled(g)
    	if type(g) ~= "table" then
    		error(string.format(b, "Promise.allSettled"), 2)
    	end
    
    	
    	
    	for h, i in pairs(g) do
    		if not f.is(i) then
    			error(string.format(a, "Promise.allSettled", tostring(h)), 2)
    		end
    	end
    
    	
    	if #g == 0 then
    		return f.resolve({})
    	end
    
    	return f._new(debug.traceback(nil, 2), function(h, i, j)
    		
    		local k = {}
    		local l = {}
    
    		
    		
    		local m = 0
    
    		
    		local function resolveOne(n, ...)
    			m = m + 1
    
    			k[n] = ...
    
    			if m >= #g then
    				h(k)
    			end
    		end
    
    		j(function()
    			for n, o in ipairs(l) do
    				o:cancel()
    			end
    		end)
    
    		
    		
    		for n, o in ipairs(g) do
    			l[n] = o:finally(function(...)
    				resolveOne(n, ...)
    			end)
    		end
    	end)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.race(g)
    	assert(type(g) == "table", string.format(b, "Promise.race"))
    
    	for h, i in pairs(g) do
    		assert(f.is(i), string.format(a, "Promise.race", tostring(h)))
    	end
    
    	return f._new(debug.traceback(nil, 2), function(h, i, j)
    		local k = {}
    		local l = false
    
    		local function cancel()
    			for m, n in ipairs(k) do
    				n:cancel()
    			end
    		end
    
    		local function finalize(m)
    			return function(...)
    				cancel()
    				l = true
    				return m(...)
    			end
    		end
    
    		if j(finalize(i)) then
    			return
    		end
    
    		for m, n in ipairs(g) do
    			k[m] = n:andThen(finalize(h), finalize(i))
    		end
    
    		if l then
    			cancel()
    		end
    	end)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.each(g, h)
    	assert(type(g) == "table", string.format(b, "Promise.each"))
    	assert(isCallable(h), string.format(c, "Promise.each"))
    
    	return f._new(debug.traceback(nil, 2), function(i, j, k)
    		local l = {}
    		local m = {}
    
    		local n = false
    
    		local function cancel()
    			for o, p in ipairs(m) do
    				p:cancel()
    			end
    		end
    
    		k(function()
    			n = true
    
    			cancel()
    		end)
    
    		
    		
    		
    		
    		
    
    		local o = {}
    
    		for p, q in ipairs(g) do
    			if f.is(q) then
    				if q:getStatus() == f.Status.Cancelled then
    					cancel()
    					return j(e.new({
    						error = "Promise is cancelled",
    						kind = e.Kind.AlreadyCancelled,
    						context = string.format(
    							"The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s",
    							p,
    							q._source
    						),
    					}))
    				elseif q:getStatus() == f.Status.Rejected then
    					cancel()
    					return j(select(2, q:await()))
    				end
    
    				
    				local r = q:andThen(function(...)
    					return ...
    				end)
    
    				table.insert(m, r)
    				o[p] = r
    			else
    				o[p] = q
    			end
    		end
    
    		for p, q in ipairs(o) do
    			if f.is(q) then
    				local r
    				r, q = q:await()
    
    				if not r then
    					cancel()
    					return j(q)
    				end
    			end
    
    			if n then
    				return
    			end
    
    			local r = f.resolve(h(q, p))
    
    			table.insert(m, r)
    
    			local s, t = r:await()
    
    			if not s then
    				cancel()
    				return j(t)
    			end
    
    			l[p] = t
    		end
    
    		i(l)
    	end)
    end
    
    
    
    
    
    
    
    function f.is(g)
    	if type(g) ~= "table" then
    		return false
    	end
    
    	local h = getmetatable(g)
    
    	if h == f then
    		
    		return true
    	elseif h == nil then
    		
    		return isCallable(g.andThen)
    	elseif
    		type(h) == "table"
    		and type(rawget(h, "__index")) == "table"
    		and isCallable(rawget(rawget(h, "__index"), "andThen"))
    	then
    		
    		return true
    	end
    
    	return false
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.promisify(g)
    	return function(...)
    		return f._try(debug.traceback(nil, 2), g, ...)
    	end
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    do
    	
    
    	
    	local g
    	local h
    
    	function f.delay(i)
    		assert(type(i) == "number", "Bad argument #1 to Promise.delay, must be a number.")
    		
    		
    		if not (i >= 1.6666666666666665E-2) or i == math.huge then
    			i = 1.6666666666666665E-2		
    end
    
    		return f._new(debug.traceback(nil, 2), function(j, k, l)
    			local m = f._getTime()
    			local n = m + i
    
    			local o = {
    				resolve = j,
    				startTime = m,
    				endTime = n,
    			}
    
    			if h == nil then 
    				g = o
    				h = f._timeEvent:Connect(function()
    					local p = f._getTime()
    
    					while g ~= nil and g.endTime < p do
    						local q = g
    						g = q.next
    
    						if g == nil then
    							h:Disconnect()
    							h = nil
    						else
    							g.previous = nil
    						end
    
    						q.resolve(f._getTime() - q.startTime)
    					end
    				end)
    			else 
    				if g.endTime < n then 
    					
    					
    					local p = g
    					local q = p.next
    
    					while q ~= nil and q.endTime < n do
    						p = q
    						q = p.next
    					end
    
    					
    					p.next = o
    					o.previous = p
    
    					if q ~= nil then
    						o.next = q
    						q.previous = o
    					end
    				else
    					
    					o.next = g
    					g.previous = o
    					g = o
    				end
    			end
    
    			l(function()
    				
    				local p = o.next
    
    				if g == o then
    					if p == nil then 
    						h:Disconnect()
    						h = nil
    					else 
    						p.previous = nil
    					end
    					g = p
    				else
    					local q = o.previous
    					
    					q.next = p
    
    					if p ~= nil then
    						p.previous = q
    					end
    				end
    			end)
    		end)
    	end
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.prototype:timeout(g, h)
    	local i = debug.traceback(nil, 2)
    
    	return f.race({
    		f.delay(g):andThen(function()
    			return f.reject(h == nil and e.new({
    				kind = e.Kind.TimedOut,
    				error = "Timed out",
    				context = string.format(
    					"Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s",
    					g,
    					i
    				),
    			}) or h)
    		end),
    		self,
    	})
    end
    
    
    
    
    
    
    function f.prototype:getStatus()
    	return self._status
    end
    
    
    
    
    
    
    function f.prototype:_andThen(g, h, i)
    	self._unhandledRejection = false
    
    	
    	return f._new(g, function(j, k)
    		
    		
    
    		local l = j
    		if h then
    			l = createAdvancer(g, h, j, k)
    		end
    
    		local m = k
    		if i then
    			m = createAdvancer(g, i, j, k)
    		end
    
    		if self._status == f.Status.Started then
    			
    			table.insert(self._queuedResolve, l)
    			table.insert(self._queuedReject, m)
    		elseif self._status == f.Status.Resolved then
    			
    			l(unpack(self._values, 1, self._valuesLength))
    		elseif self._status == f.Status.Rejected then
    			
    			m(unpack(self._values, 1, self._valuesLength))
    		elseif self._status == f.Status.Cancelled then
    			
    			
    			k(e.new({
    				error = "Promise is cancelled",
    				kind = e.Kind.AlreadyCancelled,
    				context = "Promise created at\n\n" .. g,
    			}))
    		end
    	end, self)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.prototype:andThen(g, h)
    	assert(g == nil or isCallable(g), string.format(c, "Promise:andThen"))
    	assert(h == nil or isCallable(h), string.format(c, "Promise:andThen"))
    
    	return self:_andThen(debug.traceback(nil, 2), g, h)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.prototype:andThenAsync(g, h)
    	assert(g == nil or isCallable(g), string.format(c, "Promise:andThenAsync"))
    	assert(h == nil or isCallable(h), string.format(c, "Promise:andThenAsync"))
    
    
    	return self:_andThen(
    		debug.traceback(nil, 2),
    		function(...)
    			local i, j = pack(...)
    			return f.defer(function(k)
    				k(unpack(j, 1, i))
    			end)
    		end,
    		function(...)
    			local i, j = pack(...)
    			return f.defer(function(k, l)
    				l(unpack(j, 1, i))
    			end)
    		end
    	):andThen(g, h)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.prototype:catch(g)
    	assert(g == nil or isCallable(g), string.format(c, "Promise:catch"))
    	return self:_andThen(debug.traceback(nil, 2), nil, g)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.prototype:tap(g)
    	assert(isCallable(g), string.format(c, "Promise:tap"))
    	return self:_andThen(debug.traceback(nil, 2), function(...)
    		local h = g(...)
    
    		if f.is(h) then
    			local i, j = pack(...)
    			return h:andThen(function()
    				return unpack(j, 1, i)
    			end)
    		end
    
    		return ...
    	end)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.prototype:andThenCall(g, ...)
    	assert(isCallable(g), string.format(c, "Promise:andThenCall"))
    	local h, i = pack(...)
    	return self:_andThen(debug.traceback(nil, 2), function()
    		return g(unpack(i, 1, h))
    	end)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.prototype:andThenReturn(...)
    	local g, h = pack(...)
    	return self:_andThen(debug.traceback(nil, 2), function()
    		return unpack(h, 1, g)
    	end)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    function f.prototype:cancel()
    	if self._status ~= f.Status.Started then
    		return
    	end
    
    	self._status = f.Status.Cancelled
    
    	if self._cancellationHook then
    		self._cancellationHook()
    	end
    
    	coroutine.close(self._thread)
    
    	if self._parent then
    		self._parent:_consumerCancelled(self)
    	end
    
    	for g in pairs(self._consumers) do
    		g:cancel()
    	end
    
    	self:_finalize()
    end
    
    
    
    
    
    function f.prototype:_consumerCancelled(g)
    	if self._status ~= f.Status.Started then
    		return
    	end
    
    	self._consumers[g] = nil
    
    	if next(self._consumers) == nil then
    		self:cancel()
    	end
    end
    
    
    
    
    
    function f.prototype:_finally(g, h, i)
    	if not i then
    		self._unhandledRejection = false
    	end
    
    	
    	return f._new(g, function(j, k)
    		local l = j
    		if h then
    			l = createAdvancer(g, h, j, k)
    		end
    
    		if i then
    			local m = l
    			l = function(...)
    				if self._status == f.Status.Rejected then
    					return j(self)
    				end
    
    				return m(...)
    			end
    		end
    
    		if self._status == f.Status.Started then
    			
    			table.insert(self._queuedFinally, l)
    		else
    			
    			l(self._status)
    		end
    	end, self)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.prototype:finally(g)
    	assert(g == nil or isCallable(g), string.format(c, "Promise:finally"))
    	return self:_finally(debug.traceback(nil, 2), g)
    end
    
    
    
    
    
    
    
    
    
    
    function f.prototype:finallyCall(g, ...)
    	assert(isCallable(g), string.format(c, "Promise:finallyCall"))
    	local h, i = pack(...)
    	return self:_finally(debug.traceback(nil, 2), function()
    		return g(unpack(i, 1, h))
    	end)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.prototype:finallyReturn(...)
    	local g, h = pack(...)
    	return self:_finally(debug.traceback(nil, 2), function()
    		return unpack(h, 1, g)
    	end)
    end
    
    
    
    
    function f.prototype:done(g)
    	assert(
    		g == nil or isCallable(g),
    		string.format(c, "Promise:done")
    	)
    	return self:_finally(debug.traceback(nil, 2), g, true)
    end
    
    
    
    
    function f.prototype:doneCall(g, ...)
    	assert(isCallable(g), string.format(c, "Promise:doneCall"))
    	local h, i = pack(...)
    	return self:_finally(debug.traceback(nil, 2), function()
    		return g(unpack(i, 1, h))
    	end, true)
    end
    
    
    
    
    function f.prototype:doneReturn(...)
    	local g, h = pack(...)
    	return self:_finally(debug.traceback(nil, 2), function()
    		return unpack(h, 1, g)
    	end, true)
    end
    
    
    
    
    
    
    
    
    function f.prototype:awaitStatus()
    	self._unhandledRejection = false
    
    	if self._status == f.Status.Started then
    		local g = coroutine.running()
    
    		self:finally(function()
    			task.spawn(g)
    		end)
    
    		coroutine.yield()
    	end
    
    	if self._status == f.Status.Resolved then
    		return self._status, unpack(self._values, 1, self._valuesLength)
    	elseif self._status == f.Status.Rejected then
    		return self._status, unpack(self._values, 1, self._valuesLength)
    	end
    
    	return self._status
    end
    
    local function awaitHelper(g, ...)
    	return g == f.Status.Resolved, ...
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.prototype:await()
    	return awaitHelper(self:awaitStatus())
    end
    
    local function expectHelper(g, ...)
    	if g ~= f.Status.Resolved then
    		error((...) == nil and "Expected Promise rejected with no value." or (...), 3)
    	end
    
    	return ...
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.prototype:expect()
    	return expectHelper(self:awaitStatus())
    end
    
    
    f.prototype.awaitValue = f.prototype.expect
    
    
    
    
    
    
    
    
    function f.prototype:_unwrap()
    	if self._status == f.Status.Started then
    		error("Promise has not resolved or rejected.", 2)
    	end
    
    	local g = self._status == f.Status.Resolved
    
    	return g, unpack(self._values, 1, self._valuesLength)
    end
    
    function f.prototype:_resolve(...)
    	if self._status ~= f.Status.Started then
    		if f.is((...)) then
    			(...):_consumerCancelled(self)
    		end
    		return
    	end
    
    	
    	if f.is((...)) then
    		
    		if select("#", ...) > 1 then
    			local g = string.format(
    [[When returning a Promise from andThen, extra arguments are discarded! See:
    
    %s]],
    				self._source
    			)
    			warn(g)
    		end
    
    		local g = ...
    
    		local h = g:andThen(function(...)
    			self:_resolve(...)
    		end, function(...)
    			local h = g._values[1]
    
    			
    			if g._error then
    				h = e.new({
    					error = g._error,
    					kind = e.Kind.ExecutionError,
    					context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]",
    				})
    			end
    
    			if e.isKind(h, e.Kind.ExecutionError) then
    				return self:_reject(h:extend({
    					error = "This Promise was chained to a Promise that errored.",
    					trace = "",
    					context = string.format(
    						"The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n",
    						self._source
    					),
    				}))
    			end
    
    			self:_reject(...)
    		end)
    
    		if h._status == f.Status.Cancelled then
    			self:cancel()
    		elseif h._status == f.Status.Started then
    			
    			self._parent = h
    			h._consumers[self] = true
    		end
    
    		return
    	end
    
    	self._status = f.Status.Resolved
    	self._valuesLength, self._values = pack(...)
    
    	
    	for g, h in ipairs(self._queuedResolve) do
    		coroutine.wrap(h)(...)
    	end
    
    	self:_finalize()
    end
    
    function f.prototype:_reject(...)
    	if self._status ~= f.Status.Started then
    		return
    	end
    
    	self._status = f.Status.Rejected
    	self._valuesLength, self._values = pack(...)
    
    	
    	if not isEmpty(self._queuedReject) then
    		
    		for g, h in ipairs(self._queuedReject) do
    			coroutine.wrap(h)(...)
    		end
    	else
    		
    		
    		
    		
    
    		local g = tostring((...))
    
    		coroutine.wrap(function()
    			f._timeEvent:Wait()
    
    			
    			if not self._unhandledRejection then
    				return
    			end
    
    			
    			local h = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", g, self._source)
    
    			for i, j in ipairs(f._unhandledRejectionCallbacks) do
    				task.spawn(j, self, unpack(self._values, 1, self._valuesLength))
    			end
    
    			if f.TEST then
    				
    				return
    			end
    
    			warn(h)
    		end)()
    	end
    
    	self:_finalize()
    end
    
    
    
    
    function f.prototype:_finalize()
    	for g, h in ipairs(self._queuedFinally) do
    		
    		
    		
    		coroutine.wrap(h)(self._status)
    	end
    
    	self._queuedFinally = nil
    	self._queuedReject = nil
    	self._queuedResolve = nil
    
    	
    	if not f.TEST then
    		self._parent = nil
    		self._consumers = nil
    	end
    
    	task.defer(coroutine.close, self._thread)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.prototype:now(g)
    	local h = debug.traceback(nil, 2)
    	if self._status == f.Status.Resolved then
    		return self:_andThen(h, function(...)
    			return ...
    		end)
    	else
    		return f.reject(g == nil and e.new({
    			kind = e.Kind.NotResolvedInTime,
    			error = "This Promise was not resolved in time for :now()",
    			context = ":now() was called at:\n\n" .. h,
    		}) or g)
    	end
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.retry(g, h, ...)
    	assert(isCallable(g), "Parameter #1 to Promise.retry must be a function")
    	assert(type(h) == "number", "Parameter #2 to Promise.retry must be a number")
    
    	local i, j = { ... }, select("#", ...)
    
    	return f.resolve(g(...)):catch(function(...)
    		if h > 0 then
    			return f.retry(g, h - 1, unpack(i, 1, j))
    		else
    			return f.reject(...)
    		end
    	end)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.retryWithDelay(g, h, i, ...)
    	assert(isCallable(g), "Parameter #1 to Promise.retry must be a function")
    	assert(type(h) == "number", "Parameter #2 (times) to Promise.retry must be a number")
    	assert(type(i) == "number", "Parameter #3 (seconds) to Promise.retry must be a number")
    
    	local j, k = { ... }, select("#", ...)
    
    	return f.resolve(g(...)):catch(function(...)
    		if h > 0 then
    			f.delay(i):await()
    
    			return f.retryWithDelay(g, h - 1, i, unpack(j, 1, k))
    		else
    			return f.reject(...)
    		end
    	end)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function f.fromEvent(g, h)
    	h = h or function()
    		return true
    	end
    
    	return f._new(debug.traceback(nil, 2), function(i, j, k)
    		local l
    		local m = false
    
    		local function disconnect()
    			l:Disconnect()
    			l = nil
    		end
    
    		
    		
    		
    
    		l = g:Connect(function(...)
    			local n = h(...)
    
    			if n == true then
    				i(...)
    
    				if l then
    					disconnect()
    				else
    					m = true
    				end
    			elseif type(n) ~= "boolean" then
    				error("Promise.fromEvent predicate should always return a boolean")
    			end
    		end)
    
    		if m and l then
    			return disconnect()
    		end
    
    		k(disconnect)
    	end)
    end
    
    
    
    
    
    
    
    
    
    
    
    function f.onUnhandledRejection(g)
    	table.insert(f._unhandledRejectionCallbacks, g)
    
    	return function()
    		local h = table.find(f._unhandledRejectionCallbacks, g)
    
    		if h then
    			table.remove(f._unhandledRejectionCallbacks, h)
    		end
    	end
    end
    
    return f
end

_modules["Packages/_Index/jsdotlua_promise@3.5.2/promise/lib/init.spec"] = function()
    return function()
    	local a = _require("Packages/_Index/jsdotlua_promise@3.5.2/promise/lib")
    	a.TEST = true
    
    	local b = Instance.new("BindableEvent")
    	a._timeEvent = b.Event
    
    	local function waitForEvents()
    		task.defer(coroutine.running())
    		coroutine.yield()
    	end
    
    	local c do
    		local d = 0
    
    		a._getTime = function()
    			return d
    		end
    
    		function c(e)
    			e = e or (1.6666666666666665E-2)
    
    			d = d + e
    			b:Fire(e)
    			waitForEvents()
    		end
    	end
    
    	local function pack(...)
    		local d = select("#", ...)
    
    		return d, { ... }
    	end
    
    	describe("Promise.Status", function()
    		it("should error if indexing nil value", function()
    			expect(function()
    				local d = a.Status.wrong
    			end).to.throw()
    		end)
    	end)
    
    	describe("Unhandled rejection signal", function()
    		it("should call unhandled rejection callbacks", function()
    			local d = a.new(function(d, e)
    				e(1, 2)
    			end)
    
    			local e = 0
    
    			local function callback(f, g, h)
    				e += 1
    
    				expect(f).to.equal(d)
    				expect(g).to.equal(1)
    				expect(h).to.equal(2)
    			end
    
    			local f = a.onUnhandledRejection(callback)
    
    			c()
    
    			expect(e).to.equal(1)
    
    			f()
    
    			a.new(function(g, h)
    				h(3, 4)
    			end)
    
    			c()
    
    			expect(e).to.equal(1)
    		end)
    	end)
    
    	describe("Promise.new", function()
    		it("should instantiate with a callback", function()
    			local d = a.new(function() end)
    
    			expect(d).to.be.ok()
    		end)
    
    		it("should invoke the given callback with resolve and reject", function()
    			local d = 0
    			local e
    			local f
    
    			local g = a.new(function(g, h)
    				d = d + 1
    				e = g
    				f = h
    			end)
    
    			expect(g).to.be.ok()
    
    			expect(d).to.equal(1)
    			expect(e).to.be.a("function")
    			expect(f).to.be.a("function")
    			expect(g:getStatus()).to.equal(a.Status.Started)
    		end)
    
    		it("should resolve promises on resolve()", function()
    			local d = 0
    
    			local e = a.new(function(e)
    				d = d + 1
    				e()
    			end)
    
    			expect(e).to.be.ok()
    			expect(d).to.equal(1)
    			expect(e:getStatus()).to.equal(a.Status.Resolved)
    		end)
    
    		it("should reject promises on reject()", function()
    			local d = 0
    
    			local e = a.new(function(e, f)
    				d = d + 1
    				f()
    			end)
    
    			expect(e).to.be.ok()
    			expect(d).to.equal(1)
    			expect(e:getStatus()).to.equal(a.Status.Rejected)
    		end)
    
    		it("should reject on error in callback", function()
    			local d = 0
    
    			local e = a.new(function()
    				d = d + 1
    				error("hahah")
    			end)
    
    			expect(e).to.be.ok()
    			expect(d).to.equal(1)
    			expect(e:getStatus()).to.equal(a.Status.Rejected)
    			expect(tostring(e._values[1]):find("hahah")).to.be.ok()
    
    			
    			expect(tostring(e._values[1]):find("init.spec")).to.be.ok()
    			expect(tostring(e._values[1]):find("runExecutor")).to.be.ok()
    		end)
    
    		it("should work with C functions", function()
    			expect(function()
    				a.new(tick):andThen(tick)
    			end).to.never.throw()
    		end)
    
    		it("should have a nice tostring", function()
    			expect(tostring(a.resolve()):gmatch("Promise(Resolved)")).to.be.ok()
    		end)
    
    		it("should allow yielding", function()
    			local d = Instance.new("BindableEvent")
    			local e = a.new(function(e)
    				d.Event:Wait()
    				e(5)
    			end)
    
    			expect(e:getStatus()).to.equal(a.Status.Started)
    			d:Fire()
    
    			waitForEvents()
    
    			expect(e:getStatus()).to.equal(a.Status.Resolved)
    			expect(e._values[1]).to.equal(5)
    		end)
    
    		it("should preserve stack traces of resolve-chained promises", function()
    			local function nestedCall(d)
    				error(d)
    			end
    
    			local d = a.new(function(d)
    				d(a.new(function()
    					nestedCall("sample text")
    				end))
    			end)
    
    			expect(d:getStatus()).to.equal(a.Status.Rejected)
    
    			local e = tostring(d._values[1])
    			expect(e:find("sample text")).to.be.ok()
    			expect(e:find("nestedCall")).to.be.ok()
    			expect(e:find("runExecutor")).to.be.ok()
    			expect(e:find("runPlanNode")).to.be.ok()
    			expect(
    				e:find("...Rejected because it was chained to the following Promise, which encountered an error:")
    			).to.be.ok()
    		end)
    
    		it("should report errors from Promises with _error (< v2)", function()
    			local d = a.reject()
    			d._error = "Sample error"
    
    			local e = a.resolve():andThenReturn(d)
    
    			expect(e:getStatus()).to.equal(a.Status.Rejected)
    
    			local f = tostring(e._values[1])
    			expect(f:find("Sample error")).to.be.ok()
    			expect(
    				f:find("...Rejected because it was chained to the following Promise, which encountered an error:")
    			).to.be.ok()
    			expect(f:find("%[No stack trace available")).to.be.ok()
    		end)
    
    		it("should allow callable tables", function()
    			local d = a.new(setmetatable({}, {
    				__call = function(d, e)
    					e(1)
    				end,
    			}))
    
    			local e = false
    			d:andThen(setmetatable({}, {
    				__call = function(f, g)
    					expect(g).to.equal(1)
    					e = true
    				end,
    			}))
    
    			expect(e).to.equal(true)
    		end)
    
    		it("should close the thread after resolve", function()
    			local d = 0
    			a.new(function(e)
    				d += 1
    				e()
    				a.delay(1):await()
    				d += 1
    			end)
    
    			task.wait(1)
    
    			expect(d).to.equal(1)
    		end)
    	end)
    
    	describe("Promise.defer", function()
    		it("should execute after the time event", function()
    			local d = 0
    			local e = a.defer(function(e, f, g, h)
    				expect(type(e)).to.equal("function")
    				expect(type(f)).to.equal("function")
    				expect(type(g)).to.equal("function")
    				expect(type(h)).to.equal("nil")
    
    				d = d + 1
    
    				e("foo")
    			end)
    
    			expect(d).to.equal(0)
    			expect(e:getStatus()).to.equal(a.Status.Started)
    
    			c()
    			expect(d).to.equal(1)
    			expect(e:getStatus()).to.equal(a.Status.Resolved)
    
    			c()
    			expect(d).to.equal(1)
    		end)
    	end)
    
    	describe("Promise.delay", function()
    		it("should schedule promise resolution", function()
    			local d = a.delay(1)
    
    			expect(d:getStatus()).to.equal(a.Status.Started)
    
    			c()
    			expect(d:getStatus()).to.equal(a.Status.Started)
    
    			c(1)
    			expect(d:getStatus()).to.equal(a.Status.Resolved)
    		end)
    
    		it("should allow for delays to be cancelled", function()
    			local d = a.delay(2)
    
    			a.delay(1):andThen(function()
    				d:cancel()
    			end)
    
    			expect(d:getStatus()).to.equal(a.Status.Started)
    			c()
    			expect(d:getStatus()).to.equal(a.Status.Started)
    			c(1)
    			expect(d:getStatus()).to.equal(a.Status.Cancelled)
    			c(1)
    		end)
    	end)
    
    	describe("Promise.resolve", function()
    		it("should immediately resolve with a value", function()
    			local d = a.resolve(5, 6)
    
    			expect(d).to.be.ok()
    			expect(d:getStatus()).to.equal(a.Status.Resolved)
    			expect(d._values[1]).to.equal(5)
    			expect(d._values[2]).to.equal(6)
    		end)
    
    		it("should chain onto passed promises", function()
    			local d = a.resolve(a.new(function(d, e)
    				e(7)
    			end))
    
    			expect(d).to.be.ok()
    			expect(d:getStatus()).to.equal(a.Status.Rejected)
    			expect(d._values[1]).to.equal(7)
    		end)
    	end)
    
    	describe("Promise.reject", function()
    		it("should immediately reject with a value", function()
    			local d = a.reject(6, 7)
    
    			expect(d).to.be.ok()
    			expect(d:getStatus()).to.equal(a.Status.Rejected)
    			expect(d._values[1]).to.equal(6)
    			expect(d._values[2]).to.equal(7)
    		end)
    
    		it("should pass a promise as-is as an error", function()
    			local d = a.new(function(d)
    				d(6)
    			end)
    
    			local e = a.reject(d)
    
    			expect(e).to.be.ok()
    			expect(e:getStatus()).to.equal(a.Status.Rejected)
    			expect(e._values[1]).to.equal(d)
    		end)
    	end)
    
    	describe("Promise:andThen", function()
    		it("should allow yielding", function()
    			local d = Instance.new("BindableEvent")
    			local e = a.resolve():andThen(function()
    				d.Event:Wait()
    				return 5
    			end)
    
    			expect(e:getStatus()).to.equal(a.Status.Started)
    			d:Fire()
    			waitForEvents()
    			expect(e:getStatus()).to.equal(a.Status.Resolved)
    			expect(e._values[1]).to.equal(5)
    		end)
    
    		it("should run andThens on a new thread", function()
    			local d = Instance.new("BindableEvent")
    
    			local e
    			local f = a.new(function(f)
    				e = f
    			end)
    
    			local g = f:andThen(function()
    				d.Event:Wait()
    				return 5
    			end)
    
    			local h = f:andThen(function()
    				return "foo"
    			end)
    
    			expect(f:getStatus()).to.equal(a.Status.Started)
    			e()
    			expect(h:getStatus()).to.equal(a.Status.Resolved)
    			expect(h._values[1]).to.equal("foo")
    			expect(g:getStatus()).to.equal(a.Status.Started)
    		end)
    
    		it("should chain onto resolved promises", function()
    			local d
    			local e
    			local f = 0
    			local g = 0
    
    			local h = a.resolve(5)
    
    			local i = h:andThen(function(...)
    				e, d = pack(...)
    				f = f + 1
    			end, function()
    				g = g + 1
    			end)
    
    			expect(g).to.equal(0)
    
    			expect(f).to.equal(1)
    			expect(e).to.equal(1)
    			expect(d[1]).to.equal(5)
    
    			expect(h).to.be.ok()
    			expect(h:getStatus()).to.equal(a.Status.Resolved)
    			expect(h._values[1]).to.equal(5)
    
    			expect(i).to.be.ok()
    			expect(i).never.to.equal(h)
    			expect(i:getStatus()).to.equal(a.Status.Resolved)
    			expect(#i._values).to.equal(0)
    		end)
    
    		it("should chain onto rejected promises", function()
    			local d
    			local e
    			local f = 0
    			local g = 0
    
    			local h = a.reject(5)
    
    			local i = h:andThen(function(...)
    				g = g + 1
    			end, function(...)
    				e, d = pack(...)
    				f = f + 1
    			end)
    
    			expect(g).to.equal(0)
    
    			expect(f).to.equal(1)
    			expect(e).to.equal(1)
    			expect(d[1]).to.equal(5)
    
    			expect(h).to.be.ok()
    			expect(h:getStatus()).to.equal(a.Status.Rejected)
    			expect(h._values[1]).to.equal(5)
    
    			expect(i).to.be.ok()
    			expect(i).never.to.equal(h)
    			expect(i:getStatus()).to.equal(a.Status.Resolved)
    			expect(#i._values).to.equal(0)
    		end)
    
    		it("should reject on error in callback", function()
    			local d = 0
    
    			local e = a.resolve(1):andThen(function()
    				d = d + 1
    				error("hahah")
    			end)
    
    			expect(e).to.be.ok()
    			expect(d).to.equal(1)
    			expect(e:getStatus()).to.equal(a.Status.Rejected)
    			expect(tostring(e._values[1]):find("hahah")).to.be.ok()
    
    			
    			expect(tostring(e._values[1]):find("init.spec")).to.be.ok()
    			expect(tostring(e._values[1]):find("runExecutor")).to.be.ok()
    		end)
    
    		it("should chain onto asynchronously resolved promises", function()
    			local d
    			local e
    			local f = 0
    			local g = 0
    
    			local h
    			local i = a.new(function(i)
    				h = i
    			end)
    
    			local j = i:andThen(function(...)
    				d = { ... }
    				e = select("#", ...)
    				f = f + 1
    			end, function()
    				g = g + 1
    			end)
    
    			expect(f).to.equal(0)
    			expect(g).to.equal(0)
    
    			h(6)
    
    			expect(g).to.equal(0)
    
    			expect(f).to.equal(1)
    			expect(e).to.equal(1)
    			expect(d[1]).to.equal(6)
    
    			expect(i).to.be.ok()
    			expect(i:getStatus()).to.equal(a.Status.Resolved)
    			expect(i._values[1]).to.equal(6)
    
    			expect(j).to.be.ok()
    			expect(j).never.to.equal(i)
    			expect(j:getStatus()).to.equal(a.Status.Resolved)
    			expect(#j._values).to.equal(0)
    		end)
    
    		it("should chain onto asynchronously rejected promises", function()
    			local d
    			local e
    			local f = 0
    			local g = 0
    
    			local h
    			local i = a.new(function(i, j)
    				h = j
    			end)
    
    			local j = i:andThen(function()
    				g = g + 1
    			end, function(...)
    				d = { ... }
    				e = select("#", ...)
    				f = f + 1
    			end)
    
    			expect(f).to.equal(0)
    			expect(g).to.equal(0)
    
    			h(6)
    
    			expect(g).to.equal(0)
    
    			expect(f).to.equal(1)
    			expect(e).to.equal(1)
    			expect(d[1]).to.equal(6)
    
    			expect(i).to.be.ok()
    			expect(i:getStatus()).to.equal(a.Status.Rejected)
    			expect(i._values[1]).to.equal(6)
    
    			expect(j).to.be.ok()
    			expect(j).never.to.equal(i)
    			expect(j:getStatus()).to.equal(a.Status.Resolved)
    			expect(#j._values).to.equal(0)
    		end)
    
    		it("should propagate errors through multiple levels", function()
    			local d, e, f
    			a.new(function(g, h)
    				h(1, 2, 3)
    			end):andThen(function() end):catch(function(g, h, i)
    				d, e, f = g, h, i
    			end)
    
    			expect(d).to.equal(1)
    			expect(e).to.equal(2)
    			expect(f).to.equal(3)
    		end)
    
    		
    		itSKIP("should not call queued callbacks from a cancelled sub-promise", function()
    			local d
    			local e = 0
    
    			local f = a.new(function(f)
    				d = f
    			end)
    
    			f:andThen(function()
    				e += 1
    			end)
    
    			f
    				:andThen(function()
    					e += 1
    				end)
    				:cancel()
    
    			d("foo")
    
    			expect(e).to.equal(1)
    		end)
    	end)
    
    	describe("Promise:cancel", function()
    		it("should mark promises as cancelled and not resolve or reject them", function()
    			local d = 0
    			local e = 0
    			local f = a.new(function() end)
    				:andThen(function()
    					d = d + 1
    				end)
    				:finally(function()
    					e = e + 1
    				end)
    
    			f:cancel()
    			f:cancel() 
    
    			expect(d).to.equal(0)
    			expect(e).to.equal(1)
    			expect(f:getStatus()).to.equal(a.Status.Cancelled)
    		end)
    
    		it("should call the cancellation hook once", function()
    			local d = 0
    
    			local e = a.new(function(e, f, g)
    				g(function()
    					d = d + 1
    				end)
    			end)
    
    			e:cancel()
    			e:cancel() 
    
    			expect(d).to.equal(1)
    		end)
    
    		it("should propagate cancellations", function()
    			local d = a.new(function() end)
    
    			local e = d:andThen()
    			local f = d:andThen()
    
    			expect(d:getStatus()).to.equal(a.Status.Started)
    			expect(e:getStatus()).to.equal(a.Status.Started)
    			expect(f:getStatus()).to.equal(a.Status.Started)
    
    			e:cancel()
    
    			expect(d:getStatus()).to.equal(a.Status.Started)
    			expect(e:getStatus()).to.equal(a.Status.Cancelled)
    			expect(f:getStatus()).to.equal(a.Status.Started)
    
    			f:cancel()
    
    			expect(d:getStatus()).to.equal(a.Status.Cancelled)
    			expect(e:getStatus()).to.equal(a.Status.Cancelled)
    			expect(f:getStatus()).to.equal(a.Status.Cancelled)
    		end)
    
    		it("should affect downstream promises", function()
    			local d = a.new(function() end)
    			local e = d:andThen()
    
    			d:cancel()
    
    			expect(e:getStatus()).to.equal(a.Status.Cancelled)
    		end)
    
    		it("should track consumers", function()
    			local d = a.new(function() end)
    			local e = a.resolve()
    			local f = e:andThen(function()
    				return d
    			end)
    			local g = a.new(function(g)
    				g(f)
    			end)
    			local h = g:andThen(function() end)
    
    			expect(f._parent).to.never.equal(e)
    			expect(g._parent).to.never.equal(f)
    			expect(g._consumers[h]).to.be.ok()
    			expect(h._parent).to.equal(g)
    		end)
    
    		it("should cancel resolved pending promises", function()
    			local d = a.new(function() end)
    
    			local e = a.new(function(e)
    				e(d)
    			end):finally(function() end)
    
    			e:cancel()
    
    			expect(d._status).to.equal(a.Status.Cancelled)
    			expect(e._status).to.equal(a.Status.Cancelled)
    		end)
    
    		it("should close the promise thread", function()
    			local d = 0
    			local e = a.new(function()
    				d += 1
    				a.delay(1):await()
    				d += 1
    			end)
    
    			e:cancel()
    			c(2)
    
    			expect(d).to.equal(1)
    		end)
    	end)
    
    	describe("Promise:finally", function()
    		it("should be called upon resolve, reject, or cancel", function()
    			local d = 0
    
    			local function finally()
    				d = d + 1
    			end
    
    			
    			a.new(function(e, f)
    				e()
    			end):finally(finally)
    
    			
    			a.resolve():andThen(function() end):finally(finally):finally(finally)
    
    			
    			a.reject():finally(finally)
    
    			local e = a.new(function() end):finally(finally)
    			e:cancel()
    
    			expect(d).to.equal(5)
    		end)
    
    		
    		itSKIP("should not forward return values", function()
    			local d
    
    			a.resolve(2)
    				:finally(function()
    					return 1
    				end)
    				:andThen(function(e)
    					d = e
    				end)
    
    			expect(d).to.equal(2)
    		end)
    
    		
    		itSKIP("should not consume rejections", function()
    			local d = false
    			local e = false
    			a.reject(5)
    				:finally(function()
    					return 42
    				end)
    				:andThen(function()
    					e = true
    				end)
    				:catch(function(f)
    					d = true
    					expect(f).to.equal(5)
    				end)
    
    			expect(d).to.equal(true)
    			expect(e).to.equal(false)
    		end)
    
    		
    		itSKIP("should wait for returned promises", function()
    			local d
    			local e = a.reject("foo"):finally(function()
    				return a.new(function(e)
    					d = e
    				end)
    			end)
    
    			expect(e:getStatus()).to.equal(a.Status.Started)
    
    			d()
    
    			expect(e:getStatus()).to.equal(a.Status.Rejected)
    			local f, g = e:_unwrap()
    			expect(g).to.equal("foo")
    		end)
    
    		it("should reject with a returned rejected promise's value", function()
    			local d
    			local e = a.reject("foo"):finally(function()
    				return a.new(function(e, f)
    					d = f
    				end)
    			end)
    
    			expect(e:getStatus()).to.equal(a.Status.Started)
    
    			d("bar")
    
    			expect(e:getStatus()).to.equal(a.Status.Rejected)
    			local f, g = e:_unwrap()
    			expect(g).to.equal("bar")
    		end)
    
    		it("should reject when handler errors", function()
    			local d = {}
    			local e = a.reject("bar"):finally(function()
    				error(d)
    			end)
    
    			local f, g = e:_unwrap()
    
    			expect(f).to.equal(false)
    			expect(g).to.equal(d)
    		end)
    
    		
    		itSKIP("should not prevent cancellation", function()
    			local d = a.new(function() end)
    
    			local e = false
    			d:finally(function()
    				e = true
    			end)
    
    			local f = d:andThen(function() end)
    
    			f:cancel()
    
    			expect(d:getStatus()).to.equal(a.Status.Cancelled)
    			expect(e).to.equal(true)
    		end)
    
    		it("should propagate cancellation downwards", function()
    			local d = false
    			local e = false
    			local f = a.new(function() end)
    
    			local g = f:finally(function()
    				d = true
    			end)
    
    			f:cancel()
    
    			expect(f:getStatus()).to.equal(a.Status.Cancelled)
    			expect(g:getStatus()).to.equal(a.Status.Cancelled)
    
    			expect(d).to.equal(true)
    			expect(e).to.equal(false)
    		end)
    
    		it("should propagate cancellation upwards", function()
    			local d = false
    			local e = false
    			local f = a.new(function() end)
    
    			local g = f:finally(function()
    				d = true
    			end)
    
    			g:cancel()
    
    			expect(f:getStatus()).to.equal(a.Status.Cancelled)
    			expect(g:getStatus()).to.equal(a.Status.Cancelled)
    
    			expect(d).to.equal(true)
    			expect(e).to.equal(false)
    		end)
    
    		it("should cancel returned promise if cancelled", function()
    			local d = a.new(function() end)
    
    			local e = a.resolve():finally(function()
    				return d
    			end)
    
    			e:cancel()
    
    			expect(d:getStatus()).to.equal(a.Status.Cancelled)
    		end)
    	end)
    
    	describe("Promise.all", function()
    		it("should error if given something other than a table", function()
    			expect(function()
    				a.all(1)
    			end).to.throw()
    		end)
    
    		it("should resolve instantly with an empty table if given no promises", function()
    			local d = a.all({})
    			local e, f = d:_unwrap()
    
    			expect(e).to.equal(true)
    			expect(d:getStatus()).to.equal(a.Status.Resolved)
    			expect(f).to.be.a("table")
    			expect(next(f)).to.equal(nil)
    		end)
    
    		it("should error if given non-promise values", function()
    			expect(function()
    				a.all({ {}, {}, {} })
    			end).to.throw()
    		end)
    
    		it("should wait for all promises to be resolved and return their values", function()
    			local d = {}
    
    			local e, f = pack(1, "A string", nil, false)
    
    			local g = {}
    
    			for h = 1, e do
    				g[h] = a.new(function(i)
    					d[h] = { i, f[h] }
    				end)
    			end
    
    			local h = a.all(g)
    
    			for i, j in ipairs(d) do
    				expect(h:getStatus()).to.equal(a.Status.Started)
    				j[1](j[2])
    			end
    
    			local i, j = pack(h:_unwrap())
    			local k, l = unpack(j, 1, i)
    
    			expect(i).to.equal(2)
    			expect(k).to.equal(true)
    			expect(l).to.be.a("table")
    			expect(#l).to.equal(#g)
    
    			for m = 1, e do
    				expect(l[m]).to.equal(f[m])
    			end
    		end)
    
    		it("should reject if any individual promise rejected", function()
    			local d
    			local e
    
    			local f = a.new(function(f, g)
    				d = g
    			end)
    
    			local g = a.new(function(g)
    				e = g
    			end)
    
    			local h = a.all({ f, g })
    
    			expect(h:getStatus()).to.equal(a.Status.Started)
    
    			d("baz", "qux")
    			e("foo", "bar")
    
    			local i, j = pack(h:_unwrap())
    			local k, l, m = unpack(j, 1, i)
    
    			expect(i).to.equal(3)
    			expect(k).to.equal(false)
    			expect(l).to.equal("baz")
    			expect(m).to.equal("qux")
    			expect(g:getStatus()).to.equal(a.Status.Cancelled)
    		end)
    
    		it("should not resolve if resolved after rejecting", function()
    			local d
    			local e
    
    			local f = a.new(function(f, g)
    				d = g
    			end)
    
    			local g = a.new(function(g)
    				e = g
    			end)
    
    			local h = a.all({ f, g })
    
    			expect(h:getStatus()).to.equal(a.Status.Started)
    
    			d("baz", "qux")
    			e("foo", "bar")
    
    			local i, j = pack(h:_unwrap())
    			local k, l, m = unpack(j, 1, i)
    
    			expect(i).to.equal(3)
    			expect(k).to.equal(false)
    			expect(l).to.equal("baz")
    			expect(m).to.equal("qux")
    		end)
    
    		it("should only reject once", function()
    			local d
    			local e
    
    			local f = a.new(function(f, g)
    				d = g
    			end)
    
    			local g = a.new(function(g, h)
    				e = h
    			end)
    
    			local h = a.all({ f, g })
    
    			expect(h:getStatus()).to.equal(a.Status.Started)
    
    			d("foo", "bar")
    
    			expect(h:getStatus()).to.equal(a.Status.Rejected)
    
    			e("baz", "qux")
    
    			local i, j = pack(h:_unwrap())
    			local k, l, m = unpack(j, 1, i)
    
    			expect(i).to.equal(3)
    			expect(k).to.equal(false)
    			expect(l).to.equal("foo")
    			expect(m).to.equal("bar")
    		end)
    
    		
    		itSKIP("should error if a non-array table is passed in", function()
    			local d, e = pcall(function()
    				a.all(a.new(function() end))
    			end)
    
    			expect(d).to.be.ok()
    			expect(e:find("Non%-promise")).to.be.ok()
    		end)
    
    		it("should cancel pending promises if one rejects", function()
    			local d = a.new(function() end)
    			expect(a.all({
    				a.resolve(),
    				a.reject(),
    				d,
    			}):getStatus()).to.equal(a.Status.Rejected)
    			expect(d:getStatus()).to.equal(a.Status.Cancelled)
    		end)
    
    		it("should cancel promises if it is cancelled", function()
    			local d = a.new(function() end)
    			d:andThen(function() end)
    
    			local e = {
    				a.new(function() end),
    				a.new(function() end),
    				d,
    			}
    
    			a.all(e):cancel()
    
    			expect(e[1]:getStatus()).to.equal(a.Status.Cancelled)
    			expect(e[2]:getStatus()).to.equal(a.Status.Cancelled)
    			expect(e[3]:getStatus()).to.equal(a.Status.Started)
    		end)
    	end)
    
    	describe("Promise.fold", function()
    		it("should return the initial value in a promise when the list is empty", function()
    			local d = {}
    			local e = a.fold({}, function()
    				error("should not be called")
    			end, d)
    
    			expect(a.is(e)).to.equal(true)
    			expect(e:getStatus()).to.equal(a.Status.Resolved)
    			expect(e:expect()).to.equal(d)
    		end)
    
    		it("should accept promises in the list", function()
    			local d
    
    			local e = a.fold({ a.new(function(e)
    				d = e
    			end), 2, 3 }, function(e, f)
    				return e + f
    			end, 0)
    
    			d(1)
    
    			expect(a.is(e)).to.equal(true)
    			expect(e:getStatus()).to.equal(a.Status.Resolved)
    			expect(e:expect()).to.equal(6)
    		end)
    
    		it("should always return a promise even if the list or reducer don't use them", function()
    			local d = a.fold({ 1, 2, 3 }, function(d, e, f)
    				if f == 2 then
    					return a.delay(1):andThenReturn(d + e)
    				else
    					return d + e
    				end
    			end, 0)
    			expect(a.is(d)).to.equal(true)
    			expect(d:getStatus()).to.equal(a.Status.Started)
    			c(2)
    			expect(d:getStatus()).to.equal(a.Status.Resolved)
    			expect(d:expect()).to.equal(6)
    		end)
    
    		it("should return the first rejected promise", function()
    			local d = "foo"
    			local e = a.fold({ 1, 2, 3 }, function(e, f, g)
    				if g == 2 then
    					return a.reject(d)
    				else
    					return e + f
    				end
    			end, 0)
    			expect(a.is(e)).to.equal(true)
    			local f, g = e:awaitStatus()
    			expect(f).to.equal(a.Status.Rejected)
    			expect(g).to.equal(d)
    		end)
    
    		it("should return the first canceled promise", function()
    			local d
    			local e = a.fold({ 1, 2, 3 }, function(e, f, g)
    				if g == 1 then
    					return e + f
    				elseif g == 2 then
    					d = a.delay(1):andThenReturn(e + f)
    					return d
    				else
    					error("this should not run if the promise is cancelled")
    				end
    			end, 0)
    			expect(a.is(e)).to.equal(true)
    			expect(e:getStatus()).to.equal(a.Status.Started)
    			d:cancel()
    			expect(e:getStatus()).to.equal(a.Status.Cancelled)
    		end)
    	end)
    
    	describe("Promise.race", function()
    		it("should resolve with the first settled value", function()
    			local d = a.race({
    				a.resolve(1),
    				a.resolve(2),
    			}):andThen(function(d)
    				expect(d).to.equal(1)
    			end)
    
    			expect(d:getStatus()).to.equal(a.Status.Resolved)
    		end)
    
    		it("should cancel other promises", function()
    			local d = a.new(function() end)
    			d:andThen(function() end)
    			local e = {
    				d,
    				a.new(function() end),
    				a.new(function(e)
    					e(2)
    				end),
    			}
    
    			local f = a.race(e)
    
    			expect(f:getStatus()).to.equal(a.Status.Resolved)
    			expect(f._values[1]).to.equal(2)
    			expect(e[1]:getStatus()).to.equal(a.Status.Started)
    			expect(e[2]:getStatus()).to.equal(a.Status.Cancelled)
    			expect(e[3]:getStatus()).to.equal(a.Status.Resolved)
    
    			local g = a.new(function() end)
    			expect(a.race({
    				a.reject(),
    				a.resolve(),
    				g,
    			}):getStatus()).to.equal(a.Status.Rejected)
    			expect(g:getStatus()).to.equal(a.Status.Cancelled)
    		end)
    
    		it("should error if a non-array table is passed in", function()
    			local e, f = pcall(function()
    				a.race(a.new(function() end))
    			end)
    
    			expect(e).to.be.ok()
    			expect(f:find("Non%-promise")).to.be.ok()
    		end)
    
    		it("should cancel promises if it is cancelled", function()
    			local e = a.new(function() end)
    			e:andThen(function() end)
    
    			local f = {
    				a.new(function() end),
    				a.new(function() end),
    				e,
    			}
    
    			a.race(f):cancel()
    
    			expect(f[1]:getStatus()).to.equal(a.Status.Cancelled)
    			expect(f[2]:getStatus()).to.equal(a.Status.Cancelled)
    			expect(f[3]:getStatus()).to.equal(a.Status.Started)
    		end)
    	end)
    
    	describe("Promise.promisify", function()
    		it("should wrap functions", function()
    			local function test(e)
    				return e + 1
    			end
    
    			local e = a.promisify(test)
    			local f = e(1)
    			local g, h = f:_unwrap()
    
    			expect(g).to.equal(true)
    			expect(f:getStatus()).to.equal(a.Status.Resolved)
    			expect(h).to.equal(2)
    		end)
    
    		it("should catch errors after a yield", function()
    			local e = Instance.new("BindableEvent")
    			local f = a.promisify(function()
    				e.Event:Wait()
    				error("errortext")
    			end)
    
    			local g = f()
    
    			expect(g:getStatus()).to.equal(a.Status.Started)
    			e:Fire()
    			waitForEvents()
    			expect(g:getStatus()).to.equal(a.Status.Rejected)
    			expect(tostring(g._values[1]):find("errortext")).to.be.ok()
    		end)
    	end)
    
    	describe("Promise.tap", function()
    		it("should thread through values", function()
    			local e, f
    
    			a.resolve(1)
    				:andThen(function(g)
    					return g + 1
    				end)
    				:tap(function(g)
    					e = g
    					return g + 1
    				end)
    				:andThen(function(g)
    					f = g
    				end)
    
    			expect(e).to.equal(2)
    			expect(f).to.equal(2)
    		end)
    
    		it("should chain onto promises", function()
    			local e, f
    
    			local g = a.resolve(1)
    				:tap(function()
    					return a.new(function(g)
    						e = g
    					end)
    				end)
    				:andThen(function(g)
    					f = g
    				end)
    
    			expect(g:getStatus()).to.equal(a.Status.Started)
    			expect(f).to.never.be.ok()
    
    			e(1)
    
    			expect(g:getStatus()).to.equal(a.Status.Resolved)
    			expect(f).to.equal(1)
    		end)
    	end)
    
    	describe("Promise.try", function()
    		it("should catch synchronous errors", function()
    			local e
    			a.try(function()
    				error("errortext")
    			end):catch(function(f)
    				e = tostring(f)
    			end)
    
    			expect(e:find("errortext")).to.be.ok()
    		end)
    
    		it("should reject with error objects", function()
    			local e = {}
    			local f, g = a.try(function()
    				error(e)
    			end):_unwrap()
    
    			expect(f).to.equal(false)
    			expect(g).to.equal(e)
    		end)
    
    		it("should catch asynchronous errors", function()
    			local e = Instance.new("BindableEvent")
    			local f = a.try(function()
    				e.Event:Wait()
    				error("errortext")
    			end)
    
    			expect(f:getStatus()).to.equal(a.Status.Started)
    			e:Fire()
    			waitForEvents()
    			expect(f:getStatus()).to.equal(a.Status.Rejected)
    			expect(tostring(f._values[1]):find("errortext")).to.be.ok()
    		end)
    	end)
    
    	describe("Promise:andThenReturn", function()
    		it("should return the given values", function()
    			local e, f
    
    			a.resolve():andThenReturn(1, 2):andThen(function(g, h)
    				e = g
    				f = h
    			end)
    
    			expect(e).to.equal(1)
    			expect(f).to.equal(2)
    		end)
    	end)
    
    	describe("Promise:doneReturn", function()
    		it("should return the given values", function()
    			local e, f
    
    			a.resolve():doneReturn(1, 2):andThen(function(g, h)
    				e = g
    				f = h
    			end)
    
    			expect(e).to.equal(1)
    			expect(f).to.equal(2)
    		end)
    	end)
    
    	describe("Promise:andThenCall", function()
    		it("should call the given function with arguments", function()
    			local e, f
    			a.resolve():andThenCall(function(g, h)
    				e = g
    				f = h
    			end, 3, 4)
    
    			expect(e).to.equal(3)
    			expect(f).to.equal(4)
    		end)
    	end)
    
    	describe("Promise:andThenAsync", function()
    		it("should allow yielding", function()
    			local e = Instance.new("BindableEvent")
    			local f = a.fromEvent(e.Event):andThenAsync(function()
    				return 5
    			end)
    			expect(f:getStatus()).to.equal(a.Status.Started)
    			e:Fire()
    
    			expect(f:getStatus()).to.equal(a.Status.Started)
    
    			c()
    
    			expect(f:getStatus()).to.equal(a.Status.Resolved)
    			expect(f._values[1]).to.equal(5)
    		end)
    
    		it("should run andThenAsync on a new thread", function()
    			local e = Instance.new("BindableEvent")
    
    			local f
    			local g = a.new(function(g)
    				f = g
    			end)
    
    			local h = g:andThenAsync(function()
    				e.Event:Wait()
    				return 5
    			end)
    
    			local i = g:andThenAsync(function()
    				return "foo"
    			end)
    
    			expect(g:getStatus()).to.equal(a.Status.Started)
    			f()
    
    			expect(i:getStatus()).to.equal(a.Status.Started)
    			expect(h:getStatus()).to.equal(a.Status.Started)
    
    			c()
    
    			expect(i:getStatus()).to.equal(a.Status.Resolved)
    			expect(i._values[1]).to.equal("foo")
    			expect(h:getStatus()).to.equal(a.Status.Started)
    		end)
    
    		it("should chain onto resolved promises", function()
    			local e
    			local f
    			local g = 0
    			local h = 0
    
    			local i = a.resolve(5)
    
    			local j = i:andThenAsync(function(...)
    				f, e = pack(...)
    				g = g + 1
    			end, function()
    				h = h + 1
    			end)
    
    			expect(h).to.equal(0)
    			expect(g).to.equal(0)
    
    			expect(j).to.be.ok()
    			expect(j).never.to.equal(i)
    			expect(j:getStatus()).to.equal(a.Status.Started)
    
    			expect(i).to.be.ok()
    			expect(i:getStatus()).to.equal(a.Status.Resolved)
    			expect(i._values[1]).to.equal(5)
    
    			c()
    
    			expect(g).to.equal(1)
    			expect(f).to.equal(1)
    			expect(e[1]).to.equal(5)
    
    			expect(j:getStatus()).to.equal(a.Status.Resolved)
    			expect(#j._values).to.equal(0)
    		end)
    
    		it("should chain onto rejected promises", function()
    			local e
    			local f
    			local g = 0
    			local h = 0
    
    			local i = a.reject(5)
    
    			local j = i:andThenAsync(function(...)
    				h = h + 1
    			end, function(...)
    				f, e = pack(...)
    				g = g + 1
    			end)
    
    			expect(h).to.equal(0)
    			expect(g).to.equal(0)
    
    			expect(i).to.be.ok()
    			expect(i:getStatus()).to.equal(a.Status.Rejected)
    			expect(i._values[1]).to.equal(5)
    
    			expect(j).to.be.ok()
    			expect(j).never.to.equal(i)
    			expect(j:getStatus()).to.equal(a.Status.Started)
    
    			c()
    
    			expect(g).to.equal(1)
    			expect(f).to.equal(1)
    			expect(e[1]).to.equal(5)
    
    			expect(j:getStatus()).to.equal(a.Status.Resolved)
    
    			expect(#j._values).to.equal(0)
    		end)
    
    		it("should reject on error in callback", function()
    			local e = 0
    
    			local f = a.resolve(1):andThenAsync(function()
    				e = e + 1
    				error("hahah")
    			end)
    
    			expect(f).to.be.ok()
    			expect(f:getStatus()).to.equal(a.Status.Started)
    			expect(e).to.equal(0)
    
    			c()
    
    			expect(e).to.equal(1)
    			expect(f:getStatus()).to.equal(a.Status.Rejected)
    			expect(tostring(f._values[1]):find("hahah")).to.be.ok()
    
    			
    			expect(tostring(f._values[1]):find("init.spec")).to.be.ok()
    			expect(tostring(f._values[1]):find("runExecutor")).to.be.ok()
    		end)
    
    		it("should chain onto asynchronously resolved promises", function()
    			local e
    			local f
    			local g = 0
    			local h = 0
    
    			local i
    			local j = a.new(function(j)
    				i = j
    			end)
    
    			local k = j:andThenAsync(function(...)
    				e = { ... }
    				f = select("#", ...)
    				g = g + 1
    			end, function()
    				h = h + 1
    			end)
    
    			expect(g).to.equal(0)
    			expect(h).to.equal(0)
    
    			i(6)
    
    			expect(g).to.equal(0)
    			expect(h).to.equal(0)
    
    			expect(j).to.be.ok()
    			expect(j:getStatus()).to.equal(a.Status.Resolved)
    
    			expect(k).to.be.ok()
    			expect(k).never.to.equal(j)
    			expect(k:getStatus()).to.equal(a.Status.Started)
    
    			c()
    
    			expect(h).to.equal(0)
    
    			expect(g).to.equal(1)
    			expect(f).to.equal(1)
    			expect(e[1]).to.equal(6)
    
    			expect(j:getStatus()).to.equal(a.Status.Resolved)
    			expect(j._values[1]).to.equal(6)
    
    			expect(k:getStatus()).to.equal(a.Status.Resolved)
    			expect(#k._values).to.equal(0)
    		end)
    
    		it("should chain onto asynchronously rejected promises", function()
    			local e
    			local f
    			local g = 0
    			local h = 0
    
    			local i
    			local j = a.new(function(j, k)
    				i = k
    			end)
    
    			local k = j:andThenAsync(function()
    				h = h + 1
    			end, function(...)
    				e = { ... }
    				f = select("#", ...)
    				g = g + 1
    			end)
    
    			expect(g).to.equal(0)
    			expect(h).to.equal(0)
    
    			i(6)
    
    			expect(g).to.equal(0)
    			expect(h).to.equal(0)
    
    			expect(j).to.be.ok()
    			expect(j:getStatus()).to.equal(a.Status.Rejected)
    
    			expect(k).to.be.ok()
    			expect(k).never.to.equal(j)
    			expect(k:getStatus()).to.equal(a.Status.Started)
    
    			c()
    
    			expect(h).to.equal(0)
    
    			expect(g).to.equal(1)
    			expect(f).to.equal(1)
    			expect(e[1]).to.equal(6)
    
    			expect(k:getStatus()).to.equal(a.Status.Resolved)
    			expect(j._values[1]).to.equal(6)
    			expect(#k._values).to.equal(0)
    		end)
    
    		it("should propagate errors through multiple levels", function()
    			local e, f, g
    			a.new(function(h, i)
    				i(1, 2, 3)
    			end):andThenAsync(function() end):catch(function(h, i, j)
    				e, f, g = h, i, j
    			end)
    
    			expect(e).to.equal(nil)
    			expect(f).to.equal(nil)
    			expect(g).to.equal(nil)
    
    			c()
    
    			expect(e).to.equal(1)
    			expect(f).to.equal(2)
    			expect(g).to.equal(3)
    		end)
    
    		it("should propagate errors asynchronously through multiple levels", function()
    			local e, f, g
    
    			local function handleErrors(h, i, j)
    				e, f, g = h, i, j
    				return a.reject(h * 10, i * 10, j * 10)
    			end
    			a.new(function(h, i)
    				i(1, 2, 3)
    			end)
    				:andThenAsync(function() end, handleErrors)
    				:andThenAsync(function() end, handleErrors)
    				:andThenAsync(function() end, handleErrors)
    				:catch(function(h, i, j)
    					e, f, g = "caught " .. tostring(h), "caught " .. tostring(i), "caught " .. tostring(j)
    				end)
    
    			expect(e).to.equal(nil)
    			expect(f).to.equal(nil)
    			expect(g).to.equal(nil)
    
    			c()
    
    			expect(e).to.equal(1)
    			expect(f).to.equal(2)
    			expect(g).to.equal(3)
    
    			c()
    
    			expect(e).to.equal(10)
    			expect(f).to.equal(20)
    			expect(g).to.equal(30)
    
    			c()
    
    			
    			expect(e).to.equal("caught 1000")
    			expect(f).to.equal("caught 2000")
    			expect(g).to.equal("caught 3000")
    		end)
    
    		it("should NOT propagate errors if error handler is provided", function()
    			local e, f, g
    			a.new(function(h, i)
    				i(1, 2, 3)
    			end):andThenAsync(function() end, function() end):catch(function(h, i, j)
    				e, f, g = h, i, j
    			end)
    
    			expect(e).to.equal(nil)
    			expect(f).to.equal(nil)
    			expect(g).to.equal(nil)
    
    			c()
    
    			expect(e).to.equal(nil)
    			expect(f).to.equal(nil)
    			expect(g).to.equal(nil)
    		end)
    	end)
    
    	describe("Promise:doneCall", function()
    		it("should call the given function with arguments", function()
    			local e, f
    			a.resolve():doneCall(function(g, h)
    				e = g
    				f = h
    			end, 3, 4)
    
    			expect(e).to.equal(3)
    			expect(f).to.equal(4)
    		end)
    	end)
    
    	describe("Promise:done", function()
    		it("should trigger on resolve or cancel", function()
    			local e = a.new(function() end)
    			local f
    
    			local g = e:done(function()
    				f = true
    			end)
    
    			expect(f).to.never.be.ok()
    			e:cancel()
    			expect(g:getStatus()).to.equal(a.Status.Cancelled)
    			expect(f).to.equal(true)
    
    			local h, i
    			a.reject():done(function()
    				h = true
    			end):finally(function()
    				i = true
    			end)
    
    			expect(h).to.never.be.ok()
    			expect(i).to.be.ok()
    		end)
    	end)
    
    	describe("Promise.some", function()
    		it("should resolve once the goal is reached", function()
    			local e = a.some({
    				a.resolve(1),
    				a.reject(),
    				a.resolve(2),
    			}, 2)
    			expect(e:getStatus()).to.equal(a.Status.Resolved)
    			expect(e._values[1][1]).to.equal(1)
    			expect(e._values[1][2]).to.equal(2)
    		end)
    
    		it("should error if the goal can't be reached", function()
    			expect(a.some({
    				a.resolve(),
    				a.reject(),
    			}, 2):getStatus()).to.equal(a.Status.Rejected)
    
    			local e
    			local f = a.some({
    				a.resolve(),
    				a.new(function(f, g)
    					e = g
    				end),
    			}, 2)
    
    			expect(f:getStatus()).to.equal(a.Status.Started)
    			e("foo")
    			expect(f:getStatus()).to.equal(a.Status.Rejected)
    			expect(f._values[1]).to.equal("foo")
    		end)
    
    		it("should cancel pending Promises once the goal is reached", function()
    			local e
    			local f = a.new(function() end)
    			local g = a.new(function(g)
    				e = g
    			end)
    
    			local h = a.some({
    				f,
    				g,
    				a.resolve(),
    			}, 2)
    
    			expect(h:getStatus()).to.equal(a.Status.Started)
    			expect(f:getStatus()).to.equal(a.Status.Started)
    			expect(g:getStatus()).to.equal(a.Status.Started)
    
    			e()
    
    			expect(h:getStatus()).to.equal(a.Status.Resolved)
    			expect(f:getStatus()).to.equal(a.Status.Cancelled)
    			expect(g:getStatus()).to.equal(a.Status.Resolved)
    		end)
    
    		it("should error if passed a non-number", function()
    			expect(function()
    				a.some({}, "non-number")
    			end).to.throw()
    		end)
    
    		it("should return an empty array if amount is 0", function()
    			local e = a.some({
    				a.resolve(2),
    			}, 0)
    
    			expect(e:getStatus()).to.equal(a.Status.Resolved)
    			expect(#e._values[1]).to.equal(0)
    		end)
    
    		it("should not return extra values", function()
    			local e = a.some({
    				a.resolve(1),
    				a.resolve(2),
    				a.resolve(3),
    				a.resolve(4),
    			}, 2)
    
    			expect(e:getStatus()).to.equal(a.Status.Resolved)
    			expect(#e._values[1]).to.equal(2)
    			expect(e._values[1][1]).to.equal(1)
    			expect(e._values[1][2]).to.equal(2)
    		end)
    
    		it("should cancel promises if it is cancelled", function()
    			local e = a.new(function() end)
    			e:andThen(function() end)
    
    			local f = {
    				a.new(function() end),
    				a.new(function() end),
    				e,
    			}
    
    			a.some(f, 3):cancel()
    
    			expect(f[1]:getStatus()).to.equal(a.Status.Cancelled)
    			expect(f[2]:getStatus()).to.equal(a.Status.Cancelled)
    			expect(f[3]:getStatus()).to.equal(a.Status.Started)
    		end)
    
    		describe("Promise.any", function()
    			it("should return the value directly", function()
    				local e = a.any({
    					a.reject(),
    					a.reject(),
    					a.resolve(1),
    				})
    
    				expect(e:getStatus()).to.equal(a.Status.Resolved)
    				expect(e._values[1]).to.equal(1)
    			end)
    
    			it("should error if all are rejected", function()
    				expect(a.any({
    					a.reject(),
    					a.reject(),
    					a.reject(),
    				}):getStatus()).to.equal(a.Status.Rejected)
    			end)
    		end)
    	end)
    
    	describe("Promise.allSettled", function()
    		it("should resolve with an array of PromiseStatuses", function()
    			local e
    			local f = a.allSettled({
    				a.resolve(),
    				a.reject(),
    				a.resolve(),
    				a.new(function(f, g)
    					e = g
    				end),
    			})
    
    			expect(f:getStatus()).to.equal(a.Status.Started)
    			e()
    			expect(f:getStatus()).to.equal(a.Status.Resolved)
    			expect(f._values[1][1]).to.equal(a.Status.Resolved)
    			expect(f._values[1][2]).to.equal(a.Status.Rejected)
    			expect(f._values[1][3]).to.equal(a.Status.Resolved)
    			expect(f._values[1][4]).to.equal(a.Status.Rejected)
    		end)
    
    		it("should cancel promises if it is cancelled", function()
    			local e = a.new(function() end)
    			e:andThen(function() end)
    
    			local f = {
    				a.new(function() end),
    				a.new(function() end),
    				e,
    			}
    
    			a.allSettled(f):cancel()
    
    			expect(f[1]:getStatus()).to.equal(a.Status.Cancelled)
    			expect(f[2]:getStatus()).to.equal(a.Status.Cancelled)
    			expect(f[3]:getStatus()).to.equal(a.Status.Started)
    		end)
    	end)
    
    	describe("Promise:await", function()
    		it("should return the correct values", function()
    			local e = a.resolve(5, 6, nil, 7)
    
    			local f, g, h, i, j = e:await()
    
    			expect(f).to.equal(true)
    			expect(g).to.equal(5)
    			expect(h).to.equal(6)
    			expect(i).to.equal(nil)
    			expect(j).to.equal(7)
    		end)
    
    		it("should work if yielding is needed", function()
    			local e = false
    			task.spawn(function()
    				local f, g = a.delay(1):await()
    				expect(type(g)).to.equal("number")
    				e = true
    			end)
    
    			c(2)
    			expect(e).to.equal(true)
    		end)
    	end)
    
    	describe("Promise:expect", function()
    		it("should throw the correct values", function()
    			local e = {}
    			local f = a.reject(e)
    
    			local g, h = pcall(function()
    				f:expect()
    			end)
    
    			expect(g).to.equal(false)
    			expect(h).to.equal(e)
    		end)
    	end)
    
    	describe("Promise:now", function()
    		it("should resolve if the Promise is resolved", function()
    			local e, f = a.resolve("foo"):now():_unwrap()
    
    			expect(e).to.equal(true)
    			expect(f).to.equal("foo")
    		end)
    
    		it("should reject if the Promise is not resolved", function()
    			local e, f = a.new(function() end):now():_unwrap()
    
    			expect(e).to.equal(false)
    			expect(a.Error.isKind(f, "NotResolvedInTime")).to.equal(true)
    		end)
    
    		it("should reject with a custom rejection value", function()
    			local e, f = a.new(function() end):now("foo"):_unwrap()
    
    			expect(e).to.equal(false)
    			expect(f).to.equal("foo")
    		end)
    	end)
    
    	describe("Promise.each", function()
    		it("should iterate", function()
    			local e, f = a.each({
    				"foo",
    				"bar",
    				"baz",
    				"qux",
    			}, function(...)
    				return { ... }
    			end):_unwrap()
    
    			expect(e).to.equal(true)
    			expect(f[1][1]).to.equal("foo")
    			expect(f[1][2]).to.equal(1)
    			expect(f[2][1]).to.equal("bar")
    			expect(f[2][2]).to.equal(2)
    			expect(f[3][1]).to.equal("baz")
    			expect(f[3][2]).to.equal(3)
    			expect(f[4][1]).to.equal("qux")
    			expect(f[4][2]).to.equal(4)
    		end)
    
    		it("should iterate serially", function()
    			local e = {}
    			local f = {}
    
    			local g = a.each({
    				"foo",
    				"bar",
    				"baz",
    			}, function(g, h)
    				f[h] = (f[h] or 0) + 1
    
    				return a.new(function(i)
    					table.insert(e, function()
    						i(g:upper())
    					end)
    				end)
    			end)
    
    			expect(g:getStatus()).to.equal(a.Status.Started)
    			expect(#e).to.equal(1)
    			expect(f[1]).to.equal(1)
    			expect(f[2]).to.never.be.ok()
    
    			table.remove(e, 1)()
    
    			expect(g:getStatus()).to.equal(a.Status.Started)
    			expect(#e).to.equal(1)
    			expect(f[1]).to.equal(1)
    			expect(f[2]).to.equal(1)
    			expect(f[3]).to.never.be.ok()
    
    			table.remove(e, 1)()
    
    			expect(g:getStatus()).to.equal(a.Status.Started)
    			expect(f[1]).to.equal(1)
    			expect(f[2]).to.equal(1)
    			expect(f[3]).to.equal(1)
    
    			table.remove(e, 1)()
    
    			expect(g:getStatus()).to.equal(a.Status.Resolved)
    			expect(type(g._values[1])).to.equal("table")
    			expect(type(g._values[2])).to.equal("nil")
    
    			local h = g._values[1]
    
    			expect(h[1]).to.equal("FOO")
    			expect(h[2]).to.equal("BAR")
    			expect(h[3]).to.equal("BAZ")
    		end)
    
    		it("should reject with the value if the predicate promise rejects", function()
    			local e = a.each({ 1, 2, 3 }, function()
    				return a.reject("foobar")
    			end)
    
    			expect(e:getStatus()).to.equal(a.Status.Rejected)
    			expect(e._values[1]).to.equal("foobar")
    		end)
    
    		it("should allow Promises to be in the list and wait when it gets to them", function()
    			local e
    			local f = a.new(function(f)
    				e = f
    			end)
    
    			local g = a.each({
    				f,
    			}, function(g)
    				return g * 2
    			end)
    
    			expect(g:getStatus()).to.equal(a.Status.Started)
    
    			e(2)
    
    			expect(g:getStatus()).to.equal(a.Status.Resolved)
    			expect(g._values[1][1]).to.equal(4)
    		end)
    
    		it("should reject with the value if a Promise from the list rejects", function()
    			local e = false
    			local f = a.each({ 1, 2, a.reject("foobar") }, function(f)
    				e = true
    				return "never"
    			end)
    
    			expect(f:getStatus()).to.equal(a.Status.Rejected)
    			expect(f._values[1]).to.equal("foobar")
    			expect(e).to.equal(false)
    		end)
    
    		it("should reject immediately if there's a cancelled Promise in the list initially", function()
    			local e = a.new(function() end)
    			e:cancel()
    
    			local f = false
    			local g = a.each({ 1, 2, e }, function()
    				f = true
    			end)
    
    			expect(g:getStatus()).to.equal(a.Status.Rejected)
    			expect(f).to.equal(false)
    			expect(g._values[1].kind).to.equal(a.Error.Kind.AlreadyCancelled)
    		end)
    
    		it("should stop iteration if Promise.each is cancelled", function()
    			local e = {}
    
    			local f = a.each({
    				"foo",
    				"bar",
    				"baz",
    			}, function(f, g)
    				e[g] = (e[g] or 0) + 1
    
    				return a.new(function() end)
    			end)
    
    			expect(f:getStatus()).to.equal(a.Status.Started)
    			expect(e[1]).to.equal(1)
    			expect(e[2]).to.never.be.ok()
    
    			f:cancel()
    
    			expect(f:getStatus()).to.equal(a.Status.Cancelled)
    			expect(e[1]).to.equal(1)
    			expect(e[2]).to.never.be.ok()
    		end)
    
    		it("should cancel the Promise returned from the predicate if Promise.each is cancelled", function()
    			local e
    
    			local f = a.each({
    				"foo",
    				"bar",
    				"baz",
    			}, function(f, g)
    				e = a.new(function() end)
    				return e
    			end)
    
    			f:cancel()
    
    			expect(e:getStatus()).to.equal(a.Status.Cancelled)
    		end)
    
    		it("should cancel Promises in the list if Promise.each is cancelled", function()
    			local e = a.new(function() end)
    
    			local f = a.each({ e }, function() end)
    
    			f:cancel()
    
    			expect(e:getStatus()).to.equal(a.Status.Cancelled)
    		end)
    	end)
    
    	describe("Promise.retry", function()
    		it("should retry N times", function()
    			local e = 0
    
    			local f = a.retry(function(f)
    				expect(f).to.equal("foo")
    
    				e = e + 1
    
    				if e == 5 then
    					return a.resolve("ok")
    				end
    
    				return a.reject("fail")
    			end, 5, "foo")
    
    			expect(f:getStatus()).to.equal(a.Status.Resolved)
    			expect(f._values[1]).to.equal("ok")
    		end)
    
    		it("should reject if threshold is exceeded", function()
    			local e = a.retry(function()
    				return a.reject("fail")
    			end, 5)
    
    			expect(e:getStatus()).to.equal(a.Status.Rejected)
    			expect(e._values[1]).to.equal("fail")
    		end)
    	end)
    
    	describe("Promise.retryWithDelay", function()
    		it("should retry after a delay", function()
    			local e = 0
    
    			local f = a.retryWithDelay(function(f)
    				expect(f).to.equal("foo")
    
    				e = e + 1
    
    				if e == 3 then
    					return a.resolve("ok")
    				end
    
    				return a.reject("fail")
    			end, 3, 10, "foo")
    
    			expect(e).to.equal(1)
    
    			c(11)
    
    			expect(e).to.equal(2)
    
    			c(11)
    
    			expect(e).to.equal(3)
    
    			expect(f:getStatus()).to.equal(a.Status.Resolved)
    			expect(f._values[1]).to.equal("ok")
    		end)
    	end)
    
    	describe("Promise.fromEvent", function()
    		it("should convert a Promise into an event", function()
    			local e = Instance.new("BindableEvent")
    
    			local f = a.fromEvent(e.Event)
    
    			expect(f:getStatus()).to.equal(a.Status.Started)
    
    			e:Fire("foo")
    			waitForEvents()
    
    			expect(f:getStatus()).to.equal(a.Status.Resolved)
    			expect(f._values[1]).to.equal("foo")
    		end)
    
    		it("should convert a Promise into an event with the predicate", function()
    			local e = Instance.new("BindableEvent")
    
    			local f = a.fromEvent(e.Event, function(f)
    				return f == "foo"
    			end)
    
    			expect(f:getStatus()).to.equal(a.Status.Started)
    
    			e:Fire("bar")
    			waitForEvents()
    
    			expect(f:getStatus()).to.equal(a.Status.Started)
    
    			e:Fire("foo")
    			waitForEvents()
    
    			expect(f:getStatus()).to.equal(a.Status.Resolved)
    			expect(f._values[1]).to.equal("foo")
    		end)
    	end)
    
    	describe("Promise.is", function()
    		it("should work with current version", function()
    			local e = a.resolve(1)
    
    			expect(a.is(e)).to.equal(true)
    		end)
    
    		it("should work with any object with an andThen", function()
    			local e = {
    				andThen = function()
    					return 1
    				end,
    			}
    
    			expect(a.is(e)).to.equal(true)
    		end)
    
    		it("should work with older promises", function()
    			local e = {}
    			e.prototype = {}
    			e.__index = e.prototype
    
    			function e.prototype:andThen() end
    
    			local f = setmetatable({}, e)
    
    			expect(a.is(f)).to.equal(true)
    		end)
    	end)
    end
end

_modules["Packages/_Index/jsdotlua_react-reconciler@17.2.1/luau-polyfill"] = function()
    return _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill")
end

_modules["Packages/_Index/jsdotlua_react-reconciler@17.2.1/promise"] = function()
    return _require("Packages/_Index/jsdotlua_promise@3.5.2/promise")
end

_modules["Packages/_Index/jsdotlua_react-reconciler@17.2.1/react"] = function()
    return _require("Packages/_Index/jsdotlua_react@17.2.1/react")
end

_modules["Packages/_Index/jsdotlua_react-reconciler@17.2.1/scheduler"] = function()
    return _require("Packages/_Index/jsdotlua_scheduler@17.2.1/scheduler")
end

_modules["Packages/_Index/jsdotlua_react-reconciler@17.2.1/shared"] = function()
    return _require("Packages/_Index/jsdotlua_shared@17.2.1/shared")
end

_modules["Packages/_Index/jsdotlua_react-roblox@17.2.1/luau-polyfill"] = function()
    return _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill")
end

_modules["Packages/_Index/jsdotlua_react-roblox@17.2.1/react"] = function()
    return _require("Packages/_Index/jsdotlua_react@17.2.1/react")
end

_modules["Packages/_Index/jsdotlua_react-roblox@17.2.1/react-reconciler"] = function()
    return _require("Packages/_Index/jsdotlua_react-reconciler@17.2.1/react-reconciler")
end

_modules["Packages/_Index/jsdotlua_react-roblox@17.2.1/scheduler"] = function()
    return _require("Packages/_Index/jsdotlua_scheduler@17.2.1/scheduler")
end

_modules["Packages/_Index/jsdotlua_react-roblox@17.2.1/shared"] = function()
    return _require("Packages/_Index/jsdotlua_shared@17.2.1/shared")
end

_modules["Packages/_Index/jsdotlua_react@17.2.1/luau-polyfill"] = function()
    return _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill")
end

_modules["Packages/_Index/jsdotlua_react@17.2.1/shared"] = function()
    return _require("Packages/_Index/jsdotlua_shared@17.2.1/shared")
end

_modules["Packages/_Index/jsdotlua_scheduler@17.2.1/luau-polyfill"] = function()
    return _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill")
end

_modules["Packages/_Index/jsdotlua_scheduler@17.2.1/shared"] = function()
    return _require("Packages/_Index/jsdotlua_shared@17.2.1/shared")
end

_modules["Packages/_Index/jsdotlua_shared@17.2.1/luau-polyfill"] = function()
    return _require("Packages/_Index/jsdotlua_luau-polyfill@1.2.7/luau-polyfill")
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/es7-types"] = function()
    return _require("Packages/_Index/jsdotlua_es7-types@1.2.7/es7-types")
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/number"] = function()
    return _require("Packages/_Index/jsdotlua_number@1.2.7/number")
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/string/src"] = function()
    return {
    	charCodeAt = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src")),
    	endsWith = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src")),
    	findOr = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src")),
    	includes = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src")),
    	indexOf = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src")),
    	lastIndexOf = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src")),
    	slice = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src")),
    	split = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src")),
    	startsWith = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src")),
    	substr = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src")),
    	trim = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src")),
    	trimEnd = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src")),
    	trimStart = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src")),
    	
    	trimRight = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src")),
    	trimLeft = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src")),
    }
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/string/src/charCodeAt"] = function()
    local a = _require("Packages/_Index/jsdotlua_string@1.2.7/string"))
    
    local b = a.NaN
    
    
    
    return function(c: string, d: number): number
    	if type(d) ~= "number" then
    		d = 1
    	end
    	
    	
    
    
    
    local e = string.len(c)
    	if d < 1 or d > e then
    		return b
    	end
    
    	
    	local f = utf8.offset(c, d)
    
    	
    	if f == nil or f > e then
    		return b
    	end
    
    	local g = utf8.codepoint(c, f, f)
    
    	if g == nil then
    		return b
    	end
    
    	return g
    end
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/string/src/endsWith"] = function()
    local function endsWith(a: string, b: string, c: number?): boolean
    	local d = b:len()
    	if d == 0 then
    		return true
    	end
    	local e = a:len()
    	local f = c or e
    	if f > e then
    		f = e
    	end
    	if f < 1 then
    		return false
    	end
    	local g = f - d + 1
    	return a:find(b, g, true) == g
    end
    
    return endsWith
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/string/src/findOr"] = function()
    type Match = {
    	index: number,
    	match: string
    }
    
    
    local a = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"
    
    local function findOr(b: string, c: { string }, d: number?): Match | nil
    	
    
    	local e = utf8.offset(b, d or 1)
    	local f = {}
    	for g, h in c do
    		h = h:gsub(a, "%%%1")
    		local i, j = string.find(b, h, e)
    		if i then
    			local k = string.sub(b, 1, i - 1)
    			local l, m = utf8.len(k)
    			if l == nil then
    				error(("string `%s` has an invalid byte at position %s"):format(k, tostring(m)))
    			end
    			local n = l :: number + 1
    			local o = {
    				index = n,
    				match = string.sub(b, i, j),
    			}
    			table.insert(f, o)
    		end
    	end
    
    	
    	if #f == 0 then
    		return nil
    	end
    
    	
    	
    
    	local g
    	for h, i in f do
    		
    		if g == nil then
    			g = i
    		end
    		
    		if i.index < g.index then
    			g = i
    		end
    	end
    
    	
    	return g
    end
    
    return findOr
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/string/src/includes"] = function()
    
    local a = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"
    
    local function includes(b: string, c: string, d: (string | number)?): boolean
    	local e, f = utf8.len(b)
    	assert(e ~= nil, ("string `%s` has an invalid byte at position %s"):format(b, tostring(f)))
    	if e == 0 then
    		return false
    	end
    
    	if #c == 0 then
    		return true
    	end
    
    	local g = 1
    	if d ~= nil then
    		g = tonumber(d) or 1
    		if g > e then
    			return false
    		end
    	end
    
    	if g < 1 then
    		g = 1
    	end
    
    	local h = utf8.offset(b, g)
    	local i = c:gsub(a, "%%%1")
    	local j, k = string.find(b, i, h)
    	return j ~= nil
    end
    
    return includes
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/string/src/indexOf"] = function()
    
    local a = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"
    
    
    
    
    return function(b: string, c: string, d: number?): number
    	local e = #b
    	local f = if d ~= nil then if d < 1 then 1 else d :: number else 1
    
    	if #c == 0 then
    		return if f > e then e else f
    	end
    
    	if f > e then
    		return -1
    end
    
    	c = c:gsub(a, "%%%1")
    	local g = #c
    
    	for h = f, e do
    		if string.sub(b, h, h + g - 1) == c then
    			return h
    		end
    	end
    
    	return -1
    end
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/string/src/lastIndexOf"] = function()
    local function lastIndexOf(a: string, b: string, c: number?): number
    	local d = string.len(a)
    	local e
    	if c then
    		e = c
    	else
    		e = d
    	end
    	if c and c < 1 then
    		e = 1
    	end
    	if c and c > d then
    		e = d
    	end
    	if b == "" then
    		
    		return e :: number
    	end
    
    	local f, g
    	
    	local h: number? = 0
    	repeat
    		f = g
    		
    		g, h = string.find(a, b, h :: number + 1, true)
    	until g == nil or g > e
    
    	if f == nil then
    		return -1
    end
    	
    	return f :: number
    end
    
    return lastIndexOf
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/string/src/slice"] = function()
    local function slice(a: string, b: string | number, c: (string | number)?): string
    	local d, e = utf8.len(a)
    	assert(d ~= nil, ("string `%s` has an invalid byte at position %s"):format(a, tostring(e)))
    	local f = tonumber(b)
    	assert(typeof(f) == "number", "startIndexStr should be a number")
    
    	if f + d < 0 then
    		
    		f = 1
    	end
    
    	if f > d then
    		return ""
    	end
    
    	
    	local g = d + 1
    	if c ~= nil then
    		
    		local h = 0/0
    g = tonumber(c) or h 
    	end
    	assert(typeof(g) == "number", "lastIndexStr should convert to number")
    
    	if g > d then
    		g = d + 1
    	end
    
    	local h = utf8.offset(a, f) :: number
    	
    	local i = utf8.offset(a, g) :: number - 1
    
    	return string.sub(a, h, i)
    end
    
    return slice
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/string/src/split"] = function()
    local a = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src"))
    local b = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src"))
    
    local c = _require("Packages/_Index/jsdotlua_string@1.2.7/string"))
    type Array<T> = c.Array<T>
    local d = _require("Packages/_Index/jsdotlua_string@1.2.7/string")).MAX_SAFE_INTEGER
    
    type Pattern = string | Array<string>
    
    local function split(e: string, f: Pattern?, g: number?): Array<string>
    	if f == nil then
    		return { e }
    	end
    	if g == 0 then
    		return {}
    	end
    	local h = if g == nil or g < 0 then d else g
    	local i = f
    	local j: Array<string>
    	if typeof(i) == "string" then
    		if i == "" then
    			local k = {}
    			for l in e:gmatch(".") do
    				table.insert(k, l)
    			end
    			return k
    		end
    		j = { i }
    	else
    		j = i :: Array<string>
    	end
    	local k = 1
    	local l = {}
    	local m
    	local n, o = utf8.len(e)
    	assert(n ~= nil, ("string `%s` has an invalid byte at position %s"):format(e, tostring(o)))
    
    	repeat
    		local p = a(e, j, k)
    		if p ~= nil then
    			table.insert(l, b(e, k, p.index))
    			local q = utf8.len(p.match)
    			
    			k = p.index + q :: number
    		else
    			table.insert(l, b(e, k, nil))
    		end
    		if p ~= nil then
    			m = p
    		end
    	until p == nil or k > n or #l >= h
    	if m ~= nil then
    		local p, q = utf8.len(m.match)
    		assert(
    			p ~= nil,
    			("string `%s` has an invalid byte at position %s"):format(m.match, tostring(q))
    		)
    		if m.index + p == n + 1 then
    			table.insert(l, "")
    		end
    	end
    	return l
    end
    
    return split
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/string/src/startsWith"] = function()
    local function startsWith(a: string, b: string, c: number?): boolean
    	if string.len(b) == 0 then
    		return true
    	end
    	
    	local d
    	if c == nil or c < 1 then
    		d = 1
    	else
    		d = c
    	end
    
    	if d > string.len(a) then
    		return false
    	end
    	return a:find(b, d, true) == d
    end
    
    return startsWith
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/string/src/substr"] = function()
    return function(a: string, b: number, c: number?): string
    	if c and c <= 0 then
    		return ""
    	end
    	return string.sub(a, b, c and b + c - 1 or nil)
    end
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/string/src/trim"] = function()
    local a = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src"))
    local b = _require("Packages/_Index/jsdotlua_string@1.2.7/string/src"))
    
    return function(c: string): string
    	return a(b(c))
    end
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/string/src/trimEnd"] = function()
    return function(a: string): string
    	return (a:gsub("[%s]+$", ""))
    end
end

_modules["Packages/_Index/jsdotlua_string@1.2.7/string/src/trimStart"] = function()
    return function(a: string): string
    	return (a:gsub("^[%s]+", ""))
    end
end

_modules["Packages/_Index/jsdotlua_symbol-luau@1.0.1/symbol-luau/src"] = function()
    
    
    
    
    
    local a = _require("Packages/_Index/jsdotlua_symbol-luau@1.0.1/symbol-luau/src"))
    export type Symbol = a.Symbol
    local b = _require("Packages/_Index/jsdotlua_symbol-luau@1.0.1/symbol-luau/src/global"))
    
    local c = setmetatable({}, {
    	
    	
    
    
    __call = function(c, d: string?): a.Symbol
    		return a.new(d)
    	end,
    })
    
    c.for_ = b.getOrInit
    
    return c
end

_modules["Packages/_Index/jsdotlua_symbol-luau@1.0.1/symbol-luau/src/Registry.global"] = function()
    local a = _require("Packages/_Index/jsdotlua_symbol-luau@1.0.1/symbol-luau/src"))
    
    local b: { [string]: a.Symbol } = {}
    
    return {
    	getOrInit = function(c: string): a.Symbol
    		if b[c] == nil then
    			b[c] = a.new(c)
    		end
    
    		return b[c]
    	end,
    	
    	__clear = function()
    		b = {}
    	end,
    }
end

_modules["Packages/_Index/jsdotlua_symbol-luau@1.0.1/symbol-luau/src/Symbol"] = function()
    
    
    
    
    
    
    
    
    
    
    
    export type Symbol = typeof(newproxy(true)) & { [string]: any }
    
    return {
    	new = function(a: string?): Symbol
    		local b = newproxy(true) :: any
    
    		local c = "Symbol()"
    		if a then
    			c = ("Symbol(%s)"):format(a)
    		end
    
    		getmetatable(b).__tostring = function()
    			return c
    		end
    
    		return (b :: any) :: Symbol
    	end,
    }
end

_modules["Packages/_Index/jsdotlua_timers@1.2.7/collections"] = function()
    return _require("Packages/_Index/jsdotlua_collections@1.2.7/collections")
end

_modules["Packages/_Index/jsdotlua_timers@1.2.7/timers/src"] = function()
    local a = _require("Packages/_Index/jsdotlua_timers@1.2.7/timers/src")).Object
    
    local b = _require("Packages/_Index/jsdotlua_timers@1.2.7/timers/src"))
    local c = _require("Packages/_Index/jsdotlua_timers@1.2.7/timers/src"))
    
    export type Timeout = b.Timeout
    export type Interval = c.Interval
    
    return a.assign({}, b(task.delay), c(task.delay))
end

_modules["Packages/_Index/jsdotlua_timers@1.2.7/timers/src/makeIntervalImpl"] = function()
    local a = newproxy(false)
    
    type TaskStatus = number
    export type Interval = { [typeof(a)]: TaskStatus }
    
    local b = 1
    local c = 3
    
    return function(d)
    	local function setInterval(e, f: number, ...): Interval
    		local g = { ... }
    		local h = {
    			[a] = b,
    		}
    
    		
    		if f == nil then
    			f = 0
    		end
    
    		
    		local i = f / 1000
    		local j
    		j = function()
    			d(i, function()
    				if h[a] == b then
    					e(unpack(g))
    					j()
    				end
    			end)
    		end
    
    		j()
    
    		return h
    	end
    
    	local function clearInterval(e: Interval)
    		if e == nil then
    			return
    		end
    
    		if e[a] == b then
    			e[a] = c
    		end
    	end
    
    	return {
    		setInterval = setInterval,
    		clearInterval = clearInterval,
    	}
    end
end

_modules["Packages/_Index/jsdotlua_timers@1.2.7/timers/src/makeTimerImpl"] = function()
    local a = newproxy(false)
    
    type TaskStatus = number
    export type Timeout = { [typeof(a)]: TaskStatus }
    
    local b = 1
    local c = 2
    local d = 3
    
    return function(e)
    	local function setTimeout(f, g: number?, ...): Timeout
    		local h = { ... }
    		local i = {
    			[a] = b,
    		}
    
    		
    		if g == nil then
    			g = 0
    		end
    
    		
    		local j = g :: number / 1000
    		e(j, function()
    			if i[a] == b then
    				f(unpack(h))
    				i[a] = c
    			end
    		end)
    
    		return i
    	end
    
    	local function clearTimeout(f: Timeout)
    		if f == nil then
    			return
    		end
    		if f[a] == b then
    			f[a] = d
    		end
    	end
    
    	return {
    		setTimeout = setTimeout,
    		clearTimeout = clearTimeout,
    	}
    end
end

_modules["api"] = function()
    
    
    
    
    
    return {
        Window = _require("api/Window"),
        Tab = _require("api/Tab"),
        Section = _require("api/Section"),
        Element = _require("api/Element"),
    }
end

_modules["api/Element"] = function()
    
    
    
    
    local a = {}
    a.__index = a
    
    function a.new(b, c)
        return setmetatable({
            Id = b,
            Store = c,
        }, a)
    end
    
    function a:SetTitle(b)
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.Id,
            props = { text = b }
        })
    end
    
    function a:SetValue(b)
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.Id,
            props = { value = b }
        })
    end
    
    function a:SetVisible(b)
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.Id,
            props = { visible = b }
        })
    end
    
    return a
end

_modules["api/Section"] = function()
    
    
    
    
    local a = {}
    a.__index = a
    
    local b = _require("api/Element")
    
    function a.new(c, d, e, f)
        local g = setmetatable({
            Id = c,
            TabId = d,
            WindowId = e,
            Store = f,
        }, a)
        
        return g
    end
    
    local function CreateElement(c, d, e)
        local f = game:GetService("HttpService"):GenerateGUID(false)
        
        c.Store:Dispatch({
            type = "ADD_ELEMENT",
            parentId = c.Id,
            element = {
                id = f,
                type = d,
                props = e,
            }
        })
        
        return b.new(f, c.Store)
    end
    
    function a:CreateButton(c)
        return CreateElement(self, "Button", c)
    end
    
    function a:CreateIconButton(c)
        return CreateElement(self, "IconButton", c)
    end
    
    function a:CreateToggle(c)
        return CreateElement(self, "Toggle", c)
    end
    
    function a:CreateCheckbox(c)
        return CreateElement(self, "Checkbox", c)
    end
    
    function a:CreateSlider(c)
        return CreateElement(self, "Slider", c)
    end
    
    function a:CreateDropdown(c)
        return CreateElement(self, "Dropdown", c)
    end
    
    function a:CreateMultiDropdown(c)
        c.Multi = true
        return CreateElement(self, "Dropdown", c)
    end
    
    function a:CreateKeybind(c)
        return CreateElement(self, "Keybind", c)
    end
    
    function a:CreateInput(c)
        return CreateElement(self, "Input", c)
    end
    
    function a:CreateNumberInput(c)
        return CreateElement(self, "NumberInput", c)
    end
    
    function a:CreateSearchInput(c)
        return CreateElement(self, "SearchInput", c)
    end
    
    function a:CreateTextArea(c)
        return CreateElement(self, "TextArea", c)
    end
    
    function a:CreateLabel(c)
        return CreateElement(self, "Label", c)
    end
    
    function a:CreateBadge(c)
        return CreateElement(self, "Badge", c)
    end
    
    function a:CreateIcon(c)
        return CreateElement(self, "Icon", c)
    end
    
    function a:CreateProgressBar(c)
        return CreateElement(self, "ProgressBar", c)
    end
    
    function a:CreateComboBox(c)
        return CreateElement(self, "ComboBox", c)
    end
    
    function a:CreateAvatar(c)
        return CreateElement(self, "Avatar", c)
    end
    
    function a:CreateDivider(c)
        return CreateElement(self, "Divider", c or {})
    end
    
    function a:CreateSpacer(c)
        return CreateElement(self, "Spacer", { Height = c })
    end
    
    function a:CreateAccordion(c)
        return CreateElement(self, "Accordion", c)
    end
    
    function a:CreateCollapsible(c)
        return CreateElement(self, "Collapsible", c)
    end
    
    function a:CreateCopyButton(c)
        return CreateElement(self, "CopyButton", c)
    end
    
    function a:CreateTag(c)
        return CreateElement(self, "Tag", c)
    end
    
    function a:CreateStatusIndicator(c)
        return CreateElement(self, "StatusIndicator", c)
    end
    
    function a:CreateGrid(c)
        return CreateElement(self, "Grid", c)
    end
    
    function a:CreateStack(c)
        return CreateElement(self, "Stack", c)
    end
    
    function a:CreateVirtualList(c)
        return CreateElement(self, "VirtualList", c)
    end
    
    return a
end

_modules["api/Tab"] = function()
    
    
    
    
    local a = _require("api/Section")
    local b = {}
    b.__index = b
    
    function b.new(c, d, e)
        return setmetatable({
            Id = c,
            WindowId = d,
            Store = e,
        }, b)
    end
    
    function b:CreateSection(c)
        local d = game:GetService("HttpService"):GenerateGUID(false)
        
        self.Store:Dispatch({
            type = "ADD_SECTION",
            tabId = self.Id,
            section = {
                id = d,
                title = c.Title or "New Section",
            }
        })
        
        return a.new(d, self.Id, self.WindowId, self.Store)
    end
    
    return b
end

_modules["api/Window"] = function()
    
    
    
    
    local a = _require("api/Tab")
    local b = {}
    b.__index = b
    
    function b.new(c, d)
        return setmetatable({
            Id = c,
            Store = d,
        }, b)
    end
    
    function b:CreateTab(c)
        local d = game:GetService("HttpService"):GenerateGUID(false)
        
        self.Store:Dispatch({
            type = "ADD_TAB",
            windowId = self.Id,
            tab = {
                id = d,
                title = c.Title or "New Tab",
                icon = c.Icon,
            }
        })
        
        return a.new(d, self.Id, self.Store)
    end
    
    function b:SetTitle(c)
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.Id,
            props = { title = c }
        })
    end
    
    function b:Close()
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.Id,
            props = { visible = false }
        })
    end
    
    return b
end

_modules["components/Containers/ElementList"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function ElementList(c)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = c.LayoutOrder,
        }, {
            Layout = a.createElement("UIListLayout", {
                Padding = UDim.new(0, b.Spacing[2]),
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
            }),
            Padding = a.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, b.Spacing[2]),
                PaddingRight = UDim.new(0, b.Spacing[2]),
            }),
            Elements = a.createElement(a.Fragment, {}, c.children)
        })
    end
    
    return ElementList
end

_modules["components/Containers/Grid"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    
    local function Grid(b)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = b.LayoutOrder,
        }, {
            Layout = a.createElement("UIGridLayout", {
                CellSize = b.CellSize or UDim2.fromOffset(100, 100),
                CellPadding = b.CellPadding or UDim2.fromOffset(8, 8),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Children = a.createElement(a.Fragment, {}, b.children)
        })
    end
    
    return Grid
end

_modules["components/Containers/Section"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("hooks/useTree")
    local d = _require("components/Containers/ElementList")
    
    
    local e = {
        Button = _require("components/Elements/HyperButton"),
        IconButton = _require("components/Elements/HyperIconButton"),
        Toggle = _require("components/Elements/HyperToggle"),
        Checkbox = _require("components/Elements/HyperCheckbox"),
        Slider = _require("components/Elements/HyperSlider"),
        Dropdown = _require("components/Elements/HyperDropdown"),
        Keybind = _require("components/Elements/HyperKeybind"),
        ColorPicker = _require("components/Elements/HyperColorPicker"),
        Input = _require("components/Elements/HyperInput"),
        NumberInput = _require("components/Elements/HyperNumberInput"),
        SearchInput = _require("components/Elements/HyperSearchInput"),
        TextArea = _require("components/Elements/HyperTextArea"),
        Label = _require("components/Elements/HyperLabel"),
        Badge = _require("components/Elements/HyperBadge"),
        Icon = _require("components/Elements/HyperIcon"),
        ProgressBar = _require("components/Elements/HyperProgressBar"),
        StatDisplay = _require("components/Elements/HyperStatDisplay"),
        ComboBox = _require("components/Elements/HyperComboBox"),
        Avatar = _require("components/Elements/HyperAvatar"),
        Divider = _require("components/Elements/HyperDivider"),
        Spacer = _require("components/Elements/HyperSpacer"),
        Accordion = _require("components/Elements/HyperAccordion"),
        Collapsible = _require("components/Elements/HyperCollapsible"),
        CopyButton = _require("components/Elements/HyperCopyButton"),
        Tag = _require("components/Elements/HyperTag"),
        StatusIndicator = _require("components/Elements/HyperStatusIndicator"),
        Grid = _require("components/Containers/Grid"),
        Stack = _require("components/Containers/Stack"),
        VirtualList = _require("components/Containers/VirtualList"),
    }
    
    local f = _require("hooks/useTheme")
    
    local function Section(g)
        local h = f(g.store)
        local i = c(g.store, g.id)
        if not i then return nil end
        
        local j = {}
        for k, l in ipairs(i.children) do
            local m = c(g.store, l)
            if m then
                local n = e[m.type]
                if n then
                    table.insert(j, a.createElement(n, {
                        key = l,
                        LayoutOrder = k,
                        store = g.store, 
                        
                        Text = m.props.text,
                        Value = m.props.value,
                        Options = m.props.options,
                        Min = m.props.min,
                        Max = m.props.max,
                        Icon = m.props.icon,
                        Disabled = m.props.disabled,
                        Callback = function(o)
                            
                            if m.type ~= "Button" and m.type ~= "IconButton" then
                                g.store:Dispatch({
                                    type = "UPDATE_ELEMENT",
                                    id = l,
                                    props = { value = o }
                                })
                            end
                            
                            if m.props.callback then
                                m.props.callback(o)
                            end
                        end
                    }))
                end
            end
        end
        
        local k = i.props.title or ""
        
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = g.LayoutOrder,
        }, {
            Layout = a.createElement("UIListLayout", {
                Padding = UDim.new(0, h.Spacing[2]),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Title = #k > 0 and a.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 20),
                BackgroundTransparency = 1,
                Text = k:upper(),
                TextColor3 = h.Color.TextMuted,
                Font = h.Font,
                TextSize = h.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
            }, {
                Padding = a.createElement("UIPadding", { PaddingLeft = UDim.new(0, h.Spacing[2]) })
            }) or nil,
            Container = a.createElement(d, {}, j)
        })
    end
    
    return Section
end

_modules["components/Containers/Sidebar"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function Sidebar(c)
        return a.createElement("Frame", {
            Size = UDim2.new(0, 200, 1, 0),
            BackgroundColor3 = b.Color.Surface,
            BorderSizePixel = 0,
        }, {
            Layout = a.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 4),
            }),
            Padding = a.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12),
                PaddingBottom = UDim.new(0, 12),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
            }),
            Items = a.createElement(a.Fragment, {}, c.children)
        })
    end
    
    return Sidebar
end

_modules["components/Containers/Stack"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    
    local function Stack(b)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = b.LayoutOrder,
        }, {
            Layout = a.createElement("UIListLayout", {
                FillDirection = b.FillDirection or Enum.FillDirection.Vertical,
                Padding = b.Padding or UDim.new(0, 8),
                HorizontalAlignment = b.HorizontalAlignment or Enum.HorizontalAlignment.Left,
                VerticalAlignment = b.VerticalAlignment or Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Children = a.createElement(a.Fragment, {}, b.children)
        })
    end
    
    return Stack
end

_modules["components/Containers/TabBar"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("hooks/useSpring")
    
    local function TabItem(d)
        local e = d.Selected
        local f = c(e and 1.1 or 1, { damping = 0.8, stiffness = 0.2 })
        
        return a.createElement("TextButton", {
            Size = UDim2.new(0, 100, 1, 0),
            BackgroundTransparency = 1,
            Text = d.Title,
            TextColor3 = e and b.Color.Text or b.Color.TextMuted,
            Font = e and b.Font.Bold or b.Font.Main,
            TextSize = b.FontSize.Medium,
            [a.Event.Activated] = d.OnSelected,
        }, {
            Indicator = e and a.createElement("Frame", {
                Size = UDim2.new(0.6, 0, 0, 2),
                Position = UDim2.new(0.2, 0, 1, -2),
                BackgroundColor3 = b.Color.Accent,
                BorderSizePixel = 0,
            }),
            UIScale = a.createElement("UIScale", { Scale = f })
        })
    end
    
    local function TabBar(d)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundColor3 = b.Color.Surface,
            BorderSizePixel = 0,
            LayoutOrder = d.LayoutOrder,
        }, {
            Layout = a.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Tabs = a.createElement(a.Fragment, {}, d.children)
        })
    end
    
    TabBar.Item = TabItem
    return TabBar
end

_modules["components/Containers/VirtualList"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    
    local function VirtualList(b)
        local c = b.Items or {}
        local d = b.ItemHeight or 32
        local e = b.Buffer or 5
        
        local f = a.useRef(nil)
        local g, h = a.useState(Vector2.new(0, 400))
        local i, j = a.useState(0)
        
        
        local k = math.ceil(g.Y / d)
        local l = math.max(1, math.floor(i / d) - e)
        local m = math.min(#c, l + k + e * 2)
        
        local n = {}
        for o = l, m do
            local p = c[o]
            table.insert(n, a.createElement("Frame", {
                Key = o,
                Size = UDim2.new(1, 0, 0, d),
                Position = UDim2.fromOffset(0, (o - 1) * d),
                BackgroundTransparency = 1,
            }, {
                Content = b.RenderItem(p, o)
            }))
        end
        
        return a.createElement("ScrollingFrame", {
            Size = b.Size or UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            CanvasSize = UDim2.new(0, 0, 0, #c * d),
            ScrollBarThickness = 2,
            [a.Change.CanvasPosition] = function(o)
                j(o.CanvasPosition.Y)
            end,
            [a.Change.AbsoluteSize] = function(o)
                h(o.AbsoluteSize)
            end,
        }, n)
    end
    
    return VirtualList
end

_modules["components/Elements/BaseElement"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("hooks/useInteractionState")
    
    local d = _require("hooks/useSpring")
    
    local function BaseElement(e)
        local f = c(not e.Disabled)
        
        
        local g = 1
        if not e.Disabled then
            if f.pressed then
                g = 0.95
            elseif f.hovered then
                g = 1.02
            end
        end
        
        local h = d(g, { damping = 0.8, stiffness = 0.2 })
        
        
        local i = e.Size or UDim2.new(1, 0, 0, 32)
        local j = e.BackgroundTransparency or 0
        local k = e.BackgroundColor3 or e.BackgroundColor or b.Color.Surface
        
        return a.createElement("Frame", {
            Size = i,
            BackgroundColor3 = k,
            BackgroundTransparency = j,
            BorderSizePixel = 0,
            LayoutOrder = e.LayoutOrder,
        }, {
            UIScale = a.createElement("UIScale", {
                Scale = h
            }),
            UICorner = a.createElement("UICorner", {
                CornerRadius = UDim.new(0, b.Radius.Small)
            }),
            UIStroke = a.createElement("UIStroke", {
                Color = b.Color.Border,
                Transparency = 0.5,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            }),
            Content = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                ZIndex = 3,
            }, e.children),
            
            
            Trigger = a.createElement("TextButton", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = "",
                ZIndex = 10,
                [a.Event.Activated] = function()
                    if not e.Disabled and e.OnActivated then
                        e.OnActivated()
                    end
                end,
            }, f.bindings)
        })
    end
    
    return BaseElement
end

_modules["components/Elements/HyperAccordion"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    local d = _require("hooks/useSpring")
    
    local function HyperAccordion(e)
        local f, g = a.useState(false)
        local h = d(f and 180 or 0, { damping = 0.8, stiffness = 0.2 })
        
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = e.LayoutOrder,
        }, {
            Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
            Header = a.createElement(c, {
                OnActivated = function() g(not f) end,
            }, {
                Container = a.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                }, {
                    Padding = a.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, b.Spacing[3]),
                        PaddingRight = UDim.new(0, b.Spacing[3]),
                    }),
                    Title = a.createElement("TextLabel", {
                        Size = UDim2.new(1, -24, 1, 0),
                        BackgroundTransparency = 1,
                        Text = e.Title or "Accordion",
                        TextColor3 = b.Color.Text,
                        Font = b.Font.Bold,
                        TextSize = b.FontSize.Medium,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    }),
                    Arrow = a.createElement("ImageLabel", {
                        Size = UDim2.fromOffset(16, 16),
                        Position = UDim2.new(1, -16, 0.5, -8),
                        BackgroundTransparency = 1,
                        Image = "rbxassetid://10723346959",
                        ImageColor3 = b.Color.TextMuted,
                        Rotation = h,
                    })
                })
            }),
            Content = f and a.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 16),
                    PaddingRight = UDim.new(0, 4),
                }),
                Elements = a.createElement(a.Fragment, {}, e.children)
            })
        })
    end
    
    return HyperAccordion
end

_modules["components/Elements/HyperAvatar"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HyperAvatar(c)
        local d = c.UserId or 1
        local e = c.Size or 48
        
        return a.createElement("ImageLabel", {
            Size = UDim2.fromOffset(e, e),
            BackgroundColor3 = b.Color.Surface,
            BorderSizePixel = 0,
            Image = "rbxthumb://type=AvatarHeadShot&id=" .. d .. "&w=150&h=150",
            LayoutOrder = c.LayoutOrder,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
            UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 2 })
        })
    end
    
    return HyperAvatar
end

_modules["components/Elements/HyperBadge"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HyperBadge(c)
        local d = c.Color or b.Color.Accent
        
        return a.createElement("Frame", {
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundColor3 = d,
            BackgroundTransparency = 0.2,
            BorderSizePixel = 0,
            LayoutOrder = c.LayoutOrder,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
            Padding = a.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 2),
                PaddingBottom = UDim.new(0, 2),
                PaddingLeft = UDim.new(0, 6),
                PaddingRight = UDim.new(0, 6),
            }),
            Label = a.createElement("TextLabel", {
                Size = UDim2.fromScale(0, 0),
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1,
                Text = c.Text or "BADGE",
                TextColor3 = b.Color.Text,
                Font = b.Font.Bold,
                TextSize = 10,
            })
        })
    end
    
    return HyperBadge
end

_modules["components/Elements/HyperButton"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function HyperButton(d)
        return a.createElement(c, {
            Disabled = d.Disabled,
            OnActivated = d.Callback,
            LayoutOrder = d.LayoutOrder,
            Size = d.Size,
            BackgroundColor3 = d.BackgroundColor3,
        }, {
            Label = a.createElement("TextLabel", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = d.Text or "Button",
                TextColor3 = d.TextColor3 or b.Color.Text,
                Font = d.Font or b.Font.Main,
                TextSize = d.TextSize or b.FontSize.Medium,
                ZIndex = 5,
            })
        })
    end
    
    return HyperButton
end

_modules["components/Elements/HyperCheckbox"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("components/Elements/BaseElement")
    local c = _require("hooks/useSpring")
    local d = _require("hooks/useTheme")
    
    local function HyperCheckbox(e)
        local f = d(e.store)
        local g = e.Value or false
        
        
        local h = c(g and 1 or 0, { stiffness = 300, damping = 30 })
        
        return a.createElement(b, {
            Disabled = e.Disabled,
            OnActivated = function()
                if e.Callback then e.Callback(not g) end
            end,
            LayoutOrder = e.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, f.Spacing[3]),
                    PaddingRight = UDim.new(0, f.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -30, 1, 0),
                    BackgroundTransparency = 1,
                    Text = e.Text or "Checkbox",
                    TextColor3 = f.Color.Text,
                    Font = f.Font,
                    TextSize = f.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Box = a.createElement("Frame", {
                    Size = UDim2.fromOffset(20, 20),
                    Position = UDim2.new(1, -20, 0.5, -10),
                    BackgroundColor3 = f.Color.Surface,
                    BorderSizePixel = 0,
                }, {
                    UICorner = a.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }),
                    UIStroke = a.createElement("UIStroke", {
                        Color = g and f.Color.Accent or f.Color.Border,
                        Thickness = 1,
                    }),
                    CheckMark = a.createElement("Frame", {
                        Size = UDim2.fromScale(0.6, 0.6),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = f.Color.Accent,
                        BackgroundTransparency = h:map(function(i) return 1 - i end),
                    }, {
                        UICorner = a.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 2)
                        }),
                        UIScale = a.createElement("UIScale", {
                            Scale = h
                        })
                    })
                })
            })
        })
    end
    
    return HyperCheckbox
end

_modules["components/Elements/HyperCollapsible"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("components/Elements/HyperAccordion")
    
    local function HyperCollapsible(c)
        
        return a.createElement(b, c)
    end
    
    return HyperCollapsible
end

_modules["components/Elements/HyperColorPicker"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("components/Elements/BaseElement")
    local c = _require("components/Elements/HyperColorPicker/HueSlider")
    local d = _require("components/Elements/HyperColorPicker/SaturationSquare")
    local e = _require("components/Elements/HyperColorPicker/ColorPreview")
    local f = _require("hooks/useTheme")
    
    local function HyperColorPicker(g)
        local h = f(g.store)
        local i, j = a.useState(false)
        
        
        local k, l, m = Color3.toHSV(g.Value or Color3.new(1, 1, 1))
        local n, o = a.useState(k)
        local p, q = a.useState(l)
        local r, s = a.useState(m)
        
        
        a.useEffect(function()
            local t, u, v = Color3.toHSV(g.Value or Color3.new(1, 1, 1))
            o(t)
            q(u)
            s(v)
        end, {g.Value})
    
        local function updateColor(t, u, v)
            local w = t or n
            local x = u or p
            local y = v or r
            
            o(w)
            q(x)
            s(y)
            
            if g.Callback then
                g.Callback(Color3.fromHSV(w, x, y))
            end
        end
        
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = g.LayoutOrder,
            ZIndex = i and 100 or 1,
        }, {
            Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
            Trigger = a.createElement(b, {
                OnActivated = function() j(not i) end,
            }, {
                Container = a.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                }, {
                    Padding = a.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, h.Spacing[3]),
                        PaddingRight = UDim.new(0, h.Spacing[3]),
                    }),
                    Label = a.createElement("TextLabel", {
                        Size = UDim2.new(1, -60, 1, 0),
                        BackgroundTransparency = 1,
                        Text = g.Text or "Color Picker",
                        TextColor3 = h.Color.Text,
                        Font = h.Font,
                        TextSize = h.FontSize.Medium,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    }),
                    Preview = a.createElement(e, {
                        Color = g.Value or Color3.new(1, 1, 1)
                    })
                })
            }),
            Dropdown = i and a.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 200),
                BackgroundColor3 = h.Color.Surface,
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, h.Radius.Small) }),
                Padding = a.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                }),
                Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8) }),
                SatVal = a.createElement(d, {
                    Hue = n,
                    Sat = p,
                    Val = r,
                    OnChanged = function(t, u) updateColor(nil, t, u) end
                }),
                Hue = a.createElement(c, {
                    Hue = n,
                    OnChanged = function(t) updateColor(t, nil, nil) end
                })
            })
        })
    end
    
    return HyperColorPicker
end

_modules["components/Elements/HyperColorPicker/ColorPreview"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function ColorPreview(c)
        return a.createElement("Frame", {
            Size = UDim2.fromOffset(24, 24),
            Position = UDim2.new(1, -24, 0.5, -12),
            BackgroundColor3 = c.Color or Color3.new(1, 1, 1),
            BorderSizePixel = 0,
            ZIndex = 5,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
            UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 2 })
        })
    end
    
    return ColorPreview
end

_modules["components/Elements/HyperColorPicker/HueSlider"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HueSlider(c)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 12),
            BorderSizePixel = 0,
            LayoutOrder = 2,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
            Gradient = a.createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)),
                    ColorSequenceKeypoint.new(0.16, Color3.fromHSV(0.16, 1, 1)),
                    ColorSequenceKeypoint.new(0.33, Color3.fromHSV(0.33, 1, 1)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1)),
                    ColorSequenceKeypoint.new(0.66, Color3.fromHSV(0.66, 1, 1)),
                    ColorSequenceKeypoint.new(0.83, Color3.fromHSV(0.83, 1, 1)),
                    ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1)),
                })
            }),
            Handle = a.createElement("Frame", {
                Size = UDim2.fromOffset(16, 16),
                Position = UDim2.new(c.Hue, 0, 0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = b.Color.Text,
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                UIStroke = a.createElement("UIStroke", { Thickness = 2, Color = b.Color.Background })
            }),
            Trigger = a.createElement("TextButton", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = "",
                [a.Event.MouseButton1Down] = function(d)
                    local function update()
                        local e = (game:GetService("UserInputService"):GetMouseLocation().X - d.AbsolutePosition.X) / d.AbsoluteSize.X
                        c.OnChanged(math.clamp(e, 0, 1))
                    end
                    update()
                end
            })
        })
    end
    
    return HueSlider
end

_modules["components/Elements/HyperColorPicker/SaturationSquare"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function SaturationSquare(c)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -20),
            BackgroundColor3 = Color3.fromHSV(c.Hue, 1, 1),
            BorderSizePixel = 0,
            LayoutOrder = 1,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Small) }),
            SatGradient = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BorderSizePixel = 0,
                BackgroundTransparency = 0,
            }, {
                Gradient = a.createElement("UIGradient", {
                    Transparency = NumberSequence.new(0, 1),
                    Color = ColorSequence.new(Color3.new(1, 1, 1)),
                    Rotation = 0,
                })
            }),
            ValGradient = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BorderSizePixel = 0,
                BackgroundTransparency = 0,
            }, {
                Gradient = a.createElement("UIGradient", {
                    Transparency = NumberSequence.new(0, 1),
                    Color = ColorSequence.new(Color3.new(0, 0, 0)),
                    Rotation = 90,
                })
            }),
            Handle = a.createElement("Frame", {
                Size = UDim2.fromOffset(12, 12),
                Position = UDim2.fromScale(c.Sat, 1 - c.Val),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = b.Color.Text,
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                UIStroke = a.createElement("UIStroke", { Thickness = 2, Color = b.Color.Background })
            }),
            Trigger = a.createElement("TextButton", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = "",
                [a.Event.MouseButton1Down] = function(d)
                    local function update()
                        local e = game:GetService("UserInputService"):GetMouseLocation()
                        local f = (e.X - d.AbsolutePosition.X) / d.AbsoluteSize.X
                        local g = (e.Y - d.AbsolutePosition.Y) / d.AbsoluteSize.Y
                        c.OnChanged(math.clamp(f, 0, 1), 1 - math.clamp(g, 0, 1))
                    end
                    update()
                end
            })
        })
    end
    
    return SaturationSquare
end

_modules["components/Elements/HyperComboBox"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("components/Elements/HyperDropdown")
    local c = _require("components/Elements/HyperInput")
    
    local function HyperComboBox(d)
        
        
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = d.LayoutOrder,
        }, {
            Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
            Combo = a.createElement(b, {
                Text = d.Text,
                Value = d.Value,
                Options = d.Options,
                Callback = d.Callback,
            })
        })
    end
    
    return HyperComboBox
end

_modules["components/Elements/HyperConfirmationDialog"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("components/Elements/HyperModal")
    local c = _require("components/Elements/HyperButton")
    
    local function HyperConfirmationDialog(d)
        return a.createElement(b, {
            Open = d.Open,
            Title = d.Title,
            Content = d.Content,
        }, {
            Cancel = a.createElement(c, {
                Text = d.CancelText or "Cancel",
                Size = UDim2.fromOffset(100, 32),
                Callback = d.OnCancel,
            }),
            Confirm = a.createElement(c, {
                Text = d.ConfirmText or "Confirm",
                Size = UDim2.fromOffset(100, 32),
                BackgroundColor = Color3.fromRGB(200, 50, 50), 
                Callback = d.OnConfirm,
            })
        })
    end
    
    return HyperConfirmationDialog
end

_modules["components/Elements/HyperCopyButton"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function CopyButton(d)
        local e, f = a.useState(false)
        
        local function copy()
            if setclipboard then
                setclipboard(d.Value or "")
                f(true)
                task.delay(2, function() f(false) end)
            end
        end
        
        return a.createElement(c, {
            OnActivated = copy,
            LayoutOrder = d.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -60, 1, 0),
                    BackgroundTransparency = 1,
                    Text = d.Text or "Copy Content",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Status = a.createElement("TextLabel", {
                    Size = UDim2.fromScale(0.4, 1),
                    Position = UDim2.fromScale(0.6, 0),
                    BackgroundTransparency = 1,
                    Text = e and "COPIED" or "COPY",
                    TextColor3 = e and b.Color.Success or b.Color.TextMuted,
                    Font = b.Font.Bold,
                    TextSize = 10,
                    TextXAlignment = Enum.TextXAlignment.Right,
                })
            })
        })
    end
    
    return CopyButton
end

_modules["components/Elements/HyperDivider"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HyperDivider(c)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1),
            BackgroundColor3 = b.Color.Border,
            BorderSizePixel = 0,
            BackgroundTransparency = 0.5,
            LayoutOrder = c.LayoutOrder,
        }, {
            Padding = a.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, b.Spacing[2]),
                PaddingRight = UDim.new(0, b.Spacing[2]),
            })
        })
    end
    
    return HyperDivider
end

_modules["components/Elements/HyperDropdown"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("components/Elements/HyperDropdown/DropdownTrigger")
    local c = _require("components/Elements/HyperDropdown/DropdownList")
    local d = _require("hooks/useTheme")
    
    local function HyperDropdown(e)
        local f = d(e.store)
        local g, h = a.useState(false)
        
        return a.createElement("Frame", {
            Size = e.Size or UDim2.new(1, 0, 0, 40),
            BackgroundTransparency = 1,
            LayoutOrder = e.LayoutOrder,
            ZIndex = g and 1000 or 1, 
        }, {
            Trigger = a.createElement(b, {
                Text = e.Text,
                Value = e.Value,
                Open = g,
                OnToggle = function() h(not g) end,
                store = e.store, 
            }),
            List = g and a.createElement("Frame", {
                Size = UDim2.fromScale(1, 0),
                Position = UDim2.new(0, 0, 0, 44),
                BackgroundTransparency = 1,
                ZIndex = 1100,
            }, {
                Content = a.createElement(c, {
                    Options = e.Options,
                    Selected = e.Value,
                    Multi = e.Multi,
                    store = e.store,
                    OnSelect = function(i)
                        if not e.Multi then h(false) end
                        if e.Callback then e.Callback(i) end
                    end,
                })
            })
        })
    end
    
    return HyperDropdown
end

_modules["components/Elements/HyperDropdown/DropdownList"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Containers/VirtualList")
    local d = _require("components/Elements/HyperDropdown/DropdownOption")
    local e = _require("components/Elements/HyperDropdown/DropdownSearch")
    
    local function DropdownList(f)
        local g, h = a.useState("")
        
        local i = {}
        for j, k in ipairs(f.Options or {}) do
            if string.find(string.lower(tostring(k)), string.lower(g)) then
                table.insert(i, k)
            end
        end
        
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 200),
            BackgroundColor3 = b.Color.Surface,
            BorderSizePixel = 0,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Small) }),
            Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
            Search = a.createElement(e, {
                OnChanged = h
            }),
            List = a.createElement(c, {
                Size = UDim2.new(1, 0, 1, -32),
                Items = i,
                ItemHeight = 32,
                RenderItem = function(j)
                    local k = false
                    if type(f.Selected) == "table" then
                        k = table.find(f.Selected, j) ~= nil
                    else
                        k = f.Selected == j
                    end
                    
                    return a.createElement(d, {
                        Text = tostring(j),
                        Selected = k,
                        OnSelect = function() f.OnSelect(j) end
                    })
                end
            })
        })
    end
    
    return DropdownList
end

_modules["components/Elements/HyperDropdown/DropdownOption"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function DropdownOption(d)
        return a.createElement(c, {
            BackgroundTransparency = 1,
            OnActivated = d.OnSelect,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    Text = d.Text,
                    TextColor3 = d.Selected and b.Color.Accent or b.Color.Text,
                    Font = d.Selected and b.Font.Bold or b.Font.Main,
                    TextSize = b.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
            })
        })
    end
    
    return DropdownOption
end

_modules["components/Elements/HyperDropdown/DropdownSearch"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function DropdownSearch(c)
        return a.createElement("TextBox", {
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundColor3 = b.Color.Background,
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            PlaceholderText = "Search...",
            PlaceholderColor3 = b.Color.TextMuted,
            Text = "",
            TextColor3 = b.Color.Text,
            Font = b.Font.Main,
            TextSize = b.FontSize.Small,
            ClearTextOnFocus = false,
            [a.Change.Text] = function(d)
                c.OnChanged(d.Text)
            end,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Small) }),
            Padding = a.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) }),
        })
    end
    
    return DropdownSearch
end

_modules["components/Elements/HyperDropdown/DropdownTrigger"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    local d = _require("hooks/useSpring")
    
    local function DropdownTrigger(e)
        local f = d(e.Open and 180 or 0, { damping = 0.8, stiffness = 0.2 })
        
        local g = "Select Option..."
        if e.Value then
            if type(e.Value) == "table" then
                g = #e.Value .. " selected"
            else
                g = tostring(e.Value)
            end
        end
        
        return a.createElement(c, {
            OnActivated = e.OnToggle,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -60, 1, 0),
                    BackgroundTransparency = 1,
                    Text = e.Text or "Dropdown",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Value = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -60, 1, 0),
                    BackgroundTransparency = 1,
                    Text = g,
                    TextColor3 = b.Color.TextMuted,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    ZIndex = 4,
                }),
                Arrow = a.createElement("ImageLabel", {
                    Size = UDim2.fromOffset(16, 16),
                    Position = UDim2.new(1, -16, 0.5, -8),
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://10723346959", 
                    ImageColor3 = b.Color.TextMuted,
                    Rotation = f,
                })
            })
        })
    end
    
    return DropdownTrigger
end

_modules["components/Elements/HyperGroup"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Containers/ElementList")
    
    local function HyperGroup(d)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = b.Color.Background,
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            LayoutOrder = d.LayoutOrder,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Small) }),
            Padding = a.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 8),
                PaddingBottom = UDim.new(0, 8),
            }),
            Content = a.createElement(c, {}, d.children)
        })
    end
    
    return HyperGroup
end

_modules["components/Elements/HyperIcon"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HyperIcon(c)
        local d = c.Size or 16
        
        return a.createElement("ImageLabel", {
            Size = UDim2.fromOffset(d, d),
            BackgroundTransparency = 1,
            Image = c.Icon or "",
            ImageColor3 = c.Color or b.Color.Text,
            LayoutOrder = c.LayoutOrder,
        })
    end
    
    return HyperIcon
end

_modules["components/Elements/HyperIconButton"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function HyperIconButton(d)
        return a.createElement(c, {
            Size = d.Size or UDim2.fromOffset(32, 32),
            Disabled = d.Disabled,
            OnActivated = d.Callback,
            LayoutOrder = d.LayoutOrder,
        }, {
            Icon = a.createElement("ImageLabel", {
                Size = UDim2.fromOffset(20, 20),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = d.Icon or "",
                ImageColor3 = b.Color.Text,
            })
        })
    end
    
    return HyperIconButton
end

_modules["components/Elements/HyperInput"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function HyperInput(d)
        return a.createElement(c, {
            Disabled = d.Disabled,
            LayoutOrder = d.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(0.4, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = d.Text or "Input",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Box = a.createElement("TextBox", {
                    Size = UDim2.new(0.6, -8, 0, 24),
                    Position = UDim2.new(0.4, 8, 0.5, -12),
                    BackgroundColor3 = b.Color.Background,
                    BackgroundTransparency = 0.5,
                    BorderSizePixel = 0,
                    Text = d.Value or "",
                    PlaceholderText = d.Placeholder or "Enter text...",
                    PlaceholderColor3 = b.Color.TextMuted,
                    TextColor3 = b.Color.Accent,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Small,
                    ClearTextOnFocus = false,
                    [a.Change.Text] = function(e)
                        if d.Callback then d.Callback(e.Text) end
                    end,
                }, {
                    UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
                    UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 1 }),
                    Padding = a.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) }),
                })
            })
        })
    end
    
    return HyperInput
end

_modules["components/Elements/HyperKeybind"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    local d = game:GetService("UserInputService")
    
    local function HyperKeybind(e)
        local f, g = a.useState(false)
        local h = e.Value or Enum.KeyCode.Unknown
        
        a.useEffect(function()
            if not f then return end
            
            local i = d.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Keyboard then
                    g(false)
                    if e.Callback then e.Callback(i.KeyCode) end
                end
            end)
            
            return function() i:Disconnect() end
        end, {f})
        
        return a.createElement(c, {
            OnActivated = function() g(true) end,
            LayoutOrder = e.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -100, 1, 0),
                    BackgroundTransparency = 1,
                    Text = e.Text or "Keybind",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                BindDisplay = a.createElement("Frame", {
                    Size = UDim2.fromOffset(80, 24),
                    Position = UDim2.new(1, -80, 0.5, -12),
                    BackgroundColor3 = f and b.Color.Accent or b.Color.Surface,
                    BackgroundTransparency = 0.5,
                    BorderSizePixel = 0,
                }, {
                    UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
                    Text = a.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 1),
                        BackgroundTransparency = 1,
                        Text = f and "..." or h.Name,
                        TextColor3 = b.Color.Text,
                        Font = b.Font.Bold,
                        TextSize = b.FontSize.Small,
                    })
                })
            })
        })
    end
    
    return HyperKeybind
end

_modules["components/Elements/HyperLabel"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HyperLabel(c)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = c.LayoutOrder,
        }, {
            Layout = a.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 2),
            }),
            Padding = a.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, b.Spacing[2]),
            }),
            Title = a.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                Text = c.Text or "Label",
                TextColor3 = b.Color.Text,
                Font = b.Font.Main,
                TextSize = b.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            }),
            Description = c.Description and a.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                Text = c.Description,
                TextColor3 = b.Color.TextMuted,
                Font = b.Font.Main,
                TextSize = b.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        })
    end
    
    return HyperLabel
end

_modules["components/Elements/HyperModal"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("hooks/useSpring")
    local c = _require("hooks/useTheme")
    
    local function HyperModal(d)
        local e = c(d.store)
        local f = d.Open or false
        
        
        local g = b(f and 1 or 0, { stiffness = 200, damping = 25 })
        
        return a.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.new(0, 0, 0),
            BackgroundTransparency = g:map(function(h) return 1 - (h * 0.5) end),
            Visible = g:map(function(h) return h > 0.01 end),
            ZIndex = 2000,
        }, {
            Content = a.createElement("Frame", {
                Size = UDim2.fromOffset(400, 250),
                Position = g:map(function(h) 
                    return UDim2.new(0.5, 0, 0.5, math.floor(30 * (1 - h))) 
                end),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = e.Color.Background,
                BorderSizePixel = 0,
                GroupTransparency = g:map(function(h) return 1 - h end),
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, e.Radius.Medium) }),
                UIStroke = a.createElement("UIStroke", { Color = e.Color.Border, Thickness = 2 }),
                Shadow = a.createElement("ImageLabel", {
                    Size = UDim2.new(1, 40, 1, 40),
                    Position = UDim2.fromOffset(-20, -20),
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://1316045217",
                    ImageColor3 = Color3.new(0, 0, 0),
                    ImageTransparency = 0.5,
                    ZIndex = 0,
                }),
                Header = a.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 48),
                    BackgroundTransparency = 1,
                }, {
                    Title = a.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 1),
                        BackgroundTransparency = 1,
                        Text = d.Title or "Modal",
                        TextColor3 = e.Color.Text,
                        Font = e.Font, 
                        TextSize = e.FontSize.Large,
                    }),
                    Divider = a.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 1),
                        Position = UDim2.fromScale(0, 1),
                        BackgroundColor3 = e.Color.Border,
                        BorderSizePixel = 0,
                    })
                }),
                Body = a.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -100),
                    Position = UDim2.fromOffset(0, 48),
                    BackgroundTransparency = 1,
                }, {
                    Padding = a.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 16),
                        PaddingBottom = UDim.new(0, 16),
                        PaddingLeft = UDim.new(0, 24),
                        PaddingRight = UDim.new(0, 24),
                    }),
                    Text = a.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 1),
                        BackgroundTransparency = 1,
                        Text = d.Content or "",
                        TextColor3 = e.Color.Text,
                        Font = e.Font,
                        TextSize = e.FontSize.Medium,
                        TextWrapped = true,
                        TextYAlignment = Enum.TextYAlignment.Top,
                    })
                }),
                Footer = a.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 52),
                    Position = UDim2.new(0, 0, 1, -52),
                    BackgroundTransparency = 1,
                }, {
                    Layout = a.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0, 12),
                    }),
                    Padding = a.createElement("UIPadding", { PaddingRight = UDim.new(0, 24) }),
                    Children = a.createElement(a.Fragment, {}, d.children)
                })
            })
        })
    end
    
    return HyperModal
end

_modules["components/Elements/HyperNumberInput"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function HyperNumberInput(d)
        return a.createElement(c, {
            Disabled = d.Disabled,
            LayoutOrder = d.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(0.4, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = d.Text or "Number",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Box = a.createElement("TextBox", {
                    Size = UDim2.new(0, 100, 0, 24),
                    Position = UDim2.new(1, -100, 0.5, -12),
                    BackgroundColor3 = b.Color.Background,
                    BackgroundTransparency = 0.5,
                    BorderSizePixel = 0,
                    Text = tostring(d.Value or d.Min or 0),
                    PlaceholderText = "0",
                    PlaceholderColor3 = b.Color.TextMuted,
                    TextColor3 = b.Color.Accent,
                    Font = b.Font.Bold,
                    TextSize = b.FontSize.Small,
                    [a.Change.Text] = function(e)
                        local f = string.gsub(e.Text, "[^%d.-]", "")
                        local g = tonumber(f)
                        if g then
                            if d.Min then g = math.max(d.Min, g) end
                            if d.Max then g = math.min(d.Max, g) end
                            if d.Callback then d.Callback(g) end
                        end
                    end,
                }, {
                    UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
                    UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 1 }),
                })
            })
        })
    end
    
    return HyperNumberInput
end

_modules["components/Elements/HyperProgressBar"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("hooks/useSpring")
    
    local function HyperProgressBar(d)
        local e = math.clamp(d.Value or 0, 0, 100)
        local f = c(e / 100, { damping = 0.8, stiffness = 0.2 })
        
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24),
            BackgroundTransparency = 1,
            LayoutOrder = d.LayoutOrder,
        }, {
            Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
            Label = d.Text and a.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 14),
                BackgroundTransparency = 1,
                Text = d.Text,
                TextColor3 = b.Color.TextMuted,
                Font = b.Font.Main,
                TextSize = b.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Track = a.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 8),
                BackgroundColor3 = b.Color.Surface,
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                Fill = a.createElement("Frame", {
                    Size = f:map(function(g) return UDim2.fromScale(g, 1) end),
                    BackgroundColor3 = b.Color.Accent,
                    BorderSizePixel = 0,
                }, {
                    UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                })
            })
        })
    end
    
    return HyperProgressBar
end

_modules["components/Elements/HyperSearchInput"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function HyperSearchInput(d)
        return a.createElement(c, {
            Disabled = d.Disabled,
            LayoutOrder = d.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Icon = a.createElement("ImageLabel", {
                    Size = UDim2.fromOffset(16, 16),
                    Position = UDim2.new(0, 0, 0.5, -8),
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://10723346959", 
                    ImageColor3 = b.Color.TextMuted,
                }),
                Box = a.createElement("TextBox", {
                    Size = UDim2.new(1, -24, 0, 24),
                    Position = UDim2.new(0, 24, 0.5, -12),
                    BackgroundTransparency = 1,
                    Text = d.Value or "",
                    PlaceholderText = d.Placeholder or "Search...",
                    PlaceholderColor3 = b.Color.TextMuted,
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ClearTextOnFocus = false,
                    [a.Change.Text] = function(e)
                        if d.Callback then d.Callback(e.Text) end
                    end,
                })
            })
        })
    end
    
    return HyperSearchInput
end

_modules["components/Elements/HyperSlider"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("components/Elements/BaseElement")
    local c = _require("hooks/useSpring")
    local d = _require("hooks/useTheme")
    
    local function HyperSlider(e)
        local f = d(e.store)
        local g = e.Min or 0
        local h = e.Max or 100
        
        local i, j = a.useState(e.Value or g)
        local k = a.useRef(false)
        
        local l = (i - g) / (h - g)
        local m = c(l, { stiffness = 300, damping = 30 })
        
        local function updateValue(n, o, p)
            local q = math.clamp((n - o) / p, 0, 1)
            local r = g + (q * (h - g))
            
            j(r) 
            if e.Callback then
                e.Callback(r)
            end
        end
        
        
        a.useEffect(function()
            if e.Value ~= nil and math.abs(e.Value - i) > 0.001 then
                j(e.Value)
            end
        end, {e.Value})
    
        return a.createElement(b, {
            Disabled = e.Disabled,
            LayoutOrder = e.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, f.Spacing[3]),
                    PaddingRight = UDim.new(0, f.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -120, 0.5, 0),
                    BackgroundTransparency = 1,
                    Text = e.Text or "Slider",
                    TextColor3 = f.Color.Text,
                    Font = f.Font,
                    TextSize = f.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                ValueLabel = a.createElement("TextLabel", {
                    Size = UDim2.new(0, 50, 0.5, 0),
                    Position = UDim2.new(1, -50, 0, 0),
                    BackgroundTransparency = 1,
                    Text = tostring(math.floor(i)),
                    TextColor3 = f.Color.Accent,
                    Font = f.Font,
                    TextSize = f.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Right,
                }),
                Track = a.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 4),
                    Position = UDim2.new(0, 0, 0.8, -2),
                    BackgroundColor3 = f.Color.Surface,
                    BorderSizePixel = 0,
                }, {
                    UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                    Fill = a.createElement("Frame", {
                        Size = m:map(function(n) return UDim2.fromScale(n, 1) end),
                        BackgroundColor3 = f.Color.Accent,
                        BorderSizePixel = 0,
                    }, {
                        UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                    }),
                    
                    Trigger = a.createElement("TextButton", {
                        Size = UDim2.new(1, 0, 0, 20),
                        Position = UDim2.fromScale(0, 0.5),
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        Text = "",
                        [a.Event.InputBegan] = function(n, o)
                            if o.UserInputType == Enum.UserInputType.MouseButton1 then
                                k.current = true
                                updateValue(o.Position.X, n.AbsolutePosition.X, n.AbsoluteSize.X)
                            end
                        end,
                        [a.Event.InputEnded] = function(n, o)
                            if o.UserInputType == Enum.UserInputType.MouseButton1 then
                                k.current = false
                            end
                        end,
                        [a.Event.InputChanged] = function(n, o)
                            if k.current and (o.UserInputType == Enum.UserInputType.MouseMovement or o.UserInputType == Enum.UserInputType.Touch) then
                                updateValue(o.Position.X, n.AbsolutePosition.X, n.AbsoluteSize.X)
                            end
                        end,
                    })
                })
            })
        })
    end
    
    return HyperSlider
end

_modules["components/Elements/HyperSpacer"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    
    local function HyperSpacer(b)
        local c = b.Height or 10
        
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, c),
            BackgroundTransparency = 1,
            LayoutOrder = b.LayoutOrder,
        })
    end
    
    return HyperSpacer
end

_modules["components/Elements/HyperStatDisplay"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function HyperStatDisplay(d)
        return a.createElement(c, {
            Size = UDim2.new(1, 0, 0, 60),
            Disabled = true, 
            LayoutOrder = d.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Title = a.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 20),
                    Position = UDim2.fromOffset(0, 8),
                    BackgroundTransparency = 1,
                    Text = d.Title or "Metric",
                    TextColor3 = b.Color.TextMuted,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Value = a.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 30),
                    Position = UDim2.fromOffset(0, 24),
                    BackgroundTransparency = 1,
                    Text = d.Value or "0",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Bold,
                    TextSize = b.FontSize.Title,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                SubValue = d.SubValue and a.createElement("TextLabel", {
                    Size = UDim2.new(0, 100, 0, 20),
                    Position = UDim2.new(1, -100, 1, -24),
                    BackgroundTransparency = 1,
                    Text = d.SubValue,
                    TextColor3 = b.Color.Success,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Right,
                })
            })
        })
    end
    
    return HyperStatDisplay
end

_modules["components/Elements/HyperStatusIndicator"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HyperStatusIndicator(c)
        local d = {
            Online = b.Color.Success,
            Warning = b.Color.Warning,
            Offline = b.Color.Error,
            Busy = Color3.fromRGB(255, 85, 255),
        }
        
        local e = d[c.Status] or b.Color.TextMuted
        
        return a.createElement("Frame", {
            Size = UDim2.fromOffset(10, 10),
            BackgroundColor3 = e,
            BorderSizePixel = 0,
            LayoutOrder = c.LayoutOrder,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
            Glow = a.createElement("ImageLabel", {
                Size = UDim2.fromScale(3, 3),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = "rbxassetid://1316045217", 
                ImageColor3 = e,
                ImageTransparency = 0.5,
            })
        })
    end
    
    return HyperStatusIndicator
end

_modules["components/Elements/HyperTag"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HyperTag(c)
        return a.createElement("Frame", {
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundColor3 = b.Color.Surface,
            BorderSizePixel = 0,
            LayoutOrder = c.LayoutOrder,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
            UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 1 }),
            Padding = a.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4),
                PaddingBottom = UDim.new(0, 4),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
            }),
            Layout = a.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 8),
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            Label = a.createElement("TextLabel", {
                Size = UDim2.fromScale(0, 0),
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1,
                Text = c.Text or "Tag",
                TextColor3 = b.Color.Text,
                Font = b.Font.Main,
                TextSize = b.FontSize.Small,
            }),
            Close = c.OnDismiss and a.createElement("TextButton", {
                Size = UDim2.fromOffset(12, 12),
                BackgroundTransparency = 1,
                Text = "×",
                TextColor3 = b.Color.TextMuted,
                Font = b.Font.Bold,
                TextSize = 14,
                [a.Event.Activated] = c.OnDismiss,
            })
        })
    end
    
    return HyperTag
end

_modules["components/Elements/HyperTextArea"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function HyperTextArea(d)
        return a.createElement(c, {
            Size = UDim2.new(1, 0, 0, 100), 
            Disabled = d.Disabled,
            LayoutOrder = d.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, b.Spacing[2]),
                    PaddingBottom = UDim.new(0, b.Spacing[2]),
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Box = a.createElement("TextBox", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    Text = d.Value or "",
                    PlaceholderText = d.Placeholder or "Enter long text...",
                    PlaceholderColor3 = b.Color.TextMuted,
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    TextWrapped = true,
                    MultiLine = true,
                    ClearTextOnFocus = false,
                    [a.Change.Text] = function(e)
                        if d.Callback then d.Callback(e.Text) end
                    end,
                })
            })
        })
    end
    
    return HyperTextArea
end

_modules["components/Elements/HyperToast"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("components/Elements/BaseElement")
    local c = _require("hooks/useTheme")
    
    local function HyperToast(d)
        local e = c(d.store)
        local f = {
            Info = e.Color.Accent,
            Success = e.Color.Success,
            Warning = e.Color.Warning,
            Error = e.Color.Error,
        }
        
        local g = f[d.Priority] or e.Color.Accent
        
        return a.createElement(b, {
            Size = UDim2.new(0, 300, 0, 60),
            BackgroundColor3 = e.Color.Surface,
            BackgroundTransparency = 0.1,
        }, {
            UIStroke = a.createElement("UIStroke", {
                Color = g,
                Thickness = 1,
                Transparency = 0.5,
            }),
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, e.Spacing[3]),
                    PaddingRight = UDim.new(0, e.Spacing[3]),
                }),
                Icon = d.Icon and a.createElement("ImageLabel", {
                    Size = UDim2.fromOffset(24, 24),
                    Position = UDim2.new(0, 0, 0.5, -12),
                    BackgroundTransparency = 1,
                    Image = d.Icon,
                    ImageColor3 = g,
                }),
                Content = a.createElement("Frame", {
                    Size = UDim2.new(1, d.Icon and -32 or 0, 1, 0),
                    Position = UDim2.new(0, d.Icon and 32 or 0, 0, 0),
                    BackgroundTransparency = 1,
                }, {
                    Layout = a.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0, 2),
                    }),
                    Title = a.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 16),
                        BackgroundTransparency = 1,
                        Text = d.Title or "Notification",
                        TextColor3 = g,
                        Font = e.Font.Bold,
                        TextSize = e.FontSize.Medium,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    }),
                    Text = a.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 14),
                        BackgroundTransparency = 1,
                        Text = d.Content or "",
                        TextColor3 = e.Color.Text,
                        Font = e.Font.Main,
                        TextSize = e.FontSize.Small,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                    })
                })
            })
        })
    end
    
    return HyperToast
end

_modules["components/Elements/HyperToggle"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("components/Elements/BaseElement")
    local c = _require("hooks/useSpring")
    local d = _require("hooks/useTheme")
    
    local function HyperToggle(e)
        local f = d(e.store)
        local g = e.Value or false
        
        
        local h = c(g and 1 or 0, { stiffness = 300, damping = 30 })
        
        return a.createElement(b, {
            Disabled = e.Disabled,
            OnActivated = function()
                if e.Callback then e.Callback(not g) end
            end,
            LayoutOrder = e.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, f.Spacing[3]),
                    PaddingRight = UDim.new(0, f.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -50, 1, 0),
                    BackgroundTransparency = 1,
                    Text = e.Text or "Toggle",
                    TextColor3 = f.Color.Text,
                    Font = f.Font,
                    TextSize = f.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                SwitchTrack = a.createElement("Frame", {
                    Size = UDim2.fromOffset(40, 20),
                    Position = UDim2.new(1, -40, 0.5, -10),
                    BackgroundColor3 = h:map(function(i)
                        return f.Color.Surface:Lerp(f.Color.Accent, i)
                    end),
                    BorderSizePixel = 0,
                }, {
                    UICorner = a.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }),
                    Handle = a.createElement("Frame", {
                        Size = UDim2.fromOffset(16, 16),
                        Position = h:map(function(i)
                            return UDim2.new(0, 2 + (20 * i), 0.5, -8)
                        end),
                        BackgroundColor3 = f.Color.Text,
                        BorderSizePixel = 0,
                    }, {
                        UICorner = a.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        })
                    })
                })
            })
        })
    end
    
    return HyperToggle
end

_modules["components/Elements/HyperTooltip"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("hooks/useSpring")
    
    local function HyperTooltip(d)
        local e = d.Visible or false
        local f = c(e and 1 or 0, { damping = 0.8, stiffness = 0.2 })
        
        return a.createElement("Frame", {
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundColor3 = b.Color.Background,
            BackgroundTransparency = f:map(function(g) return 1 - (g * 0.9) end),
            Position = d.Position or UDim2.fromScale(0.5, 0),
            AnchorPoint = Vector2.new(0.5, 1.2),
            ZIndex = 1000,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
            UIStroke = a.createElement("UIStroke", {
                Color = b.Color.Border,
                Transparency = f:map(function(g) return 1 - g end),
            }),
            Padding = a.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4),
                PaddingBottom = UDim.new(0, 4),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
            }),
            Label = a.createElement("TextLabel", {
                Size = UDim2.fromScale(0, 0),
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1,
                Text = d.Text or "Tooltip",
                TextColor3 = b.Color.Text,
                TextTransparency = f:map(function(g) return 1 - g end),
                Font = b.Font.Main,
                TextSize = b.FontSize.Small,
            })
        })
    end
    
    return HyperTooltip
end

_modules["components/Root"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("components/Window")
    
    local function Root(c)
        local d, e = a.useState(c.store:GetState())
        
        a.useEffect(function()
            local f = c.store:OnUpdate(function(f)
                e(f)
            end)
            return f
        end, {c.store})
        
        local f = {}
        for g, h in pairs(d.registry or {}) do
            if h.type == "Window" then
                table.insert(f, a.createElement(b, {
                    key = g,
                    id = g,
                    store = c.store,
                }))
            end
        end
        
        
        
        return a.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, f)
    end
    
    return Root
end

_modules["components/Window"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("hooks/useTree")
    local c = _require("hooks/useSpring")
    local d = _require("theme/tokens")
    
    local e = _require("components/Window/TabContainer") 
    
    local f = _require("hooks/useTheme")
    
    local function Window(g)
        local h = f(g.store)
        local i = b(g.store, g.id)
        if not i or not i.props.active then return nil end
        
        
        local j = i.props.active and 1 or 0
        local k = c(j, { stiffness = 300, damping = 30 })
        
        local l = i.props.Position or UDim2.new(0.5, -300, 0.5, -200)
        
        return a.createElement("Frame", {
            Size = UDim2.fromOffset(600, 400),
            Position = l,
            BackgroundColor3 = h.Color.Background,
            BorderSizePixel = 0,
            ZIndex = i.props.zIndex or 1,
            Visible = k:map(function(m) return m > 0.01 end),
        }, {
            UICorner = a.createElement("UICorner", {
                CornerRadius = UDim.new(0, h.Radius.Large)
            }),
            UIStroke = a.createElement("UIStroke", {
                Color = h.Color.Border,
                Thickness = 1,
            }),
            TitleBar = a.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 40),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                [a.Event.InputBegan] = function(m, n)
                    if n.UserInputType == Enum.UserInputType.MouseButton1 then
                        
                        local o = (getgenv and getgenv() or _G).__HyperUI_Instance
                        if o and o.Runtime.Input then
                            o.Runtime.Input.DraggingInstance = g.id
                            o.Runtime.Input.DragOffset = n.Position - m.Parent.AbsolutePosition
                        end
                    end
                end,
            }, {
                TitleLabel = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -80, 1, 0),
                    Position = UDim2.fromOffset(h.Spacing[4], 0),
                    BackgroundTransparency = 1,
                    Text = i.props.title or "HyperUI",
                    TextColor3 = h.Color.Text,
                    Font = h.Font,
                    TextSize = h.FontSize.Large,
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
            }),
            
            Content = a.createElement(e, {
                windowId = g.id,
                store = g.store,
                tabs = i.children,
            })
        })
    end
    
    return Window
end

_modules["components/Window/TabContainer"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("hooks/useTheme")
    local c = _require("components/Elements/HyperButton")
    local d = _require("hooks/useTree")
    
    local e = _require("components/Containers/Section")
    
    local function TabContainer(f)
        local g = b(f.store)
        local h = f.tabs and f.tabs[1] or nil
        local i, j = a.useState(h)
        
        local k = {}
        if f.tabs then
            for l, m in ipairs(f.tabs) do
                local n = d(f.store, m)
                if n then
                    local o = i == m
                    
                    table.insert(k, a.createElement(c, {
                        Text = n.props.title or "Tab",
                        Selected = o,
                        BackgroundColor3 = o and g.Color.Accent or g.Color.Surface,
                        Font = o and g.Font.Bold or g.Font.Main,
                        LayoutOrder = l,
                        Callback = function()
                            j(m)
                        end
                    }))
                end
            end
        end
        
        
        local l = i and d(f.store, i) or nil
        local m = {}
        if l then
            for n, o in ipairs(l.children) do
                table.insert(m, a.createElement(e, {
                    id = o,
                    store = f.store,
                }))
            end
        end
        
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -40),
            Position = UDim2.fromOffset(0, 40),
            BackgroundTransparency = 1,
        }, {
            Sidebar = a.createElement("Frame", {
                Size = UDim2.new(0, 150, 1, 0),
                BackgroundColor3 = g.Color.Surface,
                BackgroundTransparency = 0.5,
                BorderSizePixel = 0,
            }, {
                Layout = a.createElement("UIListLayout", {
                    Padding = UDim.new(0, g.Spacing[1]),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }),
                Items = a.createElement(a.Fragment, {}, k),
            }),
            MainContent = a.createElement("ScrollingFrame", {
                Size = UDim2.new(1, -150, 1, 0),
                Position = UDim2.fromOffset(150, 0),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ScrollBarThickness = 2,
                ScrollBarImageColor3 = g.Color.Accent,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, g.Spacing[4]),
                    PaddingLeft = UDim.new(0, g.Spacing[4]),
                    PaddingRight = UDim.new(0, g.Spacing[4]),
                    PaddingBottom = UDim.new(0, g.Spacing[4]),
                }),
                Layout = a.createElement("UIListLayout", {
                    Padding = UDim.new(0, g.Spacing[4]),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }),
                Sections = a.createElement(a.Fragment, {}, m),
            })
        })
    end
    
    return TabContainer
end

_modules["core/config"] = function()
    
    
    
    
    
    local a = game:GetService("HttpService")
    
    local b = {}
    b.__index = b
    
    function b.new(c, d)
        local e = setmetatable({
            Store = c,
            FileName = d.FileName or "HyperUI_Config.json",
            AutoSave = d.AutoSave ~= false,
            Data = {},
        }, b)
        
        
        e.Store:OnUpdate(function(f)
            if not e.AutoSave then return end
            
            local g = false
            for h, i in pairs(f.registry or {}) do
                if i.props and i.props.value ~= nil then
                    if not e.Data[h] or e.Data[h].value ~= i.props.value then
                        e.Data[h] = { value = i.props.value }
                        g = true
                    end
                end
            end
            
            if g then
                e:Save()
            end
        end)
        
        return e
    end
    
    function b:Save(c)
        local d, e = pcall(function()
            local d = a:JSONEncode(self.Data)
            writefile(self.FileName, d)
        end)
        
        if not d then
            warn("[HyperUI] Failed to save config:", e)
        end
        return d
    end
    
    function b:Load()
        if not isfile(self.FileName) then return false end
        
        local c, d = pcall(function()
            local c = readfile(self.FileName)
            return a:JSONDecode(c)
        end)
        
        if c and type(d) == "table" then
            self.Data = d
            
            for e, f in pairs(self.Data) do
                self.Store:Dispatch({
                    type = "UPDATE_ELEMENT",
                    id = e,
                    props = f
                })
            end
            return true
        end
        
        return false
    end
    
    function b:UpdateValue(c, d, e)
        if not self.Data[c] then
            self.Data[c] = {}
        end
        self.Data[c][d] = e
        
        if self.AutoSave then
            self:Save()
        end
    end
    
    return b
end

_modules["core/signal/Signal"] = function()
    
    
    
    
    
    local a = {}
    a.__index = a
    
    function a.new()
        return setmetatable({
            _listeners = {}
        }, a)
    end
    
    function a:Connect(b)
        local c = {
            callback = b,
            connected = true
        }
        
        function c:Disconnect()
            c.connected = false
        end
        
        table.insert(self._listeners, c)
        return c
    end
    
    function a:Fire(...)
        local b = self._listeners
        local c = 1
        
        while c <= #b do
            local d = b[c]
            if d.connected then
                task.spawn(d.callback, ...)
                c = c + 1
            else
                table.remove(b, c)
            end
        end
    end
    
    function a:Wait()
        local b = coroutine.running()
        local c
        c = self:Connect(function(...)
            c:Disconnect()
            task.spawn(b, ...)
        end)
        return coroutine.yield()
    end
    
    function a:Destroy()
        for b, c in ipairs(self._listeners) do
            c.connected = false
        end
        self._listeners = {}
    end
    
    return a
end

_modules["core/store"] = function()
    
    
    
    
    
    
    local a = {}
    a.__index = a
    
    function a.new()
        local b = {
            windows = {},
            notifications = {},
            theme = "Default",
            registry = {}, 
        }
    
        local c = setmetatable({
            _state = b,
            _listeners = {},
            _subscribers = {}, 
        }, a)
        
        return c
    end
    
    function a:GetState()
        return self._state
    end
    
    
    local function DeepCopy(b)
        local c = {}
        for d, e in pairs(b) do
            if type(e) == "table" then
                c[d] = DeepCopy(e)
            else
                c[d] = e
            end
        end
        return c
    end
    
    function a:Dispatch(b)
        local c = self._state
        local d = DeepCopy(c)
        
        local e = {} 
        
        if b.type == "ADD_WINDOW" then
            local f = b.window
            d.windows[f.id] = f
            d.registry[f.id] = {
                type = "Window",
                props = f,
                children = {},
            }
        elseif b.type == "UPDATE_ELEMENT" then
            local f = d.registry[b.id]
            if f then
                for g, h in pairs(b.props) do
                    f.props[g] = h
                end
                table.insert(e, b.id)
            end
        elseif b.type == "ADD_TAB" then
            local f = d.registry[b.windowId]
            if f then
                d.registry[b.tab.id] = {
                    type = "Tab",
                    props = b.tab,
                    children = {},
                    parentId = b.windowId,
                }
                table.insert(f.children, b.tab.id)
                table.insert(e, b.windowId)
            end
        elseif b.type == "ADD_SECTION" then
            local f = d.registry[b.tabId]
            if f then
                d.registry[b.section.id] = {
                    type = "Section",
                    props = b.section,
                    children = {},
                    parentId = b.tabId,
                }
                table.insert(f.children, b.section.id)
                table.insert(e, b.tabId)
            end
        elseif b.type == "ADD_ELEMENT" then
            local f = d.registry[b.parentId]
            if f then
                d.registry[b.element.id] = {
                    type = b.element.type,
                    props = b.element.props,
                    children = {},
                    parentId = b.parentId,
                }
                table.insert(f.children, b.element.id)
                table.insert(e, b.parentId)
            end
        elseif b.type == "SET_THEME" then
            d.theme = b.theme
        elseif b.type == "ADD_NOTIFICATION" then
            d.notifications[b.notification.id] = b.notification
        elseif b.type == "REMOVE_NOTIFICATION" then
            d.notifications[b.id] = nil
        end
        
        self._state = d
        
        
        for f, g in ipairs(self._listeners) do
            task.spawn(g, d, c)
        end
        
        
        for f, g in ipairs(e) do
            if self._subscribers[g] then
                for h, i in ipairs(self._subscribers[g]) do
                    task.spawn(i, d.registry[g])
                end
            end
        end
    end
    
    function a:Subscribe(b, c)
        if not self._subscribers[b] then
            self._subscribers[b] = {}
        end
        table.insert(self._subscribers[b], c)
        
        return function()
            local d = self._subscribers[b]
            if d then
                local e = table.find(d, c)
                if e then
                    table.remove(d, e)
                end
            end
        end
    end
    
    function a:OnUpdate(b)
        table.insert(self._listeners, b)
        return function()
            local c = table.find(self._listeners, b)
            if c then
                table.remove(self._listeners, c)
            end
        end
    end
    
    function a:Destroy()
        self._state = nil
        self._listeners = {}
        self._subscribers = {}
    end
    
    return a
end

_modules["core/tree"] = function()
    
    
    
    
    
    local a = {}
    
    function a.createNode(b, c, d, e)
        return {
            id = b,
            type = c,
            props = d or {},
            children = {},
            parentId = e,
            visible = true,
        }
    end
    
    
    function a.reconcile(b, c)
        
        
    end
    
    return a
end

_modules["dependencies/React"] = function()
    
    return _require("Packages/React")
end

_modules["dependencies/ReactRoblox"] = function()
    
    return _require("Packages/ReactRoblox")
end

_modules["hooks/useInteractionState"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    
    local function useInteractionState(b)
        local c, d = a.useState(false)
        local e, f = a.useState(false)
        local g, h = a.useState(false)
        
        local i = {}
        
        if b ~= false then
            i = {
                [a.Event.MouseEnter] = function() d(true) end,
                [a.Event.MouseLeave] = function() 
                    d(false)
                    f(false)
                end,
                [a.Event.MouseButton1Down] = function() f(true) end,
                [a.Event.MouseButton1Up] = function() f(false) end,
                [a.Event.Focused] = function() h(true) end,
                [a.Event.FocusLost] = function() h(false) end,
            }
        end
        
        return {
            hovered = c,
            pressed = e,
            focused = g,
            bindings = i
        }
    end
    
    return useInteractionState
end

_modules["hooks/useSpring"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    local b = game:GetService("RunService")
    
    local function useSpring(c, d)
        local e = d or { stiffness = 170, damping = 26 }
        
        
        local f, g = a.useBinding(c)
        
        
        local h = a.useRef(c)
        local i = a.useRef(0)
        
        a.useEffect(function()
            local j
            
            j = b.RenderStepped:Connect(function(k)
                local l = h.current - c
                local m = -e.stiffness * l
                local n = -e.damping * i.current
                local o = m + n
                
                i.current = i.current + o * k
                h.current = h.current + i.current * k
                
                g(h.current)
                
                
                if math.abs(i.current) < 0.001 and math.abs(h.current - c) < 0.001 then
                    h.current = c
                    i.current = 0
                    g(c)
                    j:Disconnect()
                end
            end)
            
            return function()
                if j then j:Disconnect() end
            end
        end, {c, e.stiffness, e.damping})
        
        return f
    end
    
    return useSpring
end

_modules["hooks/useTheme"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function useTheme(c)
        
        local d, e = a.useState(c:GetState())
        
        a.useEffect(function()
            local f = c:OnUpdate(function(f)
                e(f)
            end)
            return f
        end, {c})
        
        local f = d.theme or "Default"
        return b:Get(f)
    end
    
    return useTheme
end

_modules["hooks/useTree"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    
    local function useTree(b, c)
        local d, e = a.useState(function()
            return b:GetState().registry[c]
        end)
        
        a.useEffect(function()
            local f = b:Subscribe(c, function(f)
                e(f)
            end)
            
            return function()
                f()
            end
        end, {b, c})
        
        return d
    end
    
    return useTree
end

_modules["main"] = function()
    
    
    
    
    
    local a = {}
    a.__index = a
    
    
    
    local function CheckExistingInstance()
        local b = getgenv and getgenv() or _G
        if b.__HyperUI_Instance then
            local c = b.__HyperUI_Instance
            pcall(function()
                c:Destroy()
            end)
            b.__HyperUI_Instance = nil
        end
    end
    
    function a.new()
        CheckExistingInstance()
        
        local b = setmetatable({}, a)
        
        
        b.Store = _require("core/store").new()
        
        b.WindowManager = _require("managers/WindowManager").new(b.Store)
        b.NotificationManager = _require("managers/NotificationManager").new(b.Store)
        b.ThemeManager = _require("managers/ThemeManager").new(b.Store)
        b.FocusManager = _require("managers/FocusManager").new(b.Store)
        b.Config = _require("core/config").new(b.Store, {
            FileName = "HyperUI_V2_Config.json",
            AutoSave = true
        })
        
        
        b.Runtime = _require("runtime/mount").new(b.Store)
        
        
        local c = getgenv and getgenv() or _G
        c.__HyperUI_Instance = b
        
        return b
    end
    
    function a:CreateWindow(b)
        local c = _require("api")
        local d = game:GetService("HttpService"):GenerateGUID(false)
        
        self.Store:Dispatch({
            type = "ADD_WINDOW",
            window = {
                id = d,
                title = b.Title or "HyperUI",
                icon = b.Icon,
                active = true,
            }
        })
        
        self.WindowManager:RegisterWindow(d)
        
        return c.Window.new(d, self.Store)
    end
    
    function a:Notify(b)
        return self.NotificationManager:Notify(b)
    end
    
    function a:SetTheme(b)
        return self.ThemeManager:SetTheme(b)
    end
    
    function a:Destroy()
        if self.Runtime then
            self.Runtime:Unmount()
        end
        
        local b = getgenv and getgenv() or _G
        if b.__HyperUI_Instance == self then
            b.__HyperUI_Instance = nil
        end
        
        
        self.Store:Destroy()
    end
    
    return a
end

_modules["managers/FocusManager"] = function()
    
    
    
    
    
    local a = _require("core/signal/Signal")
    
    local b = {}
    b.__index = b
    
    function b.new(c)
        local d = setmetatable({
            Store = c,
            FocusedElement = nil,
            FocusChanged = a.new(),
        }, b)
        
        return d
    end
    
    function b:RequestFocus(c)
        if self.FocusedElement == c then return end
        
        local d = self.FocusedElement
        self.FocusedElement = c
        
        
        if d then
            self.Store:Dispatch({
                type = "UPDATE_ELEMENT",
                id = d,
                props = { focused = false }
            })
        end
        
        if c then
            self.Store:Dispatch({
                type = "UPDATE_ELEMENT",
                id = c,
                props = { focused = true }
            })
        end
        
        self.FocusChanged:Fire(c, d)
    end
    
    function b:ClearFocus()
        self:RequestFocus(nil)
    end
    
    function b:GetFocus()
        return self.FocusedElement
    end
    
    function b:Destroy()
        self.FocusChanged:Destroy()
    end
    
    return b
end

_modules["managers/NotificationManager"] = function()
    
    
    
    
    
    local a = {}
    a.__index = a
    
    function a.new(b)
        local c = setmetatable({
            Store = b,
            Queue = {},
        }, a)
        
        return c
    end
    
    function a:Notify(b)
        local c = game:GetService("HttpService"):GenerateGUID(false)
        local d = {
            id = c,
            title = b.Title or "Notification",
            content = b.Content or "",
            icon = b.Icon,
            duration = b.Duration or 5,
            priority = b.Priority or "Info", 
            createdAt = os.clock(),
        }
        
        table.insert(self.Queue, d)
        
        self.Store:Dispatch({
            type = "ADD_NOTIFICATION",
            notification = d
        })
        
        
        task.delay(d.duration, function()
            self:Dismiss(c)
        end)
        
        return c
    end
    
    function a:Dismiss(b)
        local c     
    for d, e in ipairs(self.Queue) do
            if e.id == b then
                c = d
                break
            end
        end
        
        if c then
            table.remove(self.Queue, c)
            self.Store:Dispatch({
                type = "REMOVE_NOTIFICATION",
                id = b
            })
        end
    end
    
    return a
end

_modules["managers/ThemeManager"] = function()
    
    
    
    
    local a = {}
    a.__index = a
    
    function a.new(b)
        local c = setmetatable({
            Store = b,
        }, a)
        
        return c
    end
    
    function a:SetTheme(b)
        self.Store:Dispatch({
            type = "SET_THEME",
            theme = b,
        })
    end
    
    return a
end

_modules["managers/WindowManager"] = function()
    
    
    
    
    
    local a = {}
    a.__index = a
    
    function a.new(b)
        local c = setmetatable({
            Store = b,
            Windows = {}, 
        }, a)
        
        return c
    end
    
    function a:FocusWindow(b)
        local c = table.find(self.Windows, b)
        if c then
            table.remove(self.Windows, c)
        end
        table.insert(self.Windows, b)
        
        
        for d, e in ipairs(self.Windows) do
            self.Store:Dispatch({
                type = "UPDATE_ELEMENT",
                id = e,
                props = { 
                    zIndex = d,
                    focused = (e == b)
                }
            })
        end
    end
    
    function a:RegisterWindow(b)
        table.insert(self.Windows, b)
        self:FocusWindow(b)
    end
    
    function a:UnregisterWindow(b)
        local c = table.find(self.Windows, b)
        if c then
            table.remove(self.Windows, c)
        end
    end
    
    return a
end

_modules["runtime/input"] = function()
    
    
    
    
    
    local a = game:GetService("UserInputService")
    local b = game:GetService("RunService")
    
    local c = {}
    c.__index = c
    
    function c.new(d)
        local e = setmetatable({
            Store = d,
            DraggingInstance = nil,
            DragOffset = nil,
            Connections = {},
        }, c)
        
        e:Initialize()
        return e
    end
    
    function c:Initialize()
        table.insert(self.Connections, a.InputBegan:Connect(function(d, e)
            if d.UserInputType == Enum.UserInputType.MouseButton1 or d.UserInputType == Enum.UserInputType.Touch then
                self:HandleDragBegan(d)
            end
        end))
        
        table.insert(self.Connections, a.InputEnded:Connect(function(d)
            if d.UserInputType == Enum.UserInputType.MouseButton1 or d.UserInputType == Enum.UserInputType.Touch then
                self:HandleDragEnded()
            end
        end))
        
        table.insert(self.Connections, b.RenderStepped:Connect(function()
            self:UpdateDragging()
        end))
    end
    
    function c:HandleDragBegan(d)
        local e = self.Store:GetState()
        local f = a:GetMouseLocation()
        
        
        for g, h in pairs(e.registry or {}) do
            if h.type == "Window" and h.props.Visible ~= false then
                local i = h.props.Position or UDim2.new(0, 0, 0, 0)
                local j = h.props.Size or UDim2.new(0, 400, 0, 300)
                
                
                
                local k = i.X.Offset
                local l = i.Y.Offset
                local m = j.X.Offset
                local n = 30 
                
                if f.X >= k and f.X <= k + m and
                   f.Y >= l and f.Y <= l + n then
                    self.DraggingInstance = g
                    self.DragOffset = Vector2.new(f.X - k, f.Y - l)
                    break
                end
            end
        end
    end
    
    function c:HandleDragEnded()
        self.DraggingInstance = nil
        self.DragOffset = nil
    end
    
    function c:UpdateDragging()
        if self.DraggingInstance and self.DragOffset then
            local d = a:GetMouseLocation()
            local e = UDim2.fromOffset(d.X - self.DragOffset.X, d.Y - self.DragOffset.Y)
            
            self.Store:Dispatch({
                type = "UPDATE_ELEMENT",
                id = self.DraggingInstance,
                props = { Position = e }
            })
        end
    end
    
    function c:Destroy()
        for d, e in ipairs(self.Connections) do
            e:Disconnect()
        end
        self.Connections = {}
    end
    
    return c
end

_modules["runtime/mount"] = function()
    
    
    
    
    
    local a = {}
    a.__index = a
    
    local b = _require("dependencies/React")
    local c = _require("dependencies/ReactRoblox")
    local d = _require("components/Root")
    
    function a.new(e)
        local f = setmetatable({
            Store = e,
            Container = nil,
            Root = nil,
        }, a)
        
        f:CreateContainer()
        return f
    end
    
    local function getSafeGui()
        local e = game:GetService("CoreGui")
        local f = getgenv and getgenv().gethui
        local g = getgenv and getgenv().syn
        
        if g and g.protect_gui then
            local h = Instance.new("ScreenGui")
            g.protect_gui(h)
            h.Parent = e
            return h
        elseif f then
            local h = f()
            local i = Instance.new("ScreenGui")
            i.Parent = h
            return i
        else
            local h = Instance.new("ScreenGui")
            
            local i, j = pcall(function()
                h.Parent = e
            end)
            if not i then
                local k = game:GetService("Players").LocalPlayer
                if k then
                    local l = k:FindFirstChild("PlayerGui") or k:WaitForChild("PlayerGui", 5)
                    if l then
                        h.Parent = l
                    end
                end
            end
            return h
        end
    end
    
    function a:CreateContainer()
        local e = getSafeGui()
        if not e then return end
        
        e.Name = "HyperUI_" .. game:GetService("HttpService"):GenerateGUID(false):sub(1, 8)
        e.ResetOnSpawn = false
        e.IgnoreGuiInset = true
        e.DisplayOrder = 100
        
        self.Container = e
        
        
        local f = c.createRoot(e)
        f:render(b.createElement(d, { store = self.Store }))
        self.Root = f
    end
    
    function a:Unmount()
        if self.Root then
            local e, f = pcall(function() 
                self.Root:unmount() 
            end)
            if not e then
                warn("[HyperUI] Unmount error:", f)
            end
        end
        if self.Container then
            self.Container:Destroy()
        end
    end
    
    return a
end

_modules["theme/palette"] = function()
    local a = {
        Slate = {
            [50] = Color3.fromHex("#f8fafc"),
            [100] = Color3.fromHex("#f1f5f9"),
            [200] = Color3.fromHex("#e2e8f0"),
            [300] = Color3.fromHex("#cbd5e1"),
            [400] = Color3.fromHex("#94a3b8"),
            [500] = Color3.fromHex("#64748b"),
            [600] = Color3.fromHex("#475569"),
            [700] = Color3.fromHex("#334155"),
            [800] = Color3.fromHex("#1e293b"),
            [900] = Color3.fromHex("#0f172a"),
            [950] = Color3.fromHex("#020617"),
        },
        Neutral = {
            [50] = Color3.fromHex("#fafafa"),
            [100] = Color3.fromHex("#f5f5f5"),
            [200] = Color3.fromHex("#e5e5e5"),
            [300] = Color3.fromHex("#d4d4d4"),
            [400] = Color3.fromHex("#a3a3a3"),
            [500] = Color3.fromHex("#737373"),
            [600] = Color3.fromHex("#525252"),
            [700] = Color3.fromHex("#404040"),
            [800] = Color3.fromHex("#262626"),
            [900] = Color3.fromHex("#171717"),
            [950] = Color3.fromHex("#0a0a0a"),
        },
        Stone = {
            [50] = Color3.fromHex("#fafaf9"),
            [100] = Color3.fromHex("#f5f5f4"),
            [200] = Color3.fromHex("#e7e5e4"),
            [300] = Color3.fromHex("#d6d3d1"),
            [400] = Color3.fromHex("#a8a29e"),
            [500] = Color3.fromHex("#78716c"),
            [600] = Color3.fromHex("#57534e"),
            [700] = Color3.fromHex("#44403c"),
            [800] = Color3.fromHex("#292524"),
            [900] = Color3.fromHex("#1c1917"),
            [950] = Color3.fromHex("#0c0a09"),
        },
        Blue = {
            [50] = Color3.fromHex("#eff6ff"),
            [100] = Color3.fromHex("#dbeafe"),
            [200] = Color3.fromHex("#bfdbfe"),
            [300] = Color3.fromHex("#93c5fd"),
            [400] = Color3.fromHex("#60a5fa"),
            [500] = Color3.fromHex("#3b82f6"),
            [600] = Color3.fromHex("#2563eb"),
            [700] = Color3.fromHex("#1d4ed8"),
            [800] = Color3.fromHex("#1e40af"),
            [900] = Color3.fromHex("#1e3a8a"),
            [950] = Color3.fromHex("#172554"),
        },
        Sky = {
            [50] = Color3.fromHex("#f0f9ff"),
            [100] = Color3.fromHex("#e0f2fe"),
            [200] = Color3.fromHex("#bae6fd"),
            [300] = Color3.fromHex("#7dd3fc"),
            [400] = Color3.fromHex("#38bdf8"),
            [500] = Color3.fromHex("#0ea5e9"),
            [600] = Color3.fromHex("#0284c7"),
            [700] = Color3.fromHex("#0369a1"),
            [800] = Color3.fromHex("#075985"),
            [900] = Color3.fromHex("#0c4a6e"),
            [950] = Color3.fromHex("#082f49"),
        },
        Cyan = {
            [50] = Color3.fromHex("#ecfeff"),
            [100] = Color3.fromHex("#cffafe"),
            [200] = Color3.fromHex("#a5f3fc"),
            [300] = Color3.fromHex("#67e8f9"),
            [400] = Color3.fromHex("#22d3ee"),
            [500] = Color3.fromHex("#06b6d4"),
            [600] = Color3.fromHex("#0891b2"),
            [700] = Color3.fromHex("#0e7490"),
            [800] = Color3.fromHex("#155e75"),
            [900] = Color3.fromHex("#164e63"),
            [950] = Color3.fromHex("#083344"),
        },
        Emerald = {
            [50] = Color3.fromHex("#ecfdf5"),
            [100] = Color3.fromHex("#d1fae5"),
            [200] = Color3.fromHex("#a7f3d0"),
            [300] = Color3.fromHex("#6ee7b7"),
            [400] = Color3.fromHex("#34d399"),
            [500] = Color3.fromHex("#10b981"),
            [600] = Color3.fromHex("#059669"),
            [700] = Color3.fromHex("#047857"),
            [800] = Color3.fromHex("#065f46"),
            [900] = Color3.fromHex("#064e3b"),
            [950] = Color3.fromHex("#022c22"),
        },
        Teal = {
            [50] = Color3.fromHex("#f0fdfa"),
            [100] = Color3.fromHex("#ccfbf1"),
            [200] = Color3.fromHex("#99f6e4"),
            [300] = Color3.fromHex("#5eead4"),
            [400] = Color3.fromHex("#2dd4bf"),
            [500] = Color3.fromHex("#14b8a6"),
            [600] = Color3.fromHex("#0d9488"),
            [700] = Color3.fromHex("#0f766e"),
            [800] = Color3.fromHex("#115e59"),
            [900] = Color3.fromHex("#134e4a"),
            [950] = Color3.fromHex("#042f2e"),
        },
        Green = {
            [50] = Color3.fromHex("#f0fdf4"),
            [100] = Color3.fromHex("#dcfce7"),
            [200] = Color3.fromHex("#bbf7d0"),
            [300] = Color3.fromHex("#86efac"),
            [400] = Color3.fromHex("#4ade80"),
            [500] = Color3.fromHex("#22c55e"),
            [600] = Color3.fromHex("#16a34a"),
            [700] = Color3.fromHex("#15803d"),
            [800] = Color3.fromHex("#166534"),
            [900] = Color3.fromHex("#14532d"),
            [950] = Color3.fromHex("#052e16"),
        },
        Lime = {
            [50] = Color3.fromHex("#f7fee7"),
            [100] = Color3.fromHex("#ecfccb"),
            [200] = Color3.fromHex("#d9f99d"),
            [300] = Color3.fromHex("#bef264"),
            [400] = Color3.fromHex("#a3e635"),
            [500] = Color3.fromHex("#84cc16"),
            [600] = Color3.fromHex("#65a30d"),
            [700] = Color3.fromHex("#4d7c0f"),
            [800] = Color3.fromHex("#3f6212"),
            [900] = Color3.fromHex("#365314"),
            [950] = Color3.fromHex("#1a2e05"),
        },
        Yellow = {
            [50] = Color3.fromHex("#fefce8"),
            [100] = Color3.fromHex("#fef9c3"),
            [200] = Color3.fromHex("#fef08a"),
            [300] = Color3.fromHex("#fde047"),
            [400] = Color3.fromHex("#facc15"),
            [500] = Color3.fromHex("#eab308"),
            [600] = Color3.fromHex("#ca8a04"),
            [700] = Color3.fromHex("#a16207"),
            [800] = Color3.fromHex("#854d0e"),
            [900] = Color3.fromHex("#713f12"),
            [950] = Color3.fromHex("#422006"),
        },
        Amber = {
            [50] = Color3.fromHex("#fffbeb"),
            [100] = Color3.fromHex("#fef3c7"),
            [200] = Color3.fromHex("#fde68a"),
            [300] = Color3.fromHex("#fcd34d"),
            [400] = Color3.fromHex("#fbbf24"),
            [500] = Color3.fromHex("#f59e0b"),
            [600] = Color3.fromHex("#d97706"),
            [700] = Color3.fromHex("#b45309"),
            [800] = Color3.fromHex("#92400e"),
            [900] = Color3.fromHex("#78350f"),
            [950] = Color3.fromHex("#451a03"),
        },
        Orange = {
            [50] = Color3.fromHex("#fff7ed"),
            [100] = Color3.fromHex("#ffedd5"),
            [200] = Color3.fromHex("#fed7aa"),
            [300] = Color3.fromHex("#fdba74"),
            [400] = Color3.fromHex("#fb923c"),
            [500] = Color3.fromHex("#f97316"),
            [600] = Color3.fromHex("#ea580c"),
            [700] = Color3.fromHex("#c2410c"),
            [800] = Color3.fromHex("#9a3412"),
            [900] = Color3.fromHex("#7c2d12"),
            [950] = Color3.fromHex("#431407"),
        },
        Red = {
            [50] = Color3.fromHex("#fef2f2"),
            [100] = Color3.fromHex("#fee2e2"),
            [200] = Color3.fromHex("#fecaca"),
            [300] = Color3.fromHex("#fca5a5"),
            [400] = Color3.fromHex("#f87171"),
            [500] = Color3.fromHex("#ef4444"),
            [600] = Color3.fromHex("#dc2626"),
            [700] = Color3.fromHex("#b91c1c"),
            [800] = Color3.fromHex("#991b1b"),
            [900] = Color3.fromHex("#7f1d1d"),
            [950] = Color3.fromHex("#450a0a"),
        },
        Rose = {
            [50] = Color3.fromHex("#fff1f2"),
            [100] = Color3.fromHex("#ffe4e6"),
            [200] = Color3.fromHex("#fecdd3"),
            [300] = Color3.fromHex("#fda4af"),
            [400] = Color3.fromHex("#fb7185"),
            [500] = Color3.fromHex("#f43f5e"),
            [600] = Color3.fromHex("#e11d48"),
            [700] = Color3.fromHex("#be123c"),
            [800] = Color3.fromHex("#9f1239"),
            [900] = Color3.fromHex("#881337"),
            [950] = Color3.fromHex("#4c0519"),
        },
        Pink = {
            [50] = Color3.fromHex("#fdf2f8"),
            [100] = Color3.fromHex("#fce7f3"),
            [200] = Color3.fromHex("#fbcfe8"),
            [300] = Color3.fromHex("#f9a8d4"),
            [400] = Color3.fromHex("#f472b6"),
            [500] = Color3.fromHex("#ec4899"),
            [600] = Color3.fromHex("#db2777"),
            [700] = Color3.fromHex("#be185d"),
            [800] = Color3.fromHex("#9d174d"),
            [900] = Color3.fromHex("#831843"),
            [950] = Color3.fromHex("#500724"),
        },
        Fuchsia = {
            [50] = Color3.fromHex("#fdf4ff"),
            [100] = Color3.fromHex("#fae8ff"),
            [200] = Color3.fromHex("#f5d0fe"),
            [300] = Color3.fromHex("#f0abfc"),
            [400] = Color3.fromHex("#e879f9"),
            [500] = Color3.fromHex("#d946ef"),
            [600] = Color3.fromHex("#c026d3"),
            [700] = Color3.fromHex("#a21caf"),
            [800] = Color3.fromHex("#86198f"),
            [900] = Color3.fromHex("#701a75"),
            [950] = Color3.fromHex("#4a044e"),
        },
        Purple = {
            [50] = Color3.fromHex("#faf5ff"),
            [100] = Color3.fromHex("#f3e8ff"),
            [200] = Color3.fromHex("#e9d5ff"),
            [300] = Color3.fromHex("#d8b4fe"),
            [400] = Color3.fromHex("#c084fc"),
            [500] = Color3.fromHex("#a855f7"),
            [600] = Color3.fromHex("#9333ea"),
            [700] = Color3.fromHex("#7e22ce"),
            [800] = Color3.fromHex("#6b21a8"),
            [900] = Color3.fromHex("#581c87"),
            [950] = Color3.fromHex("#3b0764"),
        },
        Violet = {
            [50] = Color3.fromHex("#f5f3ff"),
            [100] = Color3.fromHex("#ede9fe"),
            [200] = Color3.fromHex("#ddd6fe"),
            [300] = Color3.fromHex("#c4b5fd"),
            [400] = Color3.fromHex("#a78bfa"),
            [500] = Color3.fromHex("#8b5cf6"),
            [600] = Color3.fromHex("#7c3aed"),
            [700] = Color3.fromHex("#6d28d9"),
            [800] = Color3.fromHex("#5b21b6"),
            [900] = Color3.fromHex("#4c1d95"),
            [950] = Color3.fromHex("#2e1065"),
        },
        White = Color3.fromHex("#ffffff"),
        Black = Color3.fromHex("#000000"),
        Transparent = Color3.new(0, 0, 0),
    }
    
    return a
end

_modules["theme/shadows"] = function()
    
    
    
    
    
    local a = {
        Small = {
            Color = Color3.new(0, 0, 0),
            Transparency = 0.8,
            Thickness = 1,
        },
        Medium = {
            Color = Color3.new(0, 0, 0),
            Transparency = 0.6,
            Thickness = 2,
        },
        Large = {
            Color = Color3.new(0, 0, 0),
            Transparency = 0.4,
            Thickness = 4,
        }
    }
    
    return a
end

_modules["theme/tokens"] = function()
    
    
    
    
    
    
    local a = _require("theme/palette")
    local b = _require("theme/typography")
    local c = _require("theme/shadows")
    
    
    
    
    
    local function buildTheme(d, e, f, g, h)
        return {
            Color      = d,
            Spacing    = e or {
                [1] = 4, [2] = 8, [3] = 12,
                [4] = 16, [6] = 24, [8] = 32,
            },
            Radius     = f or {
                Small = 4, Medium = 8, Large = 12, Full = 999,
            },
            Typography = g or b,
            Shadows    = h    or c,
            
            Font     = (g or b).Font,
            FontSize = (g or b).Size,
        }
    end
    
    
    
    
    
    local d = {}
    
    
    d.Default = buildTheme({
        Background  = a.Slate[950],
        Surface     = a.Slate[900],
        SurfaceAlt  = a.Slate[800],
        Border      = a.Slate[700],
        Text        = a.Slate[100],
        TextMuted   = a.Slate[400],
        TextOnAccent= a.White,
        Accent      = a.Blue[500],
        AccentHover = a.Blue[400],
        AccentMuted = a.Blue[900],
        Success     = a.Emerald[500],
        Warning     = a.Amber[400],
        Error       = a.Rose[500],
        Info        = a.Sky[400],
    })
    
    
    d.Light = buildTheme({
        Background  = a.White,
        Surface     = a.Slate[50],
        SurfaceAlt  = a.Slate[100],
        Border      = a.Slate[200],
        Text        = a.Slate[900],
        TextMuted   = a.Slate[500],
        TextOnAccent= a.White,
        Accent      = a.Blue[600],
        AccentHover = a.Blue[700],
        AccentMuted = a.Blue[100],
        Success     = a.Emerald[600],
        Warning     = a.Amber[500],
        Error       = a.Rose[600],
        Info        = a.Sky[500],
    })
    
    
    d.Midnight = buildTheme({
        Background  = a.Neutral[950],
        Surface     = a.Neutral[900],
        SurfaceAlt  = a.Neutral[800],
        Border      = a.Neutral[700],
        Text        = a.Neutral[50],
        TextMuted   = a.Neutral[400],
        TextOnAccent= a.Black,
        Accent      = a.Violet[400],
        AccentHover = a.Violet[300],
        AccentMuted = a.Violet[900],
        Success     = a.Teal[400],
        Warning     = a.Yellow[400],
        Error       = a.Red[400],
        Info        = a.Cyan[400],
    },
    {   
        [1] = 3, [2] = 6, [3] = 10,
        [4] = 14, [6] = 20, [8] = 28,
    },
    {   
        Small = 2, Medium = 4, Large = 8, Full = 999,
    })
    
    
    d.Ocean = buildTheme({
        Background  = a.Blue[950],
        Surface     = a.Blue[900],
        SurfaceAlt  = a.Blue[800],
        Border      = a.Blue[700],
        Text        = a.Sky[50],
        TextMuted   = a.Sky[300],
        TextOnAccent= a.Blue[950],
        Accent      = a.Cyan[400],
        AccentHover = a.Cyan[300],
        AccentMuted = a.Cyan[900],
        Success     = a.Emerald[400],
        Warning     = a.Amber[300],
        Error       = a.Rose[400],
        Info        = a.Blue[300],
    })
    
    
    d.Forest = buildTheme({
        Background  = a.Green[950],
        Surface     = a.Green[900],
        SurfaceAlt  = a.Green[800],
        Border      = a.Green[700],
        Text        = a.Green[50],
        TextMuted   = a.Green[300],
        TextOnAccent= a.Green[950],
        Accent      = a.Lime[400],
        AccentHover = a.Lime[300],
        AccentMuted = a.Green[800],
        Success     = a.Emerald[400],
        Warning     = a.Yellow[400],
        Error       = a.Red[400],
        Info        = a.Teal[400],
    },
    nil,
    {   
        Small = 6, Medium = 12, Large = 20, Full = 999,
    })
    
    
    d.Sunset = buildTheme({
        Background  = a.Orange[950],
        Surface     = a.Orange[900],
        SurfaceAlt  = a.Orange[800],
        Border      = a.Orange[700],
        Text        = a.Orange[50],
        TextMuted   = a.Orange[300],
        TextOnAccent= a.White,
        Accent      = a.Yellow[400],
        AccentHover = a.Yellow[300],
        AccentMuted = a.Orange[800],
        Success     = a.Lime[400],
        Warning     = a.Amber[300],
        Error       = a.Rose[400],
        Info        = a.Sky[400],
    })
    
    
    d.Rose = buildTheme({
        Background  = a.Pink[950],
        Surface     = a.Pink[900],
        SurfaceAlt  = a.Pink[800],
        Border      = a.Pink[700],
        Text        = a.Pink[50],
        TextMuted   = a.Pink[300],
        TextOnAccent= a.White,
        Accent      = a.Rose[400],
        AccentHover = a.Rose[300],
        AccentMuted = a.Pink[800],
        Success     = a.Emerald[400],
        Warning     = a.Amber[300],
        Error       = a.Red[400],
        Info        = a.Purple[400],
    },
    nil,
    {   
        Small = 8, Medium = 16, Large = 24, Full = 999,
    })
    
    
    d.Aurora = buildTheme({
        Background  = a.Purple[950],
        Surface     = a.Purple[900],
        SurfaceAlt  = a.Purple[800],
        Border      = a.Purple[700],
        Text        = a.Violet[50],
        TextMuted   = a.Violet[300],
        TextOnAccent= a.Purple[950],
        Accent      = a.Teal[400],
        AccentHover = a.Teal[300],
        AccentMuted = a.Purple[800],
        Success     = a.Emerald[400],
        Warning     = a.Amber[300],
        Error       = a.Rose[400],
        Info        = a.Sky[400],
    })
    
    
    d.Neon = buildTheme({
        Background  = a.Neutral[950],
        Surface     = a.Neutral[900],
        SurfaceAlt  = a.Neutral[800],
        Border      = a.Fuchsia[600],
        Text        = a.White,
        TextMuted   = a.Neutral[400],
        TextOnAccent= a.Black,
        Accent      = a.Fuchsia[400],
        AccentHover = a.Fuchsia[300],
        AccentMuted = a.Fuchsia[950],
        Success     = a.Green[400],
        Warning     = a.Yellow[300],
        Error       = a.Red[400],
        Info        = a.Cyan[400],
    },
    {   
        [1] = 4, [2] = 8, [3] = 14,
        [4] = 20, [6] = 32, [8] = 48,
    },
    {   
        Small = 0, Medium = 2, Large = 4, Full = 999,
    })
    
    
    d.Sand = buildTheme({
        Background  = a.Stone[50],
        Surface     = a.Stone[100],
        SurfaceAlt  = a.Stone[200],
        Border      = a.Stone[300],
        Text        = a.Stone[900],
        TextMuted   = a.Stone[500],
        TextOnAccent= a.White,
        Accent      = a.Orange[600],
        AccentHover = a.Orange[700],
        AccentMuted = a.Orange[100],
        Success     = a.Green[600],
        Warning     = a.Amber[500],
        Error       = a.Red[600],
        Info        = a.Blue[500],
    })
    
    
    d.Terminal = buildTheme({
        Background  = Color3.fromRGB(10, 14, 10),
        Surface     = Color3.fromRGB(16, 24, 16),
        SurfaceAlt  = Color3.fromRGB(24, 36, 24),
        Border      = Color3.fromRGB(0, 100, 0),
        Text        = Color3.fromRGB(0, 230, 0),
        TextMuted   = Color3.fromRGB(0, 140, 0),
        TextOnAccent= Color3.fromRGB(10, 14, 10),
        Accent      = Color3.fromRGB(0, 255, 80),
        AccentHover = Color3.fromRGB(80, 255, 120),
        AccentMuted = Color3.fromRGB(0, 60, 0),
        Success     = Color3.fromRGB(0, 200, 60),
        Warning     = Color3.fromRGB(200, 200, 0),
        Error       = Color3.fromRGB(255, 60, 60),
        Info        = Color3.fromRGB(0, 180, 200),
    },
    nil,
    {   
        Small = 0, Medium = 0, Large = 0, Full = 999,
    })
    
    
    d.Sepia = buildTheme({
        Background  = Color3.fromRGB(245, 235, 215),
        Surface     = Color3.fromRGB(235, 222, 195),
        SurfaceAlt  = Color3.fromRGB(220, 205, 175),
        Border      = Color3.fromRGB(180, 158, 120),
        Text        = Color3.fromRGB(60, 40, 20),
        TextMuted   = Color3.fromRGB(120, 95, 65),
        TextOnAccent= Color3.fromRGB(245, 235, 215),
        Accent      = Color3.fromRGB(140, 80, 20),
        AccentHover = Color3.fromRGB(110, 60, 10),
        AccentMuted = Color3.fromRGB(220, 195, 160),
        Success     = Color3.fromRGB(60, 120, 60),
        Warning     = Color3.fromRGB(180, 130, 20),
        Error       = Color3.fromRGB(160, 40, 30),
        Info        = Color3.fromRGB(50, 90, 150),
    },
    nil,
    {   
        Small = 3, Medium = 6, Large = 10, Full = 999,
    })
    
    
    d.Ice = buildTheme({
        Background  = Color3.fromRGB(235, 245, 255),
        Surface     = Color3.fromRGB(220, 235, 250),
        SurfaceAlt  = Color3.fromRGB(200, 220, 245),
        Border      = Color3.fromRGB(160, 195, 235),
        Text        = Color3.fromRGB(20, 40, 80),
        TextMuted   = Color3.fromRGB(80, 110, 160),
        TextOnAccent= Color3.fromRGB(235, 245, 255),
        Accent      = Color3.fromRGB(30, 100, 220),
        AccentHover = Color3.fromRGB(20, 80, 190),
        AccentMuted = Color3.fromRGB(190, 215, 250),
        Success     = Color3.fromRGB(20, 150, 110),
        Warning     = Color3.fromRGB(180, 130, 20),
        Error       = Color3.fromRGB(200, 50, 50),
        Info        = Color3.fromRGB(30, 130, 210),
    },
    nil,
    {   
        Small = 10, Medium = 18, Large = 28, Full = 999,
    })
    
    
    d.Lava = buildTheme({
        Background  = Color3.fromRGB(14, 8, 6),
        Surface     = Color3.fromRGB(28, 14, 10),
        SurfaceAlt  = Color3.fromRGB(46, 20, 14),
        Border      = Color3.fromRGB(120, 40, 20),
        Text        = Color3.fromRGB(255, 220, 200),
        TextMuted   = Color3.fromRGB(180, 120, 100),
        TextOnAccent= Color3.fromRGB(14, 8, 6),
        Accent      = Color3.fromRGB(255, 80, 20),
        AccentHover = Color3.fromRGB(255, 120, 60),
        AccentMuted = Color3.fromRGB(80, 20, 10),
        Success     = Color3.fromRGB(100, 200, 80),
        Warning     = Color3.fromRGB(255, 180, 0),
        Error       = Color3.fromRGB(255, 40, 40),
        Info        = Color3.fromRGB(80, 160, 240),
    })
    
    
    d.Galaxy = buildTheme({
        Background  = Color3.fromRGB(8, 6, 18),
        Surface     = Color3.fromRGB(16, 12, 36),
        SurfaceAlt  = Color3.fromRGB(26, 20, 54),
        Border      = Color3.fromRGB(60, 40, 120),
        Text        = Color3.fromRGB(220, 210, 255),
        TextMuted   = Color3.fromRGB(130, 110, 200),
        TextOnAccent= Color3.fromRGB(8, 6, 18),
        Accent      = Color3.fromRGB(160, 100, 255),
        AccentHover = Color3.fromRGB(180, 130, 255),
        AccentMuted = Color3.fromRGB(40, 20, 80),
        Success     = Color3.fromRGB(80, 220, 160),
        Warning     = Color3.fromRGB(255, 200, 80),
        Error       = Color3.fromRGB(255, 80, 120),
        Info        = Color3.fromRGB(80, 180, 255),
    })
    
    
    d.Copper = buildTheme({
        Background  = Color3.fromRGB(22, 14, 8),
        Surface     = Color3.fromRGB(38, 24, 12),
        SurfaceAlt  = Color3.fromRGB(56, 36, 16),
        Border      = Color3.fromRGB(140, 80, 30),
        Text        = Color3.fromRGB(255, 230, 180),
        TextMuted   = Color3.fromRGB(180, 130, 80),
        TextOnAccent= Color3.fromRGB(22, 14, 8),
        Accent      = Color3.fromRGB(200, 110, 40),
        AccentHover = Color3.fromRGB(220, 140, 70),
        AccentMuted = Color3.fromRGB(80, 40, 10),
        Success     = Color3.fromRGB(80, 180, 80),
        Warning     = Color3.fromRGB(230, 180, 20),
        Error       = Color3.fromRGB(220, 60, 40),
        Info        = Color3.fromRGB(60, 140, 200),
    },
    nil,
    {   
        Small = 2, Medium = 4, Large = 6, Full = 999,
    })
    
    
    d.Pastel = buildTheme({
        Background  = Color3.fromRGB(255, 250, 252),
        Surface     = Color3.fromRGB(250, 240, 255),
        SurfaceAlt  = Color3.fromRGB(240, 245, 255),
        Border      = Color3.fromRGB(210, 195, 230),
        Text        = Color3.fromRGB(60, 50, 80),
        TextMuted   = Color3.fromRGB(130, 115, 155),
        TextOnAccent= Color3.fromRGB(255, 250, 252),
        Accent      = Color3.fromRGB(180, 130, 220),
        AccentHover = Color3.fromRGB(160, 105, 205),
        AccentMuted = Color3.fromRGB(235, 220, 250),
        Success     = Color3.fromRGB(100, 200, 150),
        Warning     = Color3.fromRGB(240, 190, 100),
        Error       = Color3.fromRGB(240, 130, 140),
        Info        = Color3.fromRGB(110, 170, 240),
    },
    nil,
    {   
        Small = 12, Medium = 20, Large = 32, Full = 999,
    })
    
    
    d.Monochrome = buildTheme({
        Background  = Color3.fromRGB(10, 10, 10),
        Surface     = Color3.fromRGB(22, 22, 22),
        SurfaceAlt  = Color3.fromRGB(36, 36, 36),
        Border      = Color3.fromRGB(60, 60, 60),
        Text        = Color3.fromRGB(240, 240, 240),
        TextMuted   = Color3.fromRGB(140, 140, 140),
        TextOnAccent= Color3.fromRGB(10, 10, 10),
        Accent      = Color3.fromRGB(220, 220, 220),
        AccentHover = Color3.fromRGB(255, 255, 255),
        AccentMuted = Color3.fromRGB(50, 50, 50),
        Success     = Color3.fromRGB(190, 190, 190),
        Warning     = Color3.fromRGB(170, 170, 170),
        Error       = Color3.fromRGB(200, 200, 200),
        Info        = Color3.fromRGB(160, 160, 160),
    },
    nil,
    {   
        Small = 0, Medium = 0, Large = 0, Full = 0,
    })
    
    
    d.Nordic = buildTheme({
        Background  = Color3.fromRGB(36, 40, 50),
        Surface     = Color3.fromRGB(48, 54, 66),
        SurfaceAlt  = Color3.fromRGB(62, 70, 84),
        Border      = Color3.fromRGB(88, 98, 116),
        Text        = Color3.fromRGB(220, 228, 240),
        TextMuted   = Color3.fromRGB(140, 155, 180),
        TextOnAccent= Color3.fromRGB(36, 40, 50),
        Accent      = Color3.fromRGB(130, 180, 240),
        AccentHover = Color3.fromRGB(155, 200, 255),
        AccentMuted = Color3.fromRGB(50, 70, 100),
        Success     = Color3.fromRGB(100, 190, 130),
        Warning     = Color3.fromRGB(240, 190, 80),
        Error       = Color3.fromRGB(220, 90, 90),
        Info        = Color3.fromRGB(100, 170, 230),
    })
    
    
    d.Sakura = buildTheme({
        Background  = Color3.fromRGB(255, 248, 250),
        Surface     = Color3.fromRGB(255, 238, 244),
        SurfaceAlt  = Color3.fromRGB(252, 222, 234),
        Border      = Color3.fromRGB(240, 180, 200),
        Text        = Color3.fromRGB(60, 30, 45),
        TextMuted   = Color3.fromRGB(150, 100, 120),
        TextOnAccent= Color3.fromRGB(255, 248, 250),
        Accent      = Color3.fromRGB(220, 80, 120),
        AccentHover = Color3.fromRGB(200, 60, 100),
        AccentMuted = Color3.fromRGB(255, 215, 230),
        Success     = Color3.fromRGB(60, 170, 100),
        Warning     = Color3.fromRGB(220, 160, 30),
        Error       = Color3.fromRGB(210, 50, 70),
        Info        = Color3.fromRGB(70, 140, 210),
    },
    nil,
    {   
        Small = 8, Medium = 16, Large = 24, Full = 999,
    })
    
    
    
    
    
    
    d._Names = {
        "Default",
        "Light",
        "Midnight",
        "Ocean",
        "Forest",
        "Sunset",
        "Rose",
        "Aurora",
        "Neon",
        "Sand",
        "Terminal",
        "Sepia",
        "Ice",
        "Lava",
        "Galaxy",
        "Copper",
        "Pastel",
        "Monochrome",
        "Nordic",
        "Sakura",
    }
    
    
    d._Active = "Default"
    
    
    
    
    function d:Get(e)
        local f = e or self._Active
        return self[f] or self.Default
    end
    
    
    
    
    function d:Set(e)
        if self[e] and type(self[e]) == "table" then
            self._Active = e
            return true
        end
        warn(("[HyperUI] Tema '%s' no encontrado. Se mantiene '%s'."):format(tostring(e), self._Active))
        return false
    end
    
    
    
    
    function d:Register(e, f)
        assert(type(e)   == "string", "[HyperUI] El nombre del tema debe ser una cadena.")
        assert(type(f) == "table",  "[HyperUI] Los tokens del tema deben ser una tabla.")
        self[e] = f
        table.insert(self._Names, e)
    end
    
    return d
end

_modules["theme/typography"] = function()
    
    
    
    
    local a = {
        Font = {
            Main = Enum.Font.BuilderSans,
            Bold = Enum.Font.BuilderSansExtraBold,
            Medium = Enum.Font.BuilderSansMedium,
            Mono = Enum.Font.RobotoMono,
        },
        Size = {
            Small = 12,
            Base = 14,
            Medium = 16,
            Large = 18,
            Title = 24,
        },
        Weight = {
            Light = Enum.FontWeight.Light,
            Regular = Enum.FontWeight.Regular,
            Medium = Enum.FontWeight.Medium,
            SemiBold = Enum.FontWeight.SemiBold,
            Bold = Enum.FontWeight.Bold,
            ExtraBold = Enum.FontWeight.Heavy,
        }
    }
    
    return a
end


_require = function(name)
    if _cache[name] then return _cache[name] end
    local module = _modules[name]
    if not module then error("Module not found: " .. tostring(name)) end
    local result = module()
    _cache[name] = result
    return result
end

-- Override global require inside the bundled environment
local require = _require

return _require('main')
