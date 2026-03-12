






















local a = require(script.Parent.Parent.Parent:WaitForChild('collections'))
local b = a.Array
local c = a.Object
local d = require(script.Parent.Parent.Parent:WaitForChild('boolean'))
local e = require(script.Parent.Parent.Parent:WaitForChild('string'))
local f = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
local g = a.inspect

local h = require(script.Parent.Parent:WaitForChild('Error'))
local i = require(script.Parent.Parent.Parent:WaitForChild('instance-of'))

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
