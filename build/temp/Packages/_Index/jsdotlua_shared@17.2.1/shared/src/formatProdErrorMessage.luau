













local a = game:GetService("HttpService")

local function formatProdErrorMessage(b, ...)
	local c = "https://reactjs.org/docs/error-decoder.html?invariant=" .. tostring(b)
	local d = select("#", ...)
	for e = 1, d, 1 do
		
		c = c .. "&args[]=" .. a:UrlEncode(select(e, ...))
	end
	return string.format(
[[Minified React error #%d; visit %s for the full message or use the non-minified dev environment for full errors and additional helpful warnings.]]

,
		b,
		c
	)
end

return formatProdErrorMessage
