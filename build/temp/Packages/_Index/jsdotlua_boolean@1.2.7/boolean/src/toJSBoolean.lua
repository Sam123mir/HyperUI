local a = require(script.Parent.Parent:WaitForChild('number'))


return function(b: any): boolean
	return not not b and b ~= 0 and b ~= "" and not a.isNaN(b)
end
