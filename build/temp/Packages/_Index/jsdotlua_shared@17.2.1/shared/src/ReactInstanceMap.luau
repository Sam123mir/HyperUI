
























local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local b = a.Error
local c = a.util.inspect
local d = require(script.Parent:WaitForChild('getComponentName'))

local e = {}

local function isValidFiber(f): boolean
	return f.tag ~= nil
		and f.subtreeFlags ~= nil
		and f.lanes ~= nil
		and f.childLanes ~= nil
end

e.remove = function(f)
	f._reactInternals = nil
end

e.get = function(f)
	local g = f._reactInternals

	
	
	if not isValidFiber(g) then
		error(
			b.new(
				"invalid fiber in "
					.. (d(f) or "UNNAMED Component")
					.. " during get from ReactInstanceMap! "
					.. c(g)
			)
		)
	elseif g.alternate ~= nil and not isValidFiber(g.alternate) then
		error(
			b.new(
				"invalid alternate fiber ("
					.. (d(f) or "UNNAMED alternate")
					.. ") in "
					.. (d(f) or "UNNAMED Component")
					.. " during get from ReactInstanceMap! "
					.. c(g.alternate)
			)
		)
	end

	return g
end

e.has = function(f)
	return f._reactInternals ~= nil
end

e.set = function(f, g)
	
	
	local h = g
	local i
	while h ~= nil do
		if not isValidFiber(h) then
			i = "invalid fiber in "
				.. (d(f) or "UNNAMED Component")
				.. " being set in ReactInstanceMap! "
				.. c(h)
				.. "\n"

			if g ~= h then
				i ..= " (from original fiber " .. (d(f) or "UNNAMED Component") .. ")"
			end
			error(b.new(i))
		elseif
			(h :: any).alternate ~= nil
			and not isValidFiber((h :: any).alternate)
		then
			i = "invalid alternate fiber ("
				.. (d(f) or "UNNAMED alternate")
				.. ") in "
				.. (d(f) or "UNNAMED Component")
				.. " being set in ReactInstanceMap! "
				.. c((h :: any).alternate)
				.. "\n"

			if g ~= h then
				i ..= " (from original fiber " .. (d(f) or "UNNAMED Component") .. ")"
			end
			error(b.new(i))
		end
		h = (h :: any).return_
	end

	(f :: any)._reactInternals = g
end

return e
