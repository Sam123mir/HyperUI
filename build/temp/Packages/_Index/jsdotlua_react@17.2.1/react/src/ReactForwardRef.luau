









local a = require(script.Parent.Parent:WaitForChild('shared')).console

local b = require(script.Parent.Parent:WaitForChild('shared')).ReactSymbols
local c = require(script.Parent.Parent:WaitForChild('shared'))
type React_Node = c.React_Node
type React_Ref<ElementType> = c.React_Ref<ElementType>
type React_ForwardRefComponent<Config, Instance> = c.React_ForwardRefComponent<
	Config,
	Instance
>
local d = b.REACT_FORWARD_REF_TYPE
local e = b.REACT_MEMO_TYPE

local f = {}

f.forwardRef =
	function<Props, ElementType>(
		g: (props: Props, ref: React_Ref<ElementType>) -> React_Node
	): React_ForwardRefComponent<Props, ElementType>
		if _G.__DEV__ then
			
			if
				typeof(g :: any) == "table"
				and (g :: any)["$$typeof"] == e
			then
				
				a.error(
[[forwardRef requires a render function but received a `memo` component. Instead of forwardRef(memo(...)), use memo(forwardRef(...)).]]				


)
			elseif typeof(g) ~= "function" then
				a.error(
					"forwardRef requires a render function but was given %s.",
					typeof(g)
				)
			else
				local h, i = debug.info(g, "a")
				if h ~= 0 and h ~= 2 then
					a.error(
						"forwardRef render functions accept exactly two parameters: props and ref. %s",
						(function()
							if h == 1 then
								return "Did you forget to use the ref parameter?"
							end
							return "Any additional parameter will be undefined."
						end)()
					)
				end
			end

			
			
			

			
			
			
			
			
			
			
			
		end

		local h = {
			["$$typeof"] = d,
			render = g,
		}
		if _G.__DEV__ then
			local i
			
			setmetatable(h, {
				__index = function(j, k)
					if k == "displayName" then
						return i
					end
					return rawget(j, k)
				end,
				__newindex = function(j, k, l)
					if k == "displayName" then
						i = l
					
					
					
					
					else
						rawset(j, k, l)
					end
				end,
			})
		end

		return h
	end

return f
