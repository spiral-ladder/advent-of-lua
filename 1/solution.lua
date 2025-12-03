local count = 0
local dial = 50
local file = "input.txt"

for line in io.lines(file) do
	local direction = string.sub(line, 1, 1)
	local distance = tonumber(string.sub(line, 2))

	if direction == "L" then
		local tmp = (dial - distance) % 100
		if tmp > dial and dial ~= 0 then
			count = count + 1
		end
		dial = tmp
	elseif direction == "R" then
		local tmp = (dial + distance) % 100
		if tmp < dial and tmp ~= 0 then
			count = count + 1
		end
		dial = tmp
	else
		error("Invalid direction: " .. tostring(direction))
	end

	if dial == 0 then
		count = count + 1
	end

	count = count + math.floor(distance / 100)
end

print("password = ", count)
