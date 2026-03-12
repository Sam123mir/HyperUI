
return function(a)
	return type(a) == "number" and a ~= math.huge and a == math.floor(a)
end
