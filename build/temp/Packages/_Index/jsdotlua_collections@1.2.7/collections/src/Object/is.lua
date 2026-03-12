

return function(a: any, b: any): boolean
	if a == b then
		return a ~= 0 or 1 / a == 1 / b
	else
		return a ~= a and b ~= b
	end
end
