
return function(a: string | number, b: number?): string | nil
	local c = a
	if typeof(a) == "string" then
		
		local d = 0/0
c = tonumber(a) or d 
	end
	
	if typeof(c) ~= "number" then
		return "nan"
	end

	if b ~= nil then
		if typeof(b) ~= "number" then
			error("TypeError: fractionDigits must be a number between 0 and 100")
		end
		if b < 0 or b > 100 then
			error("RangeError: fractionDigits must be between 0 and 100")
		end
	end

	local d
	if b == nil then
		d = "%e"
	else
		d = "%." .. tostring(b) .. "e"
	end

	local e = string.format(d, c):gsub("%+0", "+"):gsub("%-0", "-"):gsub("0*e", "e")

	return e
end
