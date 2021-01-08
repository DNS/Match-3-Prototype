
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

function FindRemoveMatch ()
	m = false
	print('FindRemoveMatch ()')
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
				--print(gems[y][x])
				--print('match: ', x, y, '; len:', len)
				
				for i=1, len do
					gems[y][x+i-1] = 0
				end
			end
		end
	end
	
	PrintGem()
	print('-------------')
	
	DropDownGem()
	
	PrintGem()
	print('-------------')
	
	FillEmptyCells()
	
	-- repeat until no match left
	while m do
		m = FindRemoveMatch()
		if not m then return false end
	end
	
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

function TryMoveSwap (x1,y1, x2,y2)
	
end

function RemoveMatch ()
	
end

function DropDown ()
	
end

function CreateRandomBoard ()
	for y=1, 8 do
		gems[y] = {}
		for x=1, 8 do
			--gems[y][x] = {}
			gems[y][x] = math.random(1, 6)
		end
	end
	
	gems[8][1] = 0
	--gems[6][1] = 0
	--gems[4][1] = 0
	
	FindRemoveMatch()
	
end


---------------------------------


CreateRandomBoard ()
	

--PrintGem()

--io.stdout:write(2)









