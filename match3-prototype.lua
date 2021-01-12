-- TODO
-- collect 5 Red, 12 blue, 9 green objects by matching the same
-- gravity pulls randomly!

ROCK	= -1	-- unmovable gem / doesn't fall
EMPTY	= 0
RED		= 1
BLUE	= 2
GREEN	= 3
YELLOW	= 4
ORANGE	= 5
PURPLE	= 6

math.randomseed(os.time())
gems = {}

function PrintGem ()
	for y=1, 8 do
		for x=1, 8 do
			io.write( gems[y][x] )
		end
		io.write('\n')
	end
end

function FindMatch ()
	m = false
	print('FindMatch ()')
	PrintGem()
	print('-------------')
	
	-- match horizontal
	for y=1, 8 do
		for x=1, 6 do
			len = 1
			for i=1, 8-x do
				if gems[y][x] == gems[y][x+i] then
					len = len + 1
				else break end
			end
			if len >= 3 then
				m = true
				--print('match')
				-- remove match horizontal
				for i=1, len do
					gems[y][x+i-1] = 0
					-- animate disappearing gem
				end
			end
		end
	end
	
	-- match vertical
	for y=1, 6 do
		for x=1, 8 do
			len = 1
			for i=1, 8-y do
				if gems[y][x] == gems[y+i][x] then
					len = len + 1
				else break end
			end
			if len >= 3 then
				m = true
				--print('match')
				-- remove match vertical
				for i=1, len do
					gems[y+i-1][x] = 0
					-- animate disappearing gem
				end
			end
		end
	end
	
	return m
end

function FindRemoveMatch ()
	print('FindRemoveMatch ()')
	m = FindMatch()
	
	PrintGem()
	print('-------------')
	
	DropDownGem()	-- animate falling gem
	
	PrintGem()
	print('-------------')
	
	FillEmptyCells()	-- animate falling gem
	
	-- repeat until no match left
	while m do
		m = FindRemoveMatch()
		if not m then break end
	end
	return m
end

function DropDownGem ()
	-- drop down gem
	for x=1, 8 do
		for y=7, 1, -1 do
			for i=1, 8-y do
				--print(y, i)
				if gems[y+i][x] == 0 then
					gems[y+i][x] = gems[y+i-1][x]
					gems[y+i-1][x] = 0
				end
			end
		end
	end
end

function FillEmptyCells ()
	-- fill empty cells
	for x=1, 8 do
		for y=1, 8 do
			if gems[y][x] == 0 then
				gems[y][x] = math.random(1, 6)
			end
		end
	end
end

function LookForMatch ()
	
end


function RemoveMatch ()
	
end

function DropDown ()
	
end

function CreateRandomBoard ()
	for y=1, 8 do
		gems[y] = {}
		for x=1, 8 do
			gems[y][x] = math.random(1, 6)
		end
	end
	--[[gems = {
		{5,2,2,6,6,1,1,3},
		{4,6,4,2,3,3,6,2},
		{4,6,5,4,6,4,2,3},
		{3,1,3,2,1,4,5,1},
		{1,2,6,5,5,3,1,3},
		{6,2,2,3,5,4,1,4},
		{2,5,3,3,2,4,1,2},
		{4,5,6,4,3,3,1,2},
	}
	]]
	
	gems[6][1] = 3
	gems[7][1] = 3
	gems[8][1] = 3
	
	FindRemoveMatch()
	
end

function split(s, sep)
	local fields = {}
	local sep = sep or " "
	local pattern = string.format("([^%s]+)", sep)
	string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)
	return fields
end

function TrySwap (x1,y1, x2,y2)
	print('TrySwap(): ',x1,y1, x2,y2)
	tmp = gems[y1][x1]
	gems[y1][x1] = gems[y2][x2]
	gems[y2][x2] = tmp
	if FindMatch() then
		FindRemoveMatch()
	else
		tmp = gems[y1][x1]
		gems[y1][x1] = gems[y2][x2]
		gems[y2][x2] = tmp
	end
	print('TrySwap() END')
	PrintGem()
	print('-------------')
end

function ShowSuggestion ()
	-- Show Possible Match, output: x1,y1, x2,y2
	for y=1, 8 do
		for x=1, 6 do
			
		end
	end
end

---------------------------------


CreateRandomBoard ()
--TrySwap (1,1, 2,1)
--[[
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

TrySwap(x1,y1, x2,y2)
]]


ShowSuggestion()



