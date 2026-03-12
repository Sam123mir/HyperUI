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
