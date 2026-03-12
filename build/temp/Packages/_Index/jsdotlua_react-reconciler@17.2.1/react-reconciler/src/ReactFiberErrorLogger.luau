










local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
type Error = a.Error
local b = a.util.inspect
local c = a.setTimeout

local d = require(script.Parent.Parent:WaitForChild('shared'))
local e = d.console
local f = d.errorToString

local g = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = g.Fiber
local h = require(script.Parent:WaitForChild('ReactCapturedValue'))
type CapturedValue<T> = h.CapturedValue<T>

local i = require(script.Parent:WaitForChild('ReactFiberErrorDialog')).showErrorDialog
local j = require(script.Parent:WaitForChild('ReactWorkTags')).ClassComponent
local k = require(script.Parent.Parent:WaitForChild('shared')).getComponentName

local l = {}

l.logCapturedError = function(m: Fiber, n: CapturedValue<any>)
	local o, p = pcall(function()
		local o = i(m, n)

		
		
		if o == false then
			
			return nil
		end

		local p = n.value
		if _G.__DEV__ then
			local q = n.source
			local r = n.stack
			local s = r or ""
			
			
			
			if p ~= nil and p._suppressLogging then
				if m.tag == j then
					
					
					
					return
				end
				
				
				
				
				e["error"](p) 
				
				
			end

			local t
			if q ~= nil then
				t = k(q.type)
			else
				t = nil
			end

			local u
			if t then
				u = "The above error occurred in the <"
					.. tostring(t)
					.. "> component:"
			else
				u =
					"The above error occurred in one of your React components:"
			end

			local v
			local w = k(m.type)
			if w then
				v = "React will try to recreate this component tree from scratch "
					.. "using the error boundary you provided, "
					.. w
					.. "."
			else
				v = [[Consider adding an error boundary to your tree to customize error handling behavior.
Visit https://reactjs.org/link/error-boundaries to learn more about error boundaries.]]			
end
			local x = u
				.. "\n"
				.. s
				.. "\n\n"
				.. v

			
			
			
			
			e["error"](x) 
		else
			
			
			
			e["error"](b(p)) 
		end

		
		return nil
	end)

	if not o then
		warn("failed to error with error: " .. b(p))
		
		
		
		
		
		c(function()
			
			error(f(p :: any))
		end)
	end
end

return l
