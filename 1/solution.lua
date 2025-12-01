count = 0
dial = 50

local file = "input.txt"

for line in io.lines(file) do
	is_left = string.find(line, "L")
	magnitude = string.sub(line, 2)
	if is_left == nil then
		if dial + magnitude > 99 then
			dial = math.fmod((dial + magnitude), 100)
		else
			dial = dial + magnitude
		end
	else
		if dial - magnitude < 0 then
			res = math.fmod((dial - magnitude), 100)
			if res == 0 then
				dial = res
			else
				dial = 100 + res
			end
		else
			dial = dial - magnitude
		end
	end
	if dial == 0 then ; count = count + 1 ; end
end

print("password = ", count)
