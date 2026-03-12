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
