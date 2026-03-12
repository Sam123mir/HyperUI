










local a = require(script.Parent.Parent:WaitForChild('shared'))
type ReactNodeList = a.ReactNodeList

local b = require(script.Parent:WaitForChild('ReactFiberLane'))
type Lanes = b.Lanes

export type OffscreenProps = {
	
	
	
	
	
	
	mode: string | nil,
	children: ReactNodeList
}



export type OffscreenState = {
	
	
	
	baseLanes: Lanes
}

return {}
