function split(s, sep)
	local fields = {}
	local sep = sep or " "
	local pattern = string.format("([^%s]+)", sep)
	string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)
	return fields
end

io.write('input: ')
io.flush()

r = io.read()

s = split(r, ' ')
g1 = split(s[1], ',')
g2 = split(s[2], ',')

x1 = math.floor(tonumber(g1[1]))
y1 = math.floor(tonumber(g1[2]))
x2 = math.floor(tonumber(g2[1]))
y2 = math.floor(tonumber(g2[2]))


print('TrySwap(): ',g1[1],g1[1], g2[2],g2[2])
print('TrySwap(): ',x1,y1, x2,y2)