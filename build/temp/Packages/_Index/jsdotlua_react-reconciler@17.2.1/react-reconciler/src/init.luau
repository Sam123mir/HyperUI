










local a = require(script:WaitForChild('ReactInternalTypes'))
local b = require(script:WaitForChild('ReactRootTags'))

export type Dispatcher = a.Dispatcher
export type Fiber = a.Fiber
export type FiberRoot = a.FiberRoot


export type UpdateQueue<T> = a.UpdateQueue<T>

export type RootTag = b.RootTag





local function initialize(c): { [string]: any }
	local d = require(script:WaitForChild('ReactFiberHostConfig'))	
for e, f in c do
		d[e] = f
	end

	return require(script:WaitForChild('ReactFiberReconciler'))
end

return initialize
