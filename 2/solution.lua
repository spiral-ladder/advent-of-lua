local file = io.open("input.txt", "r")

local data = file:read("*a")

data = data .. ","

local pat = "(%d+)%D(%d+)"

function part1()
	invalids_sum = 0
	for n1, n2 in string.gmatch(data, pat) do
		for n = tonumber(n1), tonumber(n2) do
			local str = tostring(n)
			local len = string.len(str)
			if len % 2 == 0 then
				l = string.sub(str, 0, len / 2)
				r = string.sub(str, len / 2 + 1, len)

				if tonumber(l) == tonumber(r) then
					invalids_sum = invalids_sum + n
				end
			end
		end
	end
	print("num invalids (part1) = ", invalids_sum)
end

function part2()
	invalids = {}
	invalids_sum = 0
	for n1, n2 in string.gmatch(data, pat) do
		for n = tonumber(n1), tonumber(n2) do
			local str = tostring(n)
			local len = string.len(str)

			for i = 0, len / 2 + 1 do
				seq = string.sub(str, 0, i + 1)
				seq_len = string.len(seq)
				remaining = string.sub(str, i + 2, len)
				local repeats = 1

				while string.len(remaining) > 0 do
					possible_seq = string.sub(remaining, 0, seq_len)

					remaining_len = string.len(remaining)

					remaining = string.sub(remaining, seq_len + 1)

					if possible_seq == seq then
						repeats = repeats + 1
					else
						repeats = 1
						break
					end
				end

				if repeats > 1 then
					if invalids[n] ~= true then
						invalids_sum = invalids_sum + n
					end
					invalids[n] = true
				end
			end
		end
	end
	print("num invalids (part2) = ", invalids_sum)
end

part1()
part2()
