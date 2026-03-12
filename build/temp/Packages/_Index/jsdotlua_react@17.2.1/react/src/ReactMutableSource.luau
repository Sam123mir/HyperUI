










local a = require(script.Parent.Parent:WaitForChild('shared'))
type MutableSourceGetVersionFn = a.MutableSourceGetVersionFn
type MutableSource<T> = a.MutableSource<T>

local function createMutableSource<Source>(
	b: Source,
	c: MutableSourceGetVersionFn
): MutableSource<Source>
	local d: MutableSource<Source> = {
		_getVersion = c,
		_source = b,
		_workInProgressVersionPrimary = nil,
		_workInProgressVersionSecondary = nil,
	}

	if _G.__DEV__ then
		d._currentPrimaryRenderer = nil
		d._currentSecondaryRenderer = nil
	end

	return d
end

return createMutableSource
