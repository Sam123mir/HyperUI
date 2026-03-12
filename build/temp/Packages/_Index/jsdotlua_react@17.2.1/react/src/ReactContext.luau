










local a = require(script.Parent.Parent:WaitForChild('shared'))
local b = a.console

local c = require(script.Parent.Parent:WaitForChild('shared')).ReactSymbols
local d = c.REACT_PROVIDER_TYPE
local e = c.REACT_CONTEXT_TYPE
type ReactContext<T> = a.ReactContext<T>
type ReactProviderType<T> = a.ReactProviderType<T>

local f = {}

f.createContext = function<T>(
	g: T,
	h: ((a: T, b: T) -> number)?
): ReactContext<T>
	local i: ReactContext<any> = {
		["$$typeof"] = e,
		_calculateChangedBits = h,
		
		
		
		
		
		_currentValue = g,
		_currentValue2 = g,
		
		
		_threadCount = 0,
		
		Provider = (nil :: any) :: ReactProviderType<T>,
		Consumer = (nil :: any) :: ReactContext<T>,
		
		
		displayName = nil,
		
		_currentRenderer = nil,
		_currentRenderer2 = nil,
	}
	i.Provider = {
		["$$typeof"] = d,
		_context = i,
	}

	local j = false

	if _G.__DEV__ then
		
		
		
		local k = {
			["$$typeof"] = e,
			_context = i,
			_calculateChangedBits = i._calculateChangedBits,
		}

		setmetatable(k, {
			__index = function(l, m)
				
				if m == "_currentValue" then
					return i._currentValue
				elseif m == "_currentValue2" then
					return i._currentValue2
				elseif m == "_threadCount" then
					return i._threadCount
				elseif m == "displayName" then
					return i.displayName
				end
				return nil
			end,
			__newindex = function(l, m, n)
				if m == "_currentValue" then
					i._currentValue = n
				elseif m == "_currentValue2" then
					i._currentValue2 = n
				elseif m == "_threadCount" then
					i._threadCount = n
				elseif m == "displayName" then
					if not j then
						b.warn(
							"Setting `displayName` on Context.Consumer has no effect. "
								.. "You should set it directly on the context with Context.displayName = "
								.. n
								.. "."
						)
						j = true
					end
				end
			end,
		})

		i.Consumer = (k :: any) :: ReactContext<any>
	else
		i.Consumer = i
	end

	if _G.__DEV__ then
		i._currentRenderer = nil
		i._currentRenderer2 = nil
	end

	return i
end

return f
