









local a = require(script.Parent.Parent:WaitForChild('shared'))
local b = a.console
local c = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local d = c.Array
local e = c.Object
local f = c.util.inspect
type React_StatelessFunctionalComponent<Props> = a.React_StatelessFunctionalComponent<
	Props
>
type React_ElementType = a.React_ElementType
type React_Component<Props, State> = a.React_Component<Props, State>
type React_ComponentType<Props> = a.React_ComponentType<Props>
type React_MemoComponent<Config, T> = a.React_MemoComponent<Config, T>
type React_AbstractComponent<Config, Instance> = a.React_AbstractComponent<
	Config,
	Instance
>

local g = a.ReactSymbols
local h = g.REACT_MEMO_TYPE
local i = g.REACT_ELEMENT_TYPE
local j = a.isValidElementType
local k = a.getComponentName

local l = {}

l.memo = function<Props, T>(
	
	
	m: React_StatelessFunctionalComponent<Props> | React_AbstractComponent<Props, T> | string,
	
	n: ((oldProps: Props, newProps: Props) -> boolean)?
): React_MemoComponent<Props, any>
	if _G.__DEV__ then
		local o = j(m)

		
		
		if not o then
			local p = ""
			if
				m == nil
				or (typeof(m) == "table" and #e.keys(m) == 0)
			then
				p = p
					.. (
[[ You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports.]]					

)
			end
			local q
			if m == nil then
				q = "nil"
			elseif d.isArray(m) then
				q = "array"
			elseif
				m ~= nil
				and typeof(m) == "table"
				and (m :: React_MemoComponent<Props, T>)["$$typeof"]
					== i
			then
				q = string.format(
					"<%s />",
					k((m :: any).type) or "UNKNOWN"
				)
				p =
					" Did you accidentally export a JSX literal or Element instead of a component?"
			else
				q = typeof(m)
				if m ~= nil then
					
					p = "\n" .. f(m)
				end
			end
			b.error(
				"memo: The first argument must be a component. Instead received: `%s`.%s",
				q,
				p
			)
		end
	end

	local o = {
		["$$typeof"] = h,
		type = m,
		compare = n or nil,
	}

	if _G.__DEV__ then
		local p
		
		setmetatable(o, {
			__index = function(q, r)
				if r == "displayName" then
					return p
				end
				return rawget(q, r)
			end,
			__newindex = function(q, r, s)
				if r == "displayName" then
					p = s
					
					if
						typeof(m) == "table"
						and (m :: React_AbstractComponent<Props, T>).displayName
							== nil
					then
						(m :: React_MemoComponent<Props, T>).displayName = p
					end
				else
					rawset(q, r, s)
				end
			end,
		})
	end

	return o :: React_MemoComponent<Props, any>
end

return l
