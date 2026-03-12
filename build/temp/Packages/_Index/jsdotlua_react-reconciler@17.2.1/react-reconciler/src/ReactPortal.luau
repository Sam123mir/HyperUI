









local a = require(script.Parent.Parent:WaitForChild('shared')).ReactSymbols.REACT_PORTAL_TYPE

local b = require(script.Parent.Parent:WaitForChild('shared'))
type ReactNodeList = b.ReactNodeList
type ReactPortal = b.ReactPortal

local function createPortal(
	c: ReactNodeList,
	d: any,
	
	e: any,
	f: string?
): ReactPortal
	if f ~= nil then
		f = tostring(f)
	end
	return {
		
		["$$typeof"] = a,
		key = f,
		children = c,
		containerInfo = d,
		implementation = e,
	}
end

return {
	createPortal = createPortal,
}
