









local a = require(script.Parent.Parent:WaitForChild('invariant'))




local function shim(...)
	a(
		false,
[[The current renderer does not support test selectors. This error is likely caused by a bug in React. Please file an issue.]]	


)
end


return {
	supportsTestSelectors = false,
	findFiberRoot = shim,
	getBoundingRect = shim,
	getTextContent = shim,
	isHiddenSubtree = shim,
	matchAccessibilityRole = shim,
	setFocusIfFocusable = shim,
	setupIntersectionObserver = shim,
}
