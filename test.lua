
--os.execute('cls')


function wait(time)
	local duration = os.time() + time
	while os.time() < duration do end
end


s = os.date()

print(s)

