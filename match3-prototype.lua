
EMPTY	= 0
RED		= 1
BLUE	= 2
GREEN	= 3
YELLOW	= 4
ORANGE	= 5
PURPLE	= 6

math.randomseed(os.time())
gems = {}


function FindRemoveMatch ()
	-- horizontal
	for y=1, 8 do
		for x=1, 6 do
			len = 1
			for i=1, 8-x do
				if gems[y][x] == gems[y][x+i] then
					len = len + 1
				else
					break
				end
			end
			if len >= 3 then
				print(gems[y][x])
				print('match: ', x, y, '; len:', len)
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

function DropDownGems ()
	
end

function CreateRandomBoard ()
	for y=1, 8 do
		gems[y] = {}
		for x=1, 8 do
			--gems[y][x] = {}
			gems[y][x] = math.random(1, 6)
		end
	end
	
	FindRemoveMatch()
	
end

---------------------------------


CreateRandomBoard ()
	

for y=1, 8 do
	for x=1, 8 do
		io.write( gems[y][x] )
	end
	io.write('\n')
end

--io.stdout:write(2)









