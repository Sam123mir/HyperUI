









local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local b = a.Error
type Object = a.Object
type Function = (...any) -> ...any


local c = require(script.Parent:WaitForChild('console'))

local d = {}

local e = require(script.Parent:WaitForChild('ReactComponentStackFrame'))
local f =
	e.describeUnknownElementTypeFrameInDEV

local g = require(script.Parent:WaitForChild('ReactSharedInternals'))

local h = require(script.Parent:WaitForChild('ErrorHandling.roblox')).describeError

local i = g.ReactDebugCurrentFrame


local function setCurrentlyValidatingElement(j: any?)
	if _G.__DEV__ then
		if j then
			local k = j._owner
			local l = f(
				j.type,
				j._source,
				if k ~= nil then k.type else nil
			);
			
			(i.setExtraStackFrame :: any)(l)
		else
			(i.setExtraStackFrame :: any)(nil)
		end
	end
end

local function checkPropTypes<P>(
	
	j: Object?,
	k: ((P) -> (boolean, string?))?,
	l: P,
	
	m: string,
	n: string?,
	o: any?
): ()
	if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
		
		
		

		
		if j and k then
			c.warn(
				"You've defined both propTypes and validateProps on "
					.. (n or "a component")
			)
		end

		
		if k then
			if typeof(k) ~= "function" then
				c.error(
					("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(
						typeof(k),
						n or ""
					)
				)
			else
				local p, q = k(l)

				if not p then
					q = q
						or "<Validator function did not supply a message>"
					local r = string.format(
						"validateProps failed on a %s type in %s: %s",
						m,
						n or "<UNKNOWN Component>",
						tostring(q)
					)
					
					
					
					
					error(r)
				end
			end
		end

		if j then
			
			assert(typeof(j) == "table", "propTypes needs to be a table")
			for p, q in j do
				
				
				

				
				
				
				local r, s = xpcall(function()
					
					
					if typeof(j[p]) ~= "function" then
						local r = b.new(
							(n or "React class")
								.. ": "
								.. m
								.. " type `"
								.. p
								.. "` is invalid; "
								.. "it must be a function, usually from the `prop-types` package, but received `"
								.. typeof(j[p])
								.. [[`.This often happens because of typos such as `PropTypes.function` instead of `PropTypes.func`.]]						

)
						r.name = "Invariant Violation"
						error(r)
					end

					return (j[p] :: Function)(
						l,
						p,
						n,
						m,
						nil,
						"SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED"
					)
				end, h)

				
				
				
				local t = typeof(s) == "table"
				if s ~= nil and not t then
					setCurrentlyValidatingElement(o)
					c.error(string.format(
[[%s: type specification of %s `%s` is invalid; the type checker function must return `nil` or an `Error` but returned a %s. You may have forgotten to pass an argument to the type checker creator (arrayOf, instanceOf, objectOf, oneOf, oneOfType, and shape all require an argument).]]





,
						n or "React class",
						m,
						p,
						typeof(s)
					))
					setCurrentlyValidatingElement(nil)
				end

				
				if
					t
					and d[(s :: any).message] == nil
				then
					
					
					d[tostring((s :: any).message)] = true
					setCurrentlyValidatingElement(o)
					c.warn(
						string.format(
							"Failed %s type: %s",
							m,
							tostring((s :: any).message)
						)
					)
					setCurrentlyValidatingElement(nil)
				end
			end
		end
	end
end

return checkPropTypes
