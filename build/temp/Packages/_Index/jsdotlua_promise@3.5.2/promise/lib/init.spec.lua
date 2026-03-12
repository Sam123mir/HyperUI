return function()
	local a = require(script.Parent)
	a.TEST = true

	local b = Instance.new("BindableEvent")
	a._timeEvent = b.Event

	local function waitForEvents()
		task.defer(coroutine.running())
		coroutine.yield()
	end

	local c do
		local d = 0

		a._getTime = function()
			return d
		end

		function c(e)
			e = e or (1.6666666666666665E-2)

			d = d + e
			b:Fire(e)
			waitForEvents()
		end
	end

	local function pack(...)
		local d = select("#", ...)

		return d, { ... }
	end

	describe("Promise.Status", function()
		it("should error if indexing nil value", function()
			expect(function()
				local d = a.Status.wrong
			end).to.throw()
		end)
	end)

	describe("Unhandled rejection signal", function()
		it("should call unhandled rejection callbacks", function()
			local d = a.new(function(d, e)
				e(1, 2)
			end)

			local e = 0

			local function callback(f, g, h)
				e += 1

				expect(f).to.equal(d)
				expect(g).to.equal(1)
				expect(h).to.equal(2)
			end

			local f = a.onUnhandledRejection(callback)

			c()

			expect(e).to.equal(1)

			f()

			a.new(function(g, h)
				h(3, 4)
			end)

			c()

			expect(e).to.equal(1)
		end)
	end)

	describe("Promise.new", function()
		it("should instantiate with a callback", function()
			local d = a.new(function() end)

			expect(d).to.be.ok()
		end)

		it("should invoke the given callback with resolve and reject", function()
			local d = 0
			local e
			local f

			local g = a.new(function(g, h)
				d = d + 1
				e = g
				f = h
			end)

			expect(g).to.be.ok()

			expect(d).to.equal(1)
			expect(e).to.be.a("function")
			expect(f).to.be.a("function")
			expect(g:getStatus()).to.equal(a.Status.Started)
		end)

		it("should resolve promises on resolve()", function()
			local d = 0

			local e = a.new(function(e)
				d = d + 1
				e()
			end)

			expect(e).to.be.ok()
			expect(d).to.equal(1)
			expect(e:getStatus()).to.equal(a.Status.Resolved)
		end)

		it("should reject promises on reject()", function()
			local d = 0

			local e = a.new(function(e, f)
				d = d + 1
				f()
			end)

			expect(e).to.be.ok()
			expect(d).to.equal(1)
			expect(e:getStatus()).to.equal(a.Status.Rejected)
		end)

		it("should reject on error in callback", function()
			local d = 0

			local e = a.new(function()
				d = d + 1
				error("hahah")
			end)

			expect(e).to.be.ok()
			expect(d).to.equal(1)
			expect(e:getStatus()).to.equal(a.Status.Rejected)
			expect(tostring(e._values[1]):find("hahah")).to.be.ok()

			
			expect(tostring(e._values[1]):find("init.spec")).to.be.ok()
			expect(tostring(e._values[1]):find("runExecutor")).to.be.ok()
		end)

		it("should work with C functions", function()
			expect(function()
				a.new(tick):andThen(tick)
			end).to.never.throw()
		end)

		it("should have a nice tostring", function()
			expect(tostring(a.resolve()):gmatch("Promise(Resolved)")).to.be.ok()
		end)

		it("should allow yielding", function()
			local d = Instance.new("BindableEvent")
			local e = a.new(function(e)
				d.Event:Wait()
				e(5)
			end)

			expect(e:getStatus()).to.equal(a.Status.Started)
			d:Fire()

			waitForEvents()

			expect(e:getStatus()).to.equal(a.Status.Resolved)
			expect(e._values[1]).to.equal(5)
		end)

		it("should preserve stack traces of resolve-chained promises", function()
			local function nestedCall(d)
				error(d)
			end

			local d = a.new(function(d)
				d(a.new(function()
					nestedCall("sample text")
				end))
			end)

			expect(d:getStatus()).to.equal(a.Status.Rejected)

			local e = tostring(d._values[1])
			expect(e:find("sample text")).to.be.ok()
			expect(e:find("nestedCall")).to.be.ok()
			expect(e:find("runExecutor")).to.be.ok()
			expect(e:find("runPlanNode")).to.be.ok()
			expect(
				e:find("...Rejected because it was chained to the following Promise, which encountered an error:")
			).to.be.ok()
		end)

		it("should report errors from Promises with _error (< v2)", function()
			local d = a.reject()
			d._error = "Sample error"

			local e = a.resolve():andThenReturn(d)

			expect(e:getStatus()).to.equal(a.Status.Rejected)

			local f = tostring(e._values[1])
			expect(f:find("Sample error")).to.be.ok()
			expect(
				f:find("...Rejected because it was chained to the following Promise, which encountered an error:")
			).to.be.ok()
			expect(f:find("%[No stack trace available")).to.be.ok()
		end)

		it("should allow callable tables", function()
			local d = a.new(setmetatable({}, {
				__call = function(d, e)
					e(1)
				end,
			}))

			local e = false
			d:andThen(setmetatable({}, {
				__call = function(f, g)
					expect(g).to.equal(1)
					e = true
				end,
			}))

			expect(e).to.equal(true)
		end)

		it("should close the thread after resolve", function()
			local d = 0
			a.new(function(e)
				d += 1
				e()
				a.delay(1):await()
				d += 1
			end)

			task.wait(1)

			expect(d).to.equal(1)
		end)
	end)

	describe("Promise.defer", function()
		it("should execute after the time event", function()
			local d = 0
			local e = a.defer(function(e, f, g, h)
				expect(type(e)).to.equal("function")
				expect(type(f)).to.equal("function")
				expect(type(g)).to.equal("function")
				expect(type(h)).to.equal("nil")

				d = d + 1

				e("foo")
			end)

			expect(d).to.equal(0)
			expect(e:getStatus()).to.equal(a.Status.Started)

			c()
			expect(d).to.equal(1)
			expect(e:getStatus()).to.equal(a.Status.Resolved)

			c()
			expect(d).to.equal(1)
		end)
	end)

	describe("Promise.delay", function()
		it("should schedule promise resolution", function()
			local d = a.delay(1)

			expect(d:getStatus()).to.equal(a.Status.Started)

			c()
			expect(d:getStatus()).to.equal(a.Status.Started)

			c(1)
			expect(d:getStatus()).to.equal(a.Status.Resolved)
		end)

		it("should allow for delays to be cancelled", function()
			local d = a.delay(2)

			a.delay(1):andThen(function()
				d:cancel()
			end)

			expect(d:getStatus()).to.equal(a.Status.Started)
			c()
			expect(d:getStatus()).to.equal(a.Status.Started)
			c(1)
			expect(d:getStatus()).to.equal(a.Status.Cancelled)
			c(1)
		end)
	end)

	describe("Promise.resolve", function()
		it("should immediately resolve with a value", function()
			local d = a.resolve(5, 6)

			expect(d).to.be.ok()
			expect(d:getStatus()).to.equal(a.Status.Resolved)
			expect(d._values[1]).to.equal(5)
			expect(d._values[2]).to.equal(6)
		end)

		it("should chain onto passed promises", function()
			local d = a.resolve(a.new(function(d, e)
				e(7)
			end))

			expect(d).to.be.ok()
			expect(d:getStatus()).to.equal(a.Status.Rejected)
			expect(d._values[1]).to.equal(7)
		end)
	end)

	describe("Promise.reject", function()
		it("should immediately reject with a value", function()
			local d = a.reject(6, 7)

			expect(d).to.be.ok()
			expect(d:getStatus()).to.equal(a.Status.Rejected)
			expect(d._values[1]).to.equal(6)
			expect(d._values[2]).to.equal(7)
		end)

		it("should pass a promise as-is as an error", function()
			local d = a.new(function(d)
				d(6)
			end)

			local e = a.reject(d)

			expect(e).to.be.ok()
			expect(e:getStatus()).to.equal(a.Status.Rejected)
			expect(e._values[1]).to.equal(d)
		end)
	end)

	describe("Promise:andThen", function()
		it("should allow yielding", function()
			local d = Instance.new("BindableEvent")
			local e = a.resolve():andThen(function()
				d.Event:Wait()
				return 5
			end)

			expect(e:getStatus()).to.equal(a.Status.Started)
			d:Fire()
			waitForEvents()
			expect(e:getStatus()).to.equal(a.Status.Resolved)
			expect(e._values[1]).to.equal(5)
		end)

		it("should run andThens on a new thread", function()
			local d = Instance.new("BindableEvent")

			local e
			local f = a.new(function(f)
				e = f
			end)

			local g = f:andThen(function()
				d.Event:Wait()
				return 5
			end)

			local h = f:andThen(function()
				return "foo"
			end)

			expect(f:getStatus()).to.equal(a.Status.Started)
			e()
			expect(h:getStatus()).to.equal(a.Status.Resolved)
			expect(h._values[1]).to.equal("foo")
			expect(g:getStatus()).to.equal(a.Status.Started)
		end)

		it("should chain onto resolved promises", function()
			local d
			local e
			local f = 0
			local g = 0

			local h = a.resolve(5)

			local i = h:andThen(function(...)
				e, d = pack(...)
				f = f + 1
			end, function()
				g = g + 1
			end)

			expect(g).to.equal(0)

			expect(f).to.equal(1)
			expect(e).to.equal(1)
			expect(d[1]).to.equal(5)

			expect(h).to.be.ok()
			expect(h:getStatus()).to.equal(a.Status.Resolved)
			expect(h._values[1]).to.equal(5)

			expect(i).to.be.ok()
			expect(i).never.to.equal(h)
			expect(i:getStatus()).to.equal(a.Status.Resolved)
			expect(#i._values).to.equal(0)
		end)

		it("should chain onto rejected promises", function()
			local d
			local e
			local f = 0
			local g = 0

			local h = a.reject(5)

			local i = h:andThen(function(...)
				g = g + 1
			end, function(...)
				e, d = pack(...)
				f = f + 1
			end)

			expect(g).to.equal(0)

			expect(f).to.equal(1)
			expect(e).to.equal(1)
			expect(d[1]).to.equal(5)

			expect(h).to.be.ok()
			expect(h:getStatus()).to.equal(a.Status.Rejected)
			expect(h._values[1]).to.equal(5)

			expect(i).to.be.ok()
			expect(i).never.to.equal(h)
			expect(i:getStatus()).to.equal(a.Status.Resolved)
			expect(#i._values).to.equal(0)
		end)

		it("should reject on error in callback", function()
			local d = 0

			local e = a.resolve(1):andThen(function()
				d = d + 1
				error("hahah")
			end)

			expect(e).to.be.ok()
			expect(d).to.equal(1)
			expect(e:getStatus()).to.equal(a.Status.Rejected)
			expect(tostring(e._values[1]):find("hahah")).to.be.ok()

			
			expect(tostring(e._values[1]):find("init.spec")).to.be.ok()
			expect(tostring(e._values[1]):find("runExecutor")).to.be.ok()
		end)

		it("should chain onto asynchronously resolved promises", function()
			local d
			local e
			local f = 0
			local g = 0

			local h
			local i = a.new(function(i)
				h = i
			end)

			local j = i:andThen(function(...)
				d = { ... }
				e = select("#", ...)
				f = f + 1
			end, function()
				g = g + 1
			end)

			expect(f).to.equal(0)
			expect(g).to.equal(0)

			h(6)

			expect(g).to.equal(0)

			expect(f).to.equal(1)
			expect(e).to.equal(1)
			expect(d[1]).to.equal(6)

			expect(i).to.be.ok()
			expect(i:getStatus()).to.equal(a.Status.Resolved)
			expect(i._values[1]).to.equal(6)

			expect(j).to.be.ok()
			expect(j).never.to.equal(i)
			expect(j:getStatus()).to.equal(a.Status.Resolved)
			expect(#j._values).to.equal(0)
		end)

		it("should chain onto asynchronously rejected promises", function()
			local d
			local e
			local f = 0
			local g = 0

			local h
			local i = a.new(function(i, j)
				h = j
			end)

			local j = i:andThen(function()
				g = g + 1
			end, function(...)
				d = { ... }
				e = select("#", ...)
				f = f + 1
			end)

			expect(f).to.equal(0)
			expect(g).to.equal(0)

			h(6)

			expect(g).to.equal(0)

			expect(f).to.equal(1)
			expect(e).to.equal(1)
			expect(d[1]).to.equal(6)

			expect(i).to.be.ok()
			expect(i:getStatus()).to.equal(a.Status.Rejected)
			expect(i._values[1]).to.equal(6)

			expect(j).to.be.ok()
			expect(j).never.to.equal(i)
			expect(j:getStatus()).to.equal(a.Status.Resolved)
			expect(#j._values).to.equal(0)
		end)

		it("should propagate errors through multiple levels", function()
			local d, e, f
			a.new(function(g, h)
				h(1, 2, 3)
			end):andThen(function() end):catch(function(g, h, i)
				d, e, f = g, h, i
			end)

			expect(d).to.equal(1)
			expect(e).to.equal(2)
			expect(f).to.equal(3)
		end)

		
		itSKIP("should not call queued callbacks from a cancelled sub-promise", function()
			local d
			local e = 0

			local f = a.new(function(f)
				d = f
			end)

			f:andThen(function()
				e += 1
			end)

			f
				:andThen(function()
					e += 1
				end)
				:cancel()

			d("foo")

			expect(e).to.equal(1)
		end)
	end)

	describe("Promise:cancel", function()
		it("should mark promises as cancelled and not resolve or reject them", function()
			local d = 0
			local e = 0
			local f = a.new(function() end)
				:andThen(function()
					d = d + 1
				end)
				:finally(function()
					e = e + 1
				end)

			f:cancel()
			f:cancel() 

			expect(d).to.equal(0)
			expect(e).to.equal(1)
			expect(f:getStatus()).to.equal(a.Status.Cancelled)
		end)

		it("should call the cancellation hook once", function()
			local d = 0

			local e = a.new(function(e, f, g)
				g(function()
					d = d + 1
				end)
			end)

			e:cancel()
			e:cancel() 

			expect(d).to.equal(1)
		end)

		it("should propagate cancellations", function()
			local d = a.new(function() end)

			local e = d:andThen()
			local f = d:andThen()

			expect(d:getStatus()).to.equal(a.Status.Started)
			expect(e:getStatus()).to.equal(a.Status.Started)
			expect(f:getStatus()).to.equal(a.Status.Started)

			e:cancel()

			expect(d:getStatus()).to.equal(a.Status.Started)
			expect(e:getStatus()).to.equal(a.Status.Cancelled)
			expect(f:getStatus()).to.equal(a.Status.Started)

			f:cancel()

			expect(d:getStatus()).to.equal(a.Status.Cancelled)
			expect(e:getStatus()).to.equal(a.Status.Cancelled)
			expect(f:getStatus()).to.equal(a.Status.Cancelled)
		end)

		it("should affect downstream promises", function()
			local d = a.new(function() end)
			local e = d:andThen()

			d:cancel()

			expect(e:getStatus()).to.equal(a.Status.Cancelled)
		end)

		it("should track consumers", function()
			local d = a.new(function() end)
			local e = a.resolve()
			local f = e:andThen(function()
				return d
			end)
			local g = a.new(function(g)
				g(f)
			end)
			local h = g:andThen(function() end)

			expect(f._parent).to.never.equal(e)
			expect(g._parent).to.never.equal(f)
			expect(g._consumers[h]).to.be.ok()
			expect(h._parent).to.equal(g)
		end)

		it("should cancel resolved pending promises", function()
			local d = a.new(function() end)

			local e = a.new(function(e)
				e(d)
			end):finally(function() end)

			e:cancel()

			expect(d._status).to.equal(a.Status.Cancelled)
			expect(e._status).to.equal(a.Status.Cancelled)
		end)

		it("should close the promise thread", function()
			local d = 0
			local e = a.new(function()
				d += 1
				a.delay(1):await()
				d += 1
			end)

			e:cancel()
			c(2)

			expect(d).to.equal(1)
		end)
	end)

	describe("Promise:finally", function()
		it("should be called upon resolve, reject, or cancel", function()
			local d = 0

			local function finally()
				d = d + 1
			end

			
			a.new(function(e, f)
				e()
			end):finally(finally)

			
			a.resolve():andThen(function() end):finally(finally):finally(finally)

			
			a.reject():finally(finally)

			local e = a.new(function() end):finally(finally)
			e:cancel()

			expect(d).to.equal(5)
		end)

		
		itSKIP("should not forward return values", function()
			local d

			a.resolve(2)
				:finally(function()
					return 1
				end)
				:andThen(function(e)
					d = e
				end)

			expect(d).to.equal(2)
		end)

		
		itSKIP("should not consume rejections", function()
			local d = false
			local e = false
			a.reject(5)
				:finally(function()
					return 42
				end)
				:andThen(function()
					e = true
				end)
				:catch(function(f)
					d = true
					expect(f).to.equal(5)
				end)

			expect(d).to.equal(true)
			expect(e).to.equal(false)
		end)

		
		itSKIP("should wait for returned promises", function()
			local d
			local e = a.reject("foo"):finally(function()
				return a.new(function(e)
					d = e
				end)
			end)

			expect(e:getStatus()).to.equal(a.Status.Started)

			d()

			expect(e:getStatus()).to.equal(a.Status.Rejected)
			local f, g = e:_unwrap()
			expect(g).to.equal("foo")
		end)

		it("should reject with a returned rejected promise's value", function()
			local d
			local e = a.reject("foo"):finally(function()
				return a.new(function(e, f)
					d = f
				end)
			end)

			expect(e:getStatus()).to.equal(a.Status.Started)

			d("bar")

			expect(e:getStatus()).to.equal(a.Status.Rejected)
			local f, g = e:_unwrap()
			expect(g).to.equal("bar")
		end)

		it("should reject when handler errors", function()
			local d = {}
			local e = a.reject("bar"):finally(function()
				error(d)
			end)

			local f, g = e:_unwrap()

			expect(f).to.equal(false)
			expect(g).to.equal(d)
		end)

		
		itSKIP("should not prevent cancellation", function()
			local d = a.new(function() end)

			local e = false
			d:finally(function()
				e = true
			end)

			local f = d:andThen(function() end)

			f:cancel()

			expect(d:getStatus()).to.equal(a.Status.Cancelled)
			expect(e).to.equal(true)
		end)

		it("should propagate cancellation downwards", function()
			local d = false
			local e = false
			local f = a.new(function() end)

			local g = f:finally(function()
				d = true
			end)

			f:cancel()

			expect(f:getStatus()).to.equal(a.Status.Cancelled)
			expect(g:getStatus()).to.equal(a.Status.Cancelled)

			expect(d).to.equal(true)
			expect(e).to.equal(false)
		end)

		it("should propagate cancellation upwards", function()
			local d = false
			local e = false
			local f = a.new(function() end)

			local g = f:finally(function()
				d = true
			end)

			g:cancel()

			expect(f:getStatus()).to.equal(a.Status.Cancelled)
			expect(g:getStatus()).to.equal(a.Status.Cancelled)

			expect(d).to.equal(true)
			expect(e).to.equal(false)
		end)

		it("should cancel returned promise if cancelled", function()
			local d = a.new(function() end)

			local e = a.resolve():finally(function()
				return d
			end)

			e:cancel()

			expect(d:getStatus()).to.equal(a.Status.Cancelled)
		end)
	end)

	describe("Promise.all", function()
		it("should error if given something other than a table", function()
			expect(function()
				a.all(1)
			end).to.throw()
		end)

		it("should resolve instantly with an empty table if given no promises", function()
			local d = a.all({})
			local e, f = d:_unwrap()

			expect(e).to.equal(true)
			expect(d:getStatus()).to.equal(a.Status.Resolved)
			expect(f).to.be.a("table")
			expect(next(f)).to.equal(nil)
		end)

		it("should error if given non-promise values", function()
			expect(function()
				a.all({ {}, {}, {} })
			end).to.throw()
		end)

		it("should wait for all promises to be resolved and return their values", function()
			local d = {}

			local e, f = pack(1, "A string", nil, false)

			local g = {}

			for h = 1, e do
				g[h] = a.new(function(i)
					d[h] = { i, f[h] }
				end)
			end

			local h = a.all(g)

			for i, j in ipairs(d) do
				expect(h:getStatus()).to.equal(a.Status.Started)
				j[1](j[2])
			end

			local i, j = pack(h:_unwrap())
			local k, l = unpack(j, 1, i)

			expect(i).to.equal(2)
			expect(k).to.equal(true)
			expect(l).to.be.a("table")
			expect(#l).to.equal(#g)

			for m = 1, e do
				expect(l[m]).to.equal(f[m])
			end
		end)

		it("should reject if any individual promise rejected", function()
			local d
			local e

			local f = a.new(function(f, g)
				d = g
			end)

			local g = a.new(function(g)
				e = g
			end)

			local h = a.all({ f, g })

			expect(h:getStatus()).to.equal(a.Status.Started)

			d("baz", "qux")
			e("foo", "bar")

			local i, j = pack(h:_unwrap())
			local k, l, m = unpack(j, 1, i)

			expect(i).to.equal(3)
			expect(k).to.equal(false)
			expect(l).to.equal("baz")
			expect(m).to.equal("qux")
			expect(g:getStatus()).to.equal(a.Status.Cancelled)
		end)

		it("should not resolve if resolved after rejecting", function()
			local d
			local e

			local f = a.new(function(f, g)
				d = g
			end)

			local g = a.new(function(g)
				e = g
			end)

			local h = a.all({ f, g })

			expect(h:getStatus()).to.equal(a.Status.Started)

			d("baz", "qux")
			e("foo", "bar")

			local i, j = pack(h:_unwrap())
			local k, l, m = unpack(j, 1, i)

			expect(i).to.equal(3)
			expect(k).to.equal(false)
			expect(l).to.equal("baz")
			expect(m).to.equal("qux")
		end)

		it("should only reject once", function()
			local d
			local e

			local f = a.new(function(f, g)
				d = g
			end)

			local g = a.new(function(g, h)
				e = h
			end)

			local h = a.all({ f, g })

			expect(h:getStatus()).to.equal(a.Status.Started)

			d("foo", "bar")

			expect(h:getStatus()).to.equal(a.Status.Rejected)

			e("baz", "qux")

			local i, j = pack(h:_unwrap())
			local k, l, m = unpack(j, 1, i)

			expect(i).to.equal(3)
			expect(k).to.equal(false)
			expect(l).to.equal("foo")
			expect(m).to.equal("bar")
		end)

		
		itSKIP("should error if a non-array table is passed in", function()
			local d, e = pcall(function()
				a.all(a.new(function() end))
			end)

			expect(d).to.be.ok()
			expect(e:find("Non%-promise")).to.be.ok()
		end)

		it("should cancel pending promises if one rejects", function()
			local d = a.new(function() end)
			expect(a.all({
				a.resolve(),
				a.reject(),
				d,
			}):getStatus()).to.equal(a.Status.Rejected)
			expect(d:getStatus()).to.equal(a.Status.Cancelled)
		end)

		it("should cancel promises if it is cancelled", function()
			local d = a.new(function() end)
			d:andThen(function() end)

			local e = {
				a.new(function() end),
				a.new(function() end),
				d,
			}

			a.all(e):cancel()

			expect(e[1]:getStatus()).to.equal(a.Status.Cancelled)
			expect(e[2]:getStatus()).to.equal(a.Status.Cancelled)
			expect(e[3]:getStatus()).to.equal(a.Status.Started)
		end)
	end)

	describe("Promise.fold", function()
		it("should return the initial value in a promise when the list is empty", function()
			local d = {}
			local e = a.fold({}, function()
				error("should not be called")
			end, d)

			expect(a.is(e)).to.equal(true)
			expect(e:getStatus()).to.equal(a.Status.Resolved)
			expect(e:expect()).to.equal(d)
		end)

		it("should accept promises in the list", function()
			local d

			local e = a.fold({ a.new(function(e)
				d = e
			end), 2, 3 }, function(e, f)
				return e + f
			end, 0)

			d(1)

			expect(a.is(e)).to.equal(true)
			expect(e:getStatus()).to.equal(a.Status.Resolved)
			expect(e:expect()).to.equal(6)
		end)

		it("should always return a promise even if the list or reducer don't use them", function()
			local d = a.fold({ 1, 2, 3 }, function(d, e, f)
				if f == 2 then
					return a.delay(1):andThenReturn(d + e)
				else
					return d + e
				end
			end, 0)
			expect(a.is(d)).to.equal(true)
			expect(d:getStatus()).to.equal(a.Status.Started)
			c(2)
			expect(d:getStatus()).to.equal(a.Status.Resolved)
			expect(d:expect()).to.equal(6)
		end)

		it("should return the first rejected promise", function()
			local d = "foo"
			local e = a.fold({ 1, 2, 3 }, function(e, f, g)
				if g == 2 then
					return a.reject(d)
				else
					return e + f
				end
			end, 0)
			expect(a.is(e)).to.equal(true)
			local f, g = e:awaitStatus()
			expect(f).to.equal(a.Status.Rejected)
			expect(g).to.equal(d)
		end)

		it("should return the first canceled promise", function()
			local d
			local e = a.fold({ 1, 2, 3 }, function(e, f, g)
				if g == 1 then
					return e + f
				elseif g == 2 then
					d = a.delay(1):andThenReturn(e + f)
					return d
				else
					error("this should not run if the promise is cancelled")
				end
			end, 0)
			expect(a.is(e)).to.equal(true)
			expect(e:getStatus()).to.equal(a.Status.Started)
			d:cancel()
			expect(e:getStatus()).to.equal(a.Status.Cancelled)
		end)
	end)

	describe("Promise.race", function()
		it("should resolve with the first settled value", function()
			local d = a.race({
				a.resolve(1),
				a.resolve(2),
			}):andThen(function(d)
				expect(d).to.equal(1)
			end)

			expect(d:getStatus()).to.equal(a.Status.Resolved)
		end)

		it("should cancel other promises", function()
			local d = a.new(function() end)
			d:andThen(function() end)
			local e = {
				d,
				a.new(function() end),
				a.new(function(e)
					e(2)
				end),
			}

			local f = a.race(e)

			expect(f:getStatus()).to.equal(a.Status.Resolved)
			expect(f._values[1]).to.equal(2)
			expect(e[1]:getStatus()).to.equal(a.Status.Started)
			expect(e[2]:getStatus()).to.equal(a.Status.Cancelled)
			expect(e[3]:getStatus()).to.equal(a.Status.Resolved)

			local g = a.new(function() end)
			expect(a.race({
				a.reject(),
				a.resolve(),
				g,
			}):getStatus()).to.equal(a.Status.Rejected)
			expect(g:getStatus()).to.equal(a.Status.Cancelled)
		end)

		it("should error if a non-array table is passed in", function()
			local e, f = pcall(function()
				a.race(a.new(function() end))
			end)

			expect(e).to.be.ok()
			expect(f:find("Non%-promise")).to.be.ok()
		end)

		it("should cancel promises if it is cancelled", function()
			local e = a.new(function() end)
			e:andThen(function() end)

			local f = {
				a.new(function() end),
				a.new(function() end),
				e,
			}

			a.race(f):cancel()

			expect(f[1]:getStatus()).to.equal(a.Status.Cancelled)
			expect(f[2]:getStatus()).to.equal(a.Status.Cancelled)
			expect(f[3]:getStatus()).to.equal(a.Status.Started)
		end)
	end)

	describe("Promise.promisify", function()
		it("should wrap functions", function()
			local function test(e)
				return e + 1
			end

			local e = a.promisify(test)
			local f = e(1)
			local g, h = f:_unwrap()

			expect(g).to.equal(true)
			expect(f:getStatus()).to.equal(a.Status.Resolved)
			expect(h).to.equal(2)
		end)

		it("should catch errors after a yield", function()
			local e = Instance.new("BindableEvent")
			local f = a.promisify(function()
				e.Event:Wait()
				error("errortext")
			end)

			local g = f()

			expect(g:getStatus()).to.equal(a.Status.Started)
			e:Fire()
			waitForEvents()
			expect(g:getStatus()).to.equal(a.Status.Rejected)
			expect(tostring(g._values[1]):find("errortext")).to.be.ok()
		end)
	end)

	describe("Promise.tap", function()
		it("should thread through values", function()
			local e, f

			a.resolve(1)
				:andThen(function(g)
					return g + 1
				end)
				:tap(function(g)
					e = g
					return g + 1
				end)
				:andThen(function(g)
					f = g
				end)

			expect(e).to.equal(2)
			expect(f).to.equal(2)
		end)

		it("should chain onto promises", function()
			local e, f

			local g = a.resolve(1)
				:tap(function()
					return a.new(function(g)
						e = g
					end)
				end)
				:andThen(function(g)
					f = g
				end)

			expect(g:getStatus()).to.equal(a.Status.Started)
			expect(f).to.never.be.ok()

			e(1)

			expect(g:getStatus()).to.equal(a.Status.Resolved)
			expect(f).to.equal(1)
		end)
	end)

	describe("Promise.try", function()
		it("should catch synchronous errors", function()
			local e
			a.try(function()
				error("errortext")
			end):catch(function(f)
				e = tostring(f)
			end)

			expect(e:find("errortext")).to.be.ok()
		end)

		it("should reject with error objects", function()
			local e = {}
			local f, g = a.try(function()
				error(e)
			end):_unwrap()

			expect(f).to.equal(false)
			expect(g).to.equal(e)
		end)

		it("should catch asynchronous errors", function()
			local e = Instance.new("BindableEvent")
			local f = a.try(function()
				e.Event:Wait()
				error("errortext")
			end)

			expect(f:getStatus()).to.equal(a.Status.Started)
			e:Fire()
			waitForEvents()
			expect(f:getStatus()).to.equal(a.Status.Rejected)
			expect(tostring(f._values[1]):find("errortext")).to.be.ok()
		end)
	end)

	describe("Promise:andThenReturn", function()
		it("should return the given values", function()
			local e, f

			a.resolve():andThenReturn(1, 2):andThen(function(g, h)
				e = g
				f = h
			end)

			expect(e).to.equal(1)
			expect(f).to.equal(2)
		end)
	end)

	describe("Promise:doneReturn", function()
		it("should return the given values", function()
			local e, f

			a.resolve():doneReturn(1, 2):andThen(function(g, h)
				e = g
				f = h
			end)

			expect(e).to.equal(1)
			expect(f).to.equal(2)
		end)
	end)

	describe("Promise:andThenCall", function()
		it("should call the given function with arguments", function()
			local e, f
			a.resolve():andThenCall(function(g, h)
				e = g
				f = h
			end, 3, 4)

			expect(e).to.equal(3)
			expect(f).to.equal(4)
		end)
	end)

	describe("Promise:andThenAsync", function()
		it("should allow yielding", function()
			local e = Instance.new("BindableEvent")
			local f = a.fromEvent(e.Event):andThenAsync(function()
				return 5
			end)
			expect(f:getStatus()).to.equal(a.Status.Started)
			e:Fire()

			expect(f:getStatus()).to.equal(a.Status.Started)

			c()

			expect(f:getStatus()).to.equal(a.Status.Resolved)
			expect(f._values[1]).to.equal(5)
		end)

		it("should run andThenAsync on a new thread", function()
			local e = Instance.new("BindableEvent")

			local f
			local g = a.new(function(g)
				f = g
			end)

			local h = g:andThenAsync(function()
				e.Event:Wait()
				return 5
			end)

			local i = g:andThenAsync(function()
				return "foo"
			end)

			expect(g:getStatus()).to.equal(a.Status.Started)
			f()

			expect(i:getStatus()).to.equal(a.Status.Started)
			expect(h:getStatus()).to.equal(a.Status.Started)

			c()

			expect(i:getStatus()).to.equal(a.Status.Resolved)
			expect(i._values[1]).to.equal("foo")
			expect(h:getStatus()).to.equal(a.Status.Started)
		end)

		it("should chain onto resolved promises", function()
			local e
			local f
			local g = 0
			local h = 0

			local i = a.resolve(5)

			local j = i:andThenAsync(function(...)
				f, e = pack(...)
				g = g + 1
			end, function()
				h = h + 1
			end)

			expect(h).to.equal(0)
			expect(g).to.equal(0)

			expect(j).to.be.ok()
			expect(j).never.to.equal(i)
			expect(j:getStatus()).to.equal(a.Status.Started)

			expect(i).to.be.ok()
			expect(i:getStatus()).to.equal(a.Status.Resolved)
			expect(i._values[1]).to.equal(5)

			c()

			expect(g).to.equal(1)
			expect(f).to.equal(1)
			expect(e[1]).to.equal(5)

			expect(j:getStatus()).to.equal(a.Status.Resolved)
			expect(#j._values).to.equal(0)
		end)

		it("should chain onto rejected promises", function()
			local e
			local f
			local g = 0
			local h = 0

			local i = a.reject(5)

			local j = i:andThenAsync(function(...)
				h = h + 1
			end, function(...)
				f, e = pack(...)
				g = g + 1
			end)

			expect(h).to.equal(0)
			expect(g).to.equal(0)

			expect(i).to.be.ok()
			expect(i:getStatus()).to.equal(a.Status.Rejected)
			expect(i._values[1]).to.equal(5)

			expect(j).to.be.ok()
			expect(j).never.to.equal(i)
			expect(j:getStatus()).to.equal(a.Status.Started)

			c()

			expect(g).to.equal(1)
			expect(f).to.equal(1)
			expect(e[1]).to.equal(5)

			expect(j:getStatus()).to.equal(a.Status.Resolved)

			expect(#j._values).to.equal(0)
		end)

		it("should reject on error in callback", function()
			local e = 0

			local f = a.resolve(1):andThenAsync(function()
				e = e + 1
				error("hahah")
			end)

			expect(f).to.be.ok()
			expect(f:getStatus()).to.equal(a.Status.Started)
			expect(e).to.equal(0)

			c()

			expect(e).to.equal(1)
			expect(f:getStatus()).to.equal(a.Status.Rejected)
			expect(tostring(f._values[1]):find("hahah")).to.be.ok()

			
			expect(tostring(f._values[1]):find("init.spec")).to.be.ok()
			expect(tostring(f._values[1]):find("runExecutor")).to.be.ok()
		end)

		it("should chain onto asynchronously resolved promises", function()
			local e
			local f
			local g = 0
			local h = 0

			local i
			local j = a.new(function(j)
				i = j
			end)

			local k = j:andThenAsync(function(...)
				e = { ... }
				f = select("#", ...)
				g = g + 1
			end, function()
				h = h + 1
			end)

			expect(g).to.equal(0)
			expect(h).to.equal(0)

			i(6)

			expect(g).to.equal(0)
			expect(h).to.equal(0)

			expect(j).to.be.ok()
			expect(j:getStatus()).to.equal(a.Status.Resolved)

			expect(k).to.be.ok()
			expect(k).never.to.equal(j)
			expect(k:getStatus()).to.equal(a.Status.Started)

			c()

			expect(h).to.equal(0)

			expect(g).to.equal(1)
			expect(f).to.equal(1)
			expect(e[1]).to.equal(6)

			expect(j:getStatus()).to.equal(a.Status.Resolved)
			expect(j._values[1]).to.equal(6)

			expect(k:getStatus()).to.equal(a.Status.Resolved)
			expect(#k._values).to.equal(0)
		end)

		it("should chain onto asynchronously rejected promises", function()
			local e
			local f
			local g = 0
			local h = 0

			local i
			local j = a.new(function(j, k)
				i = k
			end)

			local k = j:andThenAsync(function()
				h = h + 1
			end, function(...)
				e = { ... }
				f = select("#", ...)
				g = g + 1
			end)

			expect(g).to.equal(0)
			expect(h).to.equal(0)

			i(6)

			expect(g).to.equal(0)
			expect(h).to.equal(0)

			expect(j).to.be.ok()
			expect(j:getStatus()).to.equal(a.Status.Rejected)

			expect(k).to.be.ok()
			expect(k).never.to.equal(j)
			expect(k:getStatus()).to.equal(a.Status.Started)

			c()

			expect(h).to.equal(0)

			expect(g).to.equal(1)
			expect(f).to.equal(1)
			expect(e[1]).to.equal(6)

			expect(k:getStatus()).to.equal(a.Status.Resolved)
			expect(j._values[1]).to.equal(6)
			expect(#k._values).to.equal(0)
		end)

		it("should propagate errors through multiple levels", function()
			local e, f, g
			a.new(function(h, i)
				i(1, 2, 3)
			end):andThenAsync(function() end):catch(function(h, i, j)
				e, f, g = h, i, j
			end)

			expect(e).to.equal(nil)
			expect(f).to.equal(nil)
			expect(g).to.equal(nil)

			c()

			expect(e).to.equal(1)
			expect(f).to.equal(2)
			expect(g).to.equal(3)
		end)

		it("should propagate errors asynchronously through multiple levels", function()
			local e, f, g

			local function handleErrors(h, i, j)
				e, f, g = h, i, j
				return a.reject(h * 10, i * 10, j * 10)
			end
			a.new(function(h, i)
				i(1, 2, 3)
			end)
				:andThenAsync(function() end, handleErrors)
				:andThenAsync(function() end, handleErrors)
				:andThenAsync(function() end, handleErrors)
				:catch(function(h, i, j)
					e, f, g = "caught " .. tostring(h), "caught " .. tostring(i), "caught " .. tostring(j)
				end)

			expect(e).to.equal(nil)
			expect(f).to.equal(nil)
			expect(g).to.equal(nil)

			c()

			expect(e).to.equal(1)
			expect(f).to.equal(2)
			expect(g).to.equal(3)

			c()

			expect(e).to.equal(10)
			expect(f).to.equal(20)
			expect(g).to.equal(30)

			c()

			
			expect(e).to.equal("caught 1000")
			expect(f).to.equal("caught 2000")
			expect(g).to.equal("caught 3000")
		end)

		it("should NOT propagate errors if error handler is provided", function()
			local e, f, g
			a.new(function(h, i)
				i(1, 2, 3)
			end):andThenAsync(function() end, function() end):catch(function(h, i, j)
				e, f, g = h, i, j
			end)

			expect(e).to.equal(nil)
			expect(f).to.equal(nil)
			expect(g).to.equal(nil)

			c()

			expect(e).to.equal(nil)
			expect(f).to.equal(nil)
			expect(g).to.equal(nil)
		end)
	end)

	describe("Promise:doneCall", function()
		it("should call the given function with arguments", function()
			local e, f
			a.resolve():doneCall(function(g, h)
				e = g
				f = h
			end, 3, 4)

			expect(e).to.equal(3)
			expect(f).to.equal(4)
		end)
	end)

	describe("Promise:done", function()
		it("should trigger on resolve or cancel", function()
			local e = a.new(function() end)
			local f

			local g = e:done(function()
				f = true
			end)

			expect(f).to.never.be.ok()
			e:cancel()
			expect(g:getStatus()).to.equal(a.Status.Cancelled)
			expect(f).to.equal(true)

			local h, i
			a.reject():done(function()
				h = true
			end):finally(function()
				i = true
			end)

			expect(h).to.never.be.ok()
			expect(i).to.be.ok()
		end)
	end)

	describe("Promise.some", function()
		it("should resolve once the goal is reached", function()
			local e = a.some({
				a.resolve(1),
				a.reject(),
				a.resolve(2),
			}, 2)
			expect(e:getStatus()).to.equal(a.Status.Resolved)
			expect(e._values[1][1]).to.equal(1)
			expect(e._values[1][2]).to.equal(2)
		end)

		it("should error if the goal can't be reached", function()
			expect(a.some({
				a.resolve(),
				a.reject(),
			}, 2):getStatus()).to.equal(a.Status.Rejected)

			local e
			local f = a.some({
				a.resolve(),
				a.new(function(f, g)
					e = g
				end),
			}, 2)

			expect(f:getStatus()).to.equal(a.Status.Started)
			e("foo")
			expect(f:getStatus()).to.equal(a.Status.Rejected)
			expect(f._values[1]).to.equal("foo")
		end)

		it("should cancel pending Promises once the goal is reached", function()
			local e
			local f = a.new(function() end)
			local g = a.new(function(g)
				e = g
			end)

			local h = a.some({
				f,
				g,
				a.resolve(),
			}, 2)

			expect(h:getStatus()).to.equal(a.Status.Started)
			expect(f:getStatus()).to.equal(a.Status.Started)
			expect(g:getStatus()).to.equal(a.Status.Started)

			e()

			expect(h:getStatus()).to.equal(a.Status.Resolved)
			expect(f:getStatus()).to.equal(a.Status.Cancelled)
			expect(g:getStatus()).to.equal(a.Status.Resolved)
		end)

		it("should error if passed a non-number", function()
			expect(function()
				a.some({}, "non-number")
			end).to.throw()
		end)

		it("should return an empty array if amount is 0", function()
			local e = a.some({
				a.resolve(2),
			}, 0)

			expect(e:getStatus()).to.equal(a.Status.Resolved)
			expect(#e._values[1]).to.equal(0)
		end)

		it("should not return extra values", function()
			local e = a.some({
				a.resolve(1),
				a.resolve(2),
				a.resolve(3),
				a.resolve(4),
			}, 2)

			expect(e:getStatus()).to.equal(a.Status.Resolved)
			expect(#e._values[1]).to.equal(2)
			expect(e._values[1][1]).to.equal(1)
			expect(e._values[1][2]).to.equal(2)
		end)

		it("should cancel promises if it is cancelled", function()
			local e = a.new(function() end)
			e:andThen(function() end)

			local f = {
				a.new(function() end),
				a.new(function() end),
				e,
			}

			a.some(f, 3):cancel()

			expect(f[1]:getStatus()).to.equal(a.Status.Cancelled)
			expect(f[2]:getStatus()).to.equal(a.Status.Cancelled)
			expect(f[3]:getStatus()).to.equal(a.Status.Started)
		end)

		describe("Promise.any", function()
			it("should return the value directly", function()
				local e = a.any({
					a.reject(),
					a.reject(),
					a.resolve(1),
				})

				expect(e:getStatus()).to.equal(a.Status.Resolved)
				expect(e._values[1]).to.equal(1)
			end)

			it("should error if all are rejected", function()
				expect(a.any({
					a.reject(),
					a.reject(),
					a.reject(),
				}):getStatus()).to.equal(a.Status.Rejected)
			end)
		end)
	end)

	describe("Promise.allSettled", function()
		it("should resolve with an array of PromiseStatuses", function()
			local e
			local f = a.allSettled({
				a.resolve(),
				a.reject(),
				a.resolve(),
				a.new(function(f, g)
					e = g
				end),
			})

			expect(f:getStatus()).to.equal(a.Status.Started)
			e()
			expect(f:getStatus()).to.equal(a.Status.Resolved)
			expect(f._values[1][1]).to.equal(a.Status.Resolved)
			expect(f._values[1][2]).to.equal(a.Status.Rejected)
			expect(f._values[1][3]).to.equal(a.Status.Resolved)
			expect(f._values[1][4]).to.equal(a.Status.Rejected)
		end)

		it("should cancel promises if it is cancelled", function()
			local e = a.new(function() end)
			e:andThen(function() end)

			local f = {
				a.new(function() end),
				a.new(function() end),
				e,
			}

			a.allSettled(f):cancel()

			expect(f[1]:getStatus()).to.equal(a.Status.Cancelled)
			expect(f[2]:getStatus()).to.equal(a.Status.Cancelled)
			expect(f[3]:getStatus()).to.equal(a.Status.Started)
		end)
	end)

	describe("Promise:await", function()
		it("should return the correct values", function()
			local e = a.resolve(5, 6, nil, 7)

			local f, g, h, i, j = e:await()

			expect(f).to.equal(true)
			expect(g).to.equal(5)
			expect(h).to.equal(6)
			expect(i).to.equal(nil)
			expect(j).to.equal(7)
		end)

		it("should work if yielding is needed", function()
			local e = false
			task.spawn(function()
				local f, g = a.delay(1):await()
				expect(type(g)).to.equal("number")
				e = true
			end)

			c(2)
			expect(e).to.equal(true)
		end)
	end)

	describe("Promise:expect", function()
		it("should throw the correct values", function()
			local e = {}
			local f = a.reject(e)

			local g, h = pcall(function()
				f:expect()
			end)

			expect(g).to.equal(false)
			expect(h).to.equal(e)
		end)
	end)

	describe("Promise:now", function()
		it("should resolve if the Promise is resolved", function()
			local e, f = a.resolve("foo"):now():_unwrap()

			expect(e).to.equal(true)
			expect(f).to.equal("foo")
		end)

		it("should reject if the Promise is not resolved", function()
			local e, f = a.new(function() end):now():_unwrap()

			expect(e).to.equal(false)
			expect(a.Error.isKind(f, "NotResolvedInTime")).to.equal(true)
		end)

		it("should reject with a custom rejection value", function()
			local e, f = a.new(function() end):now("foo"):_unwrap()

			expect(e).to.equal(false)
			expect(f).to.equal("foo")
		end)
	end)

	describe("Promise.each", function()
		it("should iterate", function()
			local e, f = a.each({
				"foo",
				"bar",
				"baz",
				"qux",
			}, function(...)
				return { ... }
			end):_unwrap()

			expect(e).to.equal(true)
			expect(f[1][1]).to.equal("foo")
			expect(f[1][2]).to.equal(1)
			expect(f[2][1]).to.equal("bar")
			expect(f[2][2]).to.equal(2)
			expect(f[3][1]).to.equal("baz")
			expect(f[3][2]).to.equal(3)
			expect(f[4][1]).to.equal("qux")
			expect(f[4][2]).to.equal(4)
		end)

		it("should iterate serially", function()
			local e = {}
			local f = {}

			local g = a.each({
				"foo",
				"bar",
				"baz",
			}, function(g, h)
				f[h] = (f[h] or 0) + 1

				return a.new(function(i)
					table.insert(e, function()
						i(g:upper())
					end)
				end)
			end)

			expect(g:getStatus()).to.equal(a.Status.Started)
			expect(#e).to.equal(1)
			expect(f[1]).to.equal(1)
			expect(f[2]).to.never.be.ok()

			table.remove(e, 1)()

			expect(g:getStatus()).to.equal(a.Status.Started)
			expect(#e).to.equal(1)
			expect(f[1]).to.equal(1)
			expect(f[2]).to.equal(1)
			expect(f[3]).to.never.be.ok()

			table.remove(e, 1)()

			expect(g:getStatus()).to.equal(a.Status.Started)
			expect(f[1]).to.equal(1)
			expect(f[2]).to.equal(1)
			expect(f[3]).to.equal(1)

			table.remove(e, 1)()

			expect(g:getStatus()).to.equal(a.Status.Resolved)
			expect(type(g._values[1])).to.equal("table")
			expect(type(g._values[2])).to.equal("nil")

			local h = g._values[1]

			expect(h[1]).to.equal("FOO")
			expect(h[2]).to.equal("BAR")
			expect(h[3]).to.equal("BAZ")
		end)

		it("should reject with the value if the predicate promise rejects", function()
			local e = a.each({ 1, 2, 3 }, function()
				return a.reject("foobar")
			end)

			expect(e:getStatus()).to.equal(a.Status.Rejected)
			expect(e._values[1]).to.equal("foobar")
		end)

		it("should allow Promises to be in the list and wait when it gets to them", function()
			local e
			local f = a.new(function(f)
				e = f
			end)

			local g = a.each({
				f,
			}, function(g)
				return g * 2
			end)

			expect(g:getStatus()).to.equal(a.Status.Started)

			e(2)

			expect(g:getStatus()).to.equal(a.Status.Resolved)
			expect(g._values[1][1]).to.equal(4)
		end)

		it("should reject with the value if a Promise from the list rejects", function()
			local e = false
			local f = a.each({ 1, 2, a.reject("foobar") }, function(f)
				e = true
				return "never"
			end)

			expect(f:getStatus()).to.equal(a.Status.Rejected)
			expect(f._values[1]).to.equal("foobar")
			expect(e).to.equal(false)
		end)

		it("should reject immediately if there's a cancelled Promise in the list initially", function()
			local e = a.new(function() end)
			e:cancel()

			local f = false
			local g = a.each({ 1, 2, e }, function()
				f = true
			end)

			expect(g:getStatus()).to.equal(a.Status.Rejected)
			expect(f).to.equal(false)
			expect(g._values[1].kind).to.equal(a.Error.Kind.AlreadyCancelled)
		end)

		it("should stop iteration if Promise.each is cancelled", function()
			local e = {}

			local f = a.each({
				"foo",
				"bar",
				"baz",
			}, function(f, g)
				e[g] = (e[g] or 0) + 1

				return a.new(function() end)
			end)

			expect(f:getStatus()).to.equal(a.Status.Started)
			expect(e[1]).to.equal(1)
			expect(e[2]).to.never.be.ok()

			f:cancel()

			expect(f:getStatus()).to.equal(a.Status.Cancelled)
			expect(e[1]).to.equal(1)
			expect(e[2]).to.never.be.ok()
		end)

		it("should cancel the Promise returned from the predicate if Promise.each is cancelled", function()
			local e

			local f = a.each({
				"foo",
				"bar",
				"baz",
			}, function(f, g)
				e = a.new(function() end)
				return e
			end)

			f:cancel()

			expect(e:getStatus()).to.equal(a.Status.Cancelled)
		end)

		it("should cancel Promises in the list if Promise.each is cancelled", function()
			local e = a.new(function() end)

			local f = a.each({ e }, function() end)

			f:cancel()

			expect(e:getStatus()).to.equal(a.Status.Cancelled)
		end)
	end)

	describe("Promise.retry", function()
		it("should retry N times", function()
			local e = 0

			local f = a.retry(function(f)
				expect(f).to.equal("foo")

				e = e + 1

				if e == 5 then
					return a.resolve("ok")
				end

				return a.reject("fail")
			end, 5, "foo")

			expect(f:getStatus()).to.equal(a.Status.Resolved)
			expect(f._values[1]).to.equal("ok")
		end)

		it("should reject if threshold is exceeded", function()
			local e = a.retry(function()
				return a.reject("fail")
			end, 5)

			expect(e:getStatus()).to.equal(a.Status.Rejected)
			expect(e._values[1]).to.equal("fail")
		end)
	end)

	describe("Promise.retryWithDelay", function()
		it("should retry after a delay", function()
			local e = 0

			local f = a.retryWithDelay(function(f)
				expect(f).to.equal("foo")

				e = e + 1

				if e == 3 then
					return a.resolve("ok")
				end

				return a.reject("fail")
			end, 3, 10, "foo")

			expect(e).to.equal(1)

			c(11)

			expect(e).to.equal(2)

			c(11)

			expect(e).to.equal(3)

			expect(f:getStatus()).to.equal(a.Status.Resolved)
			expect(f._values[1]).to.equal("ok")
		end)
	end)

	describe("Promise.fromEvent", function()
		it("should convert a Promise into an event", function()
			local e = Instance.new("BindableEvent")

			local f = a.fromEvent(e.Event)

			expect(f:getStatus()).to.equal(a.Status.Started)

			e:Fire("foo")
			waitForEvents()

			expect(f:getStatus()).to.equal(a.Status.Resolved)
			expect(f._values[1]).to.equal("foo")
		end)

		it("should convert a Promise into an event with the predicate", function()
			local e = Instance.new("BindableEvent")

			local f = a.fromEvent(e.Event, function(f)
				return f == "foo"
			end)

			expect(f:getStatus()).to.equal(a.Status.Started)

			e:Fire("bar")
			waitForEvents()

			expect(f:getStatus()).to.equal(a.Status.Started)

			e:Fire("foo")
			waitForEvents()

			expect(f:getStatus()).to.equal(a.Status.Resolved)
			expect(f._values[1]).to.equal("foo")
		end)
	end)

	describe("Promise.is", function()
		it("should work with current version", function()
			local e = a.resolve(1)

			expect(a.is(e)).to.equal(true)
		end)

		it("should work with any object with an andThen", function()
			local e = {
				andThen = function()
					return 1
				end,
			}

			expect(a.is(e)).to.equal(true)
		end)

		it("should work with older promises", function()
			local e = {}
			e.prototype = {}
			e.__index = e.prototype

			function e.prototype:andThen() end

			local f = setmetatable({}, e)

			expect(a.is(f)).to.equal(true)
		end)
	end)
end
