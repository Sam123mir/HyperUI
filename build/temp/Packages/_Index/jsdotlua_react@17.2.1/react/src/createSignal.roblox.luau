
















type Function = (...any) -> ...any














type Connection = { callback: Function, disconnected: boolean }
type Map<K, V> = { [K]: V }

local function createSignal(): ((Function) -> (() -> ()), (...any) -> ())
	local a: Map<Function, Connection> = {}
	local b = {}
	local c = false

	local function subscribe(d)
		assert(
			typeof(d) == "function",
			"Can only subscribe to signals with a function."
		)

		local e = {
			callback = d,
			disconnected = false,
		}

		
		
		if c and not a[d] then
			b[d] = e
		end

		a[d] = e

		local function disconnect()
			assert(
				not e.disconnected,
				"Listeners can only be disconnected once."
			)

			e.disconnected = true
			a[d] = nil
			b[d] = nil
		end

		return disconnect
	end

	local function fire(...)
		c = true
		for d, e in a do
			if not e.disconnected and not b[d] then
				d(...)
			end
		end

		c = false

		
		table.clear(b)
	end

	return subscribe, fire
end

return createSignal
