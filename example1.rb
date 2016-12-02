MAP_KEY = {}


def shortest(input)
	coordinate = [0,0]
	direction = "north"
	input.split(", ").each do |b|
		r_or_l = b.split("")[0]
		distance = b.split("")[1..-1]
		distance = distance.join("").to_i
		if r_or_l == "R"
			if direction == "north"
				direction = "east"
				coordinate[0] += distance
			elsif direction == "east"
				direction = "south"
				coordinate[1] -= distance
			elsif direction == "south"
				direction = "west"
				coordinate[0] -= distance
			elsif direction == "west"
				direction = "north"
				coordinate[1] += distance
			else 
				p "Failure"
			end
		elsif r_or_l == "L"
			if direction == "north"
				direction = "west"
				coordinate[0] -= distance
			elsif direction == "west"
				direction = "south"
				coordinate[1] -= distance
			elsif direction == "south"
				direction = "east"
				coordinate[0] += distance
			elsif direction == "east"
				direction = "north"
				coordinate[1] += distance
			else 
				p "Failure"
			end
		else 
			p "Failure"
		end
	end
	p coordinate.inject(0) {|sum, value| sum += value.abs}
end

input = "L5, R1, R3, L4, R3, R1, L3, L2, R3, L5, L1, L2, R5, L1, R5, R1, L4, R1, R3, L4, L1, R2, R5, R3, R1, R1, L1, R1, L1, L2, L1, R2, L5, L188, L4, R1, R4, L3, R47, R1, L1, R77, R5, L2, R1, L2, R4, L5, L1, R3, R187, L4, L3, L3, R2, L3, L5, L4, L4, R1, R5, L4, L3, L3, L3, L2, L5, R1, L2, R5, L3, L4, R4, L5, R3, R4, L2, L1, L4, R1, L3, R1, R3, L2, R1, R4, R5, L3, R5, R3, L3, R4, L2, L5, L1, L1, R3, R1, L4, R3, R3, L2, R5, R4, R1, R3, L4, R3, R3, L2, L4, L5, R1, L4, L5, R4, L2, L1, L3, L3, L5, R3, L4, L3, R5, R4, R2, L4, R2, R3, L3, R4, L1, L3, R2, R1, R5, L4, L5, L5, R4, L5, L2, L4, R4, R4, R1, L3, L2, L4, R3"
shortest(input)