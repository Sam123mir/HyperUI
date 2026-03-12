













local a = require(script.Parent:WaitForChild('ReactFiberLane'))
local b: Lanes = a.NoLanes
local c = a.mergeLanes
type Lanes = a.Lanes
type Lane = a.Lane

local d = {}


d.workInProgressRootSkippedLanes = function(e: Lanes?): Lanes
	if e == nil then
		return b
	end

	
	b = e :: Lanes
	return b
end

d.markSkippedUpdateLanes = function(e: Lane | Lanes): ()
	b = c(e, b)
end

return d
