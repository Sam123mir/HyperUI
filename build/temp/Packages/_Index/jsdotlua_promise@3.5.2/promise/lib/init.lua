



local a = "Non-promise value passed into %s at index %s"
local b = "Please pass a list of promises to %s"
local c = "Please pass a handler function to %s!"
local d = { __mode = "k" }

local function isCallable(e)
	if type(e) == "function" then
		return true
	end

	if type(e) == "table" then
		local f = getmetatable(e)
		if f and type(rawget(f, "__call")) == "function" then
			return true
		end
	end

	return false
end




local function makeEnum(e, f)
	local g = {}

	for h, i in ipairs(f) do
		g[i] = i
	end

	return setmetatable(g, {
		__index = function(h, i)
			error(string.format("%s is not in %s!", i, e), 2)
		end,
		__newindex = function()
			error(string.format("Creating new members in %s is not allowed!", e), 2)
		end,
	})
end








local e
do
	e = {
		Kind = makeEnum("Promise.Error.Kind", {
			"ExecutionError",
			"AlreadyCancelled",
			"NotResolvedInTime",
			"TimedOut",
		}),
	}
	e.__index = e

	function e.new(f, g)
		f = f or {}
		return setmetatable({
			error = tostring(f.error) or "[This error has no error text.]",
			trace = f.trace,
			context = f.context,
			kind = f.kind,
			parent = g,
			createdTick = os.clock(),
			createdTrace = debug.traceback(),
		}, e)
	end

	function e.is(f)
		if type(f) == "table" then
			local g = getmetatable(f)

			if type(g) == "table" then
				return rawget(f, "error") ~= nil and type(rawget(g, "extend")) == "function"
			end
		end

		return false
	end

	function e.isKind(f, g)
		assert(g ~= nil, "Argument #2 to Promise.Error.isKind must not be nil")

		return e.is(f) and f.kind == g
	end

	function e:extend(f)
		f = f or {}

		f.kind = f.kind or self.kind

		return e.new(f, self)
	end

	function e:getErrorChain()
		local f = { self }

		while f[#f].parent do
			table.insert(f, f[#f].parent)
		end

		return f
	end

	function e:__tostring()
		local f = {
			string.format("-- Promise.Error(%s) --", self.kind or "?"),
		}

		for g, h in ipairs(self:getErrorChain()) do
			table.insert(
				f,
				table.concat({
					h.trace or h.error,
					h.context,
				}, "\n")
			)
		end

		return table.concat(f, "\n")
	end
end






local function pack(...)
	return select("#", ...), { ... }
end




local function packResult(f, ...)
	return f, select("#", ...), { ... }
end

local function makeErrorHandler(f)
	assert(f ~= nil, "traceback is nil")

	return function(g)
		
		

		if type(g) == "table" then
			return g
		end

		return e.new({
			error = g,
			kind = e.Kind.ExecutionError,
			trace = debug.traceback(tostring(g), 2),
			context = "Promise created at:\n\n" .. f,
		})
	end
end




local function runExecutor(f, g, ...)
	return packResult(xpcall(g, makeErrorHandler(f), ...))
end





local function createAdvancer(f, g, h, i)
	return function(...)
		local j, k, l = runExecutor(f, g, ...)

		if j then
			h(unpack(l, 1, k))
		else
			i(l[1])
		end
	end
end

local function isEmpty(f)
	return next(f) == nil
end


























local f = {
	Error = e,
	Status = makeEnum("Promise.Status", { "Started", "Resolved", "Rejected", "Cancelled" }),
	_getTime = os.clock,
	_timeEvent = game:GetService("RunService").Heartbeat,
	_unhandledRejectionCallbacks = {},
}
f.prototype = {}
f.__index = f.prototype

function f._new(g, h, i)
	if i ~= nil and not f.is(i) then
		error("Argument #2 to Promise.new must be a promise or nil", 2)
	end

	local j = {
		
		_thread = nil,

		
		_source = g,

		_status = f.Status.Started,

		
		
		_values = nil,

		
		
		_valuesLength = -1,

		
		_unhandledRejection = true,

		
		_queuedResolve = {},
		_queuedReject = {},
		_queuedFinally = {},

		
		_cancellationHook = nil,

		
		
		_parent = i,

		
		
		_consumers = setmetatable({}, d),
	}

	if i and i._status == f.Status.Started then
		i._consumers[j] = true
	end

	setmetatable(j, f)

	local function resolve(...)
		j:_resolve(...)
	end

	local function reject(...)
		j:_reject(...)
	end

	local function onCancel(k)
		if k then
			if j._status == f.Status.Cancelled then
				k()
			else
				j._cancellationHook = k
			end
		end

		return j._status == f.Status.Cancelled
	end

	j._thread = coroutine.create(function()
		local k, l, m = runExecutor(j._source, h, resolve, reject, onCancel)

		if not k then
			reject(m[1])
		end
	end)

	task.spawn(j._thread)

	return j
end







































function f.new(g)
	return f._new(debug.traceback(nil, 2), g)
end

function f:__tostring()
	return string.format("Promise(%s)", self._status)
end



















function f.defer(g)
	local h = debug.traceback(nil, 2)
	local i
	i = f._new(h, function(j, k, l)
		local m
		m = f._timeEvent:Connect(function()
			m:Disconnect()
			local n, o, p = runExecutor(h, g, j, k, l)

			if not n then
				k(p[1])
			end
		end)
	end)

	return i
end


f.async = f.defer























function f.resolve(...)
	local g, h = pack(...)
	return f._new(debug.traceback(nil, 2), function(i)
		i(unpack(h, 1, g))
	end)
end











function f.reject(...)
	local g, h = pack(...)
	return f._new(debug.traceback(nil, 2), function(i, j)
		j(unpack(h, 1, g))
	end)
end





function f._try(g, h, ...)
	local i, j = pack(...)

	return f._new(g, function(k)
		k(h(unpack(j, 1, i)))
	end)
end
























function f.try(g, ...)
	return f._try(debug.traceback(nil, 2), g, ...)
end






function f._all(g, h, i)
	if type(h) ~= "table" then
		error(string.format(b, "Promise.all"), 3)
	end

	
	
	for j, k in pairs(h) do
		if not f.is(k) then
			error(string.format(a, "Promise.all", tostring(j)), 3)
		end
	end

	
	if #h == 0 or i == 0 then
		return f.resolve({})
	end

	return f._new(g, function(j, k, l)
		
		local m = {}
		local n = {}

		
		
		local o = 0
		local p = 0
		local q = false

		local function cancel()
			for r, s in ipairs(n) do
				s:cancel()
			end
		end

		
		local function resolveOne(r, ...)
			if q then
				return
			end

			o = o + 1

			if i == nil then
				m[r] = ...
			else
				m[o] = ...
			end

			if o >= (i or #h) then
				q = true
				j(m)
				cancel()
			end
		end

		l(cancel)

		
		
		for r, s in ipairs(h) do
			n[r] = s:andThen(function(...)
				resolveOne(r, ...)
			end, function(...)
				p = p + 1

				if i == nil or #h - p < i then
					cancel()
					q = true

					k(...)
				end
			end)
		end

		if q then
			cancel()
		end
	end)
end

























function f.all(...)
	local g = { ... }

	
	if type(g[1]) == "table" and not f.is(g[1]) then
		
		g = g[1]
	end

	return f._all(debug.traceback(nil, 2), g)
end


























function f.fold(g, h, i)
	assert(type(g) == "table", "Bad argument #1 to Promise.fold: must be a table")
	assert(isCallable(h), "Bad argument #2 to Promise.fold: must be a function")

	local j = f.resolve(i)
	return f.each(g, function(k, l)
		j = j:andThen(function(m)
			return h(m, k, l)
		end)
	end):andThen(function()
		return j
	end)
end




















function f.some(g, h)
	assert(type(h) == "number", "Bad argument #2 to Promise.some: must be a number")

	return f._all(debug.traceback(nil, 2), g, h)
end



















function f.any(g)
	return f._all(debug.traceback(nil, 2), g, 1):andThen(function(h)
		return h[1]
	end)
end

















function f.allSettled(g)
	if type(g) ~= "table" then
		error(string.format(b, "Promise.allSettled"), 2)
	end

	
	
	for h, i in pairs(g) do
		if not f.is(i) then
			error(string.format(a, "Promise.allSettled", tostring(h)), 2)
		end
	end

	
	if #g == 0 then
		return f.resolve({})
	end

	return f._new(debug.traceback(nil, 2), function(h, i, j)
		
		local k = {}
		local l = {}

		
		
		local m = 0

		
		local function resolveOne(n, ...)
			m = m + 1

			k[n] = ...

			if m >= #g then
				h(k)
			end
		end

		j(function()
			for n, o in ipairs(l) do
				o:cancel()
			end
		end)

		
		
		for n, o in ipairs(g) do
			l[n] = o:finally(function(...)
				resolveOne(n, ...)
			end)
		end
	end)
end

























function f.race(g)
	assert(type(g) == "table", string.format(b, "Promise.race"))

	for h, i in pairs(g) do
		assert(f.is(i), string.format(a, "Promise.race", tostring(h)))
	end

	return f._new(debug.traceback(nil, 2), function(h, i, j)
		local k = {}
		local l = false

		local function cancel()
			for m, n in ipairs(k) do
				n:cancel()
			end
		end

		local function finalize(m)
			return function(...)
				cancel()
				l = true
				return m(...)
			end
		end

		if j(finalize(i)) then
			return
		end

		for m, n in ipairs(g) do
			k[m] = n:andThen(finalize(h), finalize(i))
		end

		if l then
			cancel()
		end
	end)
end

























































function f.each(g, h)
	assert(type(g) == "table", string.format(b, "Promise.each"))
	assert(isCallable(h), string.format(c, "Promise.each"))

	return f._new(debug.traceback(nil, 2), function(i, j, k)
		local l = {}
		local m = {}

		local n = false

		local function cancel()
			for o, p in ipairs(m) do
				p:cancel()
			end
		end

		k(function()
			n = true

			cancel()
		end)

		
		
		
		
		

		local o = {}

		for p, q in ipairs(g) do
			if f.is(q) then
				if q:getStatus() == f.Status.Cancelled then
					cancel()
					return j(e.new({
						error = "Promise is cancelled",
						kind = e.Kind.AlreadyCancelled,
						context = string.format(
							"The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s",
							p,
							q._source
						),
					}))
				elseif q:getStatus() == f.Status.Rejected then
					cancel()
					return j(select(2, q:await()))
				end

				
				local r = q:andThen(function(...)
					return ...
				end)

				table.insert(m, r)
				o[p] = r
			else
				o[p] = q
			end
		end

		for p, q in ipairs(o) do
			if f.is(q) then
				local r
				r, q = q:await()

				if not r then
					cancel()
					return j(q)
				end
			end

			if n then
				return
			end

			local r = f.resolve(h(q, p))

			table.insert(m, r)

			local s, t = r:await()

			if not s then
				cancel()
				return j(t)
			end

			l[p] = t
		end

		i(l)
	end)
end







function f.is(g)
	if type(g) ~= "table" then
		return false
	end

	local h = getmetatable(g)

	if h == f then
		
		return true
	elseif h == nil then
		
		return isCallable(g.andThen)
	elseif
		type(h) == "table"
		and type(rawget(h, "__index")) == "table"
		and isCallable(rawget(rawget(h, "__index"), "andThen"))
	then
		
		return true
	end

	return false
end

























function f.promisify(g)
	return function(...)
		return f._try(debug.traceback(nil, 2), g, ...)
	end
end



















do
	

	
	local g
	local h

	function f.delay(i)
		assert(type(i) == "number", "Bad argument #1 to Promise.delay, must be a number.")
		
		
		if not (i >= 1.6666666666666665E-2) or i == math.huge then
			i = 1.6666666666666665E-2		
end

		return f._new(debug.traceback(nil, 2), function(j, k, l)
			local m = f._getTime()
			local n = m + i

			local o = {
				resolve = j,
				startTime = m,
				endTime = n,
			}

			if h == nil then 
				g = o
				h = f._timeEvent:Connect(function()
					local p = f._getTime()

					while g ~= nil and g.endTime < p do
						local q = g
						g = q.next

						if g == nil then
							h:Disconnect()
							h = nil
						else
							g.previous = nil
						end

						q.resolve(f._getTime() - q.startTime)
					end
				end)
			else 
				if g.endTime < n then 
					
					
					local p = g
					local q = p.next

					while q ~= nil and q.endTime < n do
						p = q
						q = p.next
					end

					
					p.next = o
					o.previous = p

					if q ~= nil then
						o.next = q
						q.previous = o
					end
				else
					
					o.next = g
					g.previous = o
					g = o
				end
			end

			l(function()
				
				local p = o.next

				if g == o then
					if p == nil then 
						h:Disconnect()
						h = nil
					else 
						p.previous = nil
					end
					g = p
				else
					local q = o.previous
					
					q.next = p

					if p ~= nil then
						p.previous = q
					end
				end
			end)
		end)
	end
end







































function f.prototype:timeout(g, h)
	local i = debug.traceback(nil, 2)

	return f.race({
		f.delay(g):andThen(function()
			return f.reject(h == nil and e.new({
				kind = e.Kind.TimedOut,
				error = "Timed out",
				context = string.format(
					"Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s",
					g,
					i
				),
			}) or h)
		end),
		self,
	})
end






function f.prototype:getStatus()
	return self._status
end






function f.prototype:_andThen(g, h, i)
	self._unhandledRejection = false

	
	return f._new(g, function(j, k)
		
		

		local l = j
		if h then
			l = createAdvancer(g, h, j, k)
		end

		local m = k
		if i then
			m = createAdvancer(g, i, j, k)
		end

		if self._status == f.Status.Started then
			
			table.insert(self._queuedResolve, l)
			table.insert(self._queuedReject, m)
		elseif self._status == f.Status.Resolved then
			
			l(unpack(self._values, 1, self._valuesLength))
		elseif self._status == f.Status.Rejected then
			
			m(unpack(self._values, 1, self._valuesLength))
		elseif self._status == f.Status.Cancelled then
			
			
			k(e.new({
				error = "Promise is cancelled",
				kind = e.Kind.AlreadyCancelled,
				context = "Promise created at\n\n" .. g,
			}))
		end
	end, self)
end






















function f.prototype:andThen(g, h)
	assert(g == nil or isCallable(g), string.format(c, "Promise:andThen"))
	assert(h == nil or isCallable(h), string.format(c, "Promise:andThen"))

	return self:_andThen(debug.traceback(nil, 2), g, h)
end






















function f.prototype:andThenAsync(g, h)
	assert(g == nil or isCallable(g), string.format(c, "Promise:andThenAsync"))
	assert(h == nil or isCallable(h), string.format(c, "Promise:andThenAsync"))


	return self:_andThen(
		debug.traceback(nil, 2),
		function(...)
			local i, j = pack(...)
			return f.defer(function(k)
				k(unpack(j, 1, i))
			end)
		end,
		function(...)
			local i, j = pack(...)
			return f.defer(function(k, l)
				l(unpack(j, 1, i))
			end)
		end
	):andThen(g, h)
end





















function f.prototype:catch(g)
	assert(g == nil or isCallable(g), string.format(c, "Promise:catch"))
	return self:_andThen(debug.traceback(nil, 2), nil, g)
end

















function f.prototype:tap(g)
	assert(isCallable(g), string.format(c, "Promise:tap"))
	return self:_andThen(debug.traceback(nil, 2), function(...)
		local h = g(...)

		if f.is(h) then
			local i, j = pack(...)
			return h:andThen(function()
				return unpack(j, 1, i)
			end)
		end

		return ...
	end)
end




















function f.prototype:andThenCall(g, ...)
	assert(isCallable(g), string.format(c, "Promise:andThenCall"))
	local h, i = pack(...)
	return self:_andThen(debug.traceback(nil, 2), function()
		return g(unpack(i, 1, h))
	end)
end























function f.prototype:andThenReturn(...)
	local g, h = pack(...)
	return self:_andThen(debug.traceback(nil, 2), function()
		return unpack(h, 1, g)
	end)
end












function f.prototype:cancel()
	if self._status ~= f.Status.Started then
		return
	end

	self._status = f.Status.Cancelled

	if self._cancellationHook then
		self._cancellationHook()
	end

	coroutine.close(self._thread)

	if self._parent then
		self._parent:_consumerCancelled(self)
	end

	for g in pairs(self._consumers) do
		g:cancel()
	end

	self:_finalize()
end





function f.prototype:_consumerCancelled(g)
	if self._status ~= f.Status.Started then
		return
	end

	self._consumers[g] = nil

	if next(self._consumers) == nil then
		self:cancel()
	end
end





function f.prototype:_finally(g, h, i)
	if not i then
		self._unhandledRejection = false
	end

	
	return f._new(g, function(j, k)
		local l = j
		if h then
			l = createAdvancer(g, h, j, k)
		end

		if i then
			local m = l
			l = function(...)
				if self._status == f.Status.Rejected then
					return j(self)
				end

				return m(...)
			end
		end

		if self._status == f.Status.Started then
			
			table.insert(self._queuedFinally, l)
		else
			
			l(self._status)
		end
	end, self)
end


















































function f.prototype:finally(g)
	assert(g == nil or isCallable(g), string.format(c, "Promise:finally"))
	return self:_finally(debug.traceback(nil, 2), g)
end










function f.prototype:finallyCall(g, ...)
	assert(isCallable(g), string.format(c, "Promise:finallyCall"))
	local h, i = pack(...)
	return self:_finally(debug.traceback(nil, 2), function()
		return g(unpack(i, 1, h))
	end)
end



















function f.prototype:finallyReturn(...)
	local g, h = pack(...)
	return self:_finally(debug.traceback(nil, 2), function()
		return unpack(h, 1, g)
	end)
end




function f.prototype:done(g)
	assert(
		g == nil or isCallable(g),
		string.format(c, "Promise:done")
	)
	return self:_finally(debug.traceback(nil, 2), g, true)
end




function f.prototype:doneCall(g, ...)
	assert(isCallable(g), string.format(c, "Promise:doneCall"))
	local h, i = pack(...)
	return self:_finally(debug.traceback(nil, 2), function()
		return g(unpack(i, 1, h))
	end, true)
end




function f.prototype:doneReturn(...)
	local g, h = pack(...)
	return self:_finally(debug.traceback(nil, 2), function()
		return unpack(h, 1, g)
	end, true)
end








function f.prototype:awaitStatus()
	self._unhandledRejection = false

	if self._status == f.Status.Started then
		local g = coroutine.running()

		self:finally(function()
			task.spawn(g)
		end)

		coroutine.yield()
	end

	if self._status == f.Status.Resolved then
		return self._status, unpack(self._values, 1, self._valuesLength)
	elseif self._status == f.Status.Rejected then
		return self._status, unpack(self._values, 1, self._valuesLength)
	end

	return self._status
end

local function awaitHelper(g, ...)
	return g == f.Status.Resolved, ...
end






















function f.prototype:await()
	return awaitHelper(self:awaitStatus())
end

local function expectHelper(g, ...)
	if g ~= f.Status.Resolved then
		error((...) == nil and "Expected Promise rejected with no value." or (...), 3)
	end

	return ...
end


























function f.prototype:expect()
	return expectHelper(self:awaitStatus())
end


f.prototype.awaitValue = f.prototype.expect








function f.prototype:_unwrap()
	if self._status == f.Status.Started then
		error("Promise has not resolved or rejected.", 2)
	end

	local g = self._status == f.Status.Resolved

	return g, unpack(self._values, 1, self._valuesLength)
end

function f.prototype:_resolve(...)
	if self._status ~= f.Status.Started then
		if f.is((...)) then
			(...):_consumerCancelled(self)
		end
		return
	end

	
	if f.is((...)) then
		
		if select("#", ...) > 1 then
			local g = string.format(
[[When returning a Promise from andThen, extra arguments are discarded! See:

%s]],
				self._source
			)
			warn(g)
		end

		local g = ...

		local h = g:andThen(function(...)
			self:_resolve(...)
		end, function(...)
			local h = g._values[1]

			
			if g._error then
				h = e.new({
					error = g._error,
					kind = e.Kind.ExecutionError,
					context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]",
				})
			end

			if e.isKind(h, e.Kind.ExecutionError) then
				return self:_reject(h:extend({
					error = "This Promise was chained to a Promise that errored.",
					trace = "",
					context = string.format(
						"The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n",
						self._source
					),
				}))
			end

			self:_reject(...)
		end)

		if h._status == f.Status.Cancelled then
			self:cancel()
		elseif h._status == f.Status.Started then
			
			self._parent = h
			h._consumers[self] = true
		end

		return
	end

	self._status = f.Status.Resolved
	self._valuesLength, self._values = pack(...)

	
	for g, h in ipairs(self._queuedResolve) do
		coroutine.wrap(h)(...)
	end

	self:_finalize()
end

function f.prototype:_reject(...)
	if self._status ~= f.Status.Started then
		return
	end

	self._status = f.Status.Rejected
	self._valuesLength, self._values = pack(...)

	
	if not isEmpty(self._queuedReject) then
		
		for g, h in ipairs(self._queuedReject) do
			coroutine.wrap(h)(...)
		end
	else
		
		
		
		

		local g = tostring((...))

		coroutine.wrap(function()
			f._timeEvent:Wait()

			
			if not self._unhandledRejection then
				return
			end

			
			local h = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", g, self._source)

			for i, j in ipairs(f._unhandledRejectionCallbacks) do
				task.spawn(j, self, unpack(self._values, 1, self._valuesLength))
			end

			if f.TEST then
				
				return
			end

			warn(h)
		end)()
	end

	self:_finalize()
end




function f.prototype:_finalize()
	for g, h in ipairs(self._queuedFinally) do
		
		
		
		coroutine.wrap(h)(self._status)
	end

	self._queuedFinally = nil
	self._queuedReject = nil
	self._queuedResolve = nil

	
	if not f.TEST then
		self._parent = nil
		self._consumers = nil
	end

	task.defer(coroutine.close, self._thread)
end

















function f.prototype:now(g)
	local h = debug.traceback(nil, 2)
	if self._status == f.Status.Resolved then
		return self:_andThen(h, function(...)
			return ...
		end)
	else
		return f.reject(g == nil and e.new({
			kind = e.Kind.NotResolvedInTime,
			error = "This Promise was not resolved in time for :now()",
			context = ":now() was called at:\n\n" .. h,
		}) or g)
	end
end































function f.retry(g, h, ...)
	assert(isCallable(g), "Parameter #1 to Promise.retry must be a function")
	assert(type(h) == "number", "Parameter #2 to Promise.retry must be a number")

	local i, j = { ... }, select("#", ...)

	return f.resolve(g(...)):catch(function(...)
		if h > 0 then
			return f.retry(g, h - 1, unpack(i, 1, j))
		else
			return f.reject(...)
		end
	end)
end














function f.retryWithDelay(g, h, i, ...)
	assert(isCallable(g), "Parameter #1 to Promise.retry must be a function")
	assert(type(h) == "number", "Parameter #2 (times) to Promise.retry must be a number")
	assert(type(i) == "number", "Parameter #3 (seconds) to Promise.retry must be a number")

	local j, k = { ... }, select("#", ...)

	return f.resolve(g(...)):catch(function(...)
		if h > 0 then
			f.delay(i):await()

			return f.retryWithDelay(g, h - 1, i, unpack(j, 1, k))
		else
			return f.reject(...)
		end
	end)
end

























function f.fromEvent(g, h)
	h = h or function()
		return true
	end

	return f._new(debug.traceback(nil, 2), function(i, j, k)
		local l
		local m = false

		local function disconnect()
			l:Disconnect()
			l = nil
		end

		
		
		

		l = g:Connect(function(...)
			local n = h(...)

			if n == true then
				i(...)

				if l then
					disconnect()
				else
					m = true
				end
			elseif type(n) ~= "boolean" then
				error("Promise.fromEvent predicate should always return a boolean")
			end
		end)

		if m and l then
			return disconnect()
		end

		k(disconnect)
	end)
end











function f.onUnhandledRejection(g)
	table.insert(f._unhandledRejectionCallbacks, g)

	return function()
		local h = table.find(f._unhandledRejectionCallbacks, g)

		if h then
			table.remove(f._unhandledRejectionCallbacks, h)
		end
	end
end

return f
