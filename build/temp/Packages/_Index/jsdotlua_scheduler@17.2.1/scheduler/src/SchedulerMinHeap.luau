










type Heap = { [number]: Node? }
type Node = {
	id: number,
	sortIndex: number
}

local a = {}

local b, c, d

a.push = function(e: Heap, f: Node): ()
	local g = #e + 1
	e[g] = f

	c(e, f, g)
end

a.peek = function(e: Heap): Node?
	return e[1]
end

a.pop = function(e: Heap): Node?
	local f = e[1]
	if f ~= nil then
		local g = e[#e]
		e[#e] = nil

		if g :: Node ~= f :: Node then
			e[1] = g
			d(e, g :: Node, 1)
		end
		return f
	else
		return nil
	end
end

c = function(e: Heap, f: Node, g: number): ()
	while true do
		local h = math.floor(g / 2)
		local i = e[h]
		if i ~= nil and b(i :: Node, f :: Node) > 0 then
			
			e[h] = f
			e[g] = i
			g = h
		else
			
			return
		end
	end
end

d = function(e: Heap, f: Node, g: number): ()
	local h = #e
	while g < h do
		local i = g * 2
		local j = e[i]
		local k = i + 1
		local l = e[k]

		
		if j ~= nil and b(j :: Node, f) < 0 then
			if l ~= nil and b(l :: Node, j :: Node) < 0 then
				e[g] = l
				e[k] = f
				g = k
			else
				e[g] = j
				e[i] = f
				g = i
			end
		elseif l ~= nil and b(l :: Node, f :: Node) < 0 then
			e[g] = l
			e[k] = f
			g = k
		else
			
			return
		end
	end
end

b = function(e: Node, f: Node): number
	
	local g = e.sortIndex - f.sortIndex

	if g == 0 then
		return e.id - f.id
	end

	return g
end

return a
