class DanceMaker
	NUM_TIMES = [
		"",
		"twice",
		"thrice"
	]

	attr_accessor :movements, :qualities, :duration, :scale

	def initialize(attrs)
		self.movements = attrs[:moves]
		set_movement_probabilities
		self.qualities = attrs[:qualities]
		self.duration = attrs[:duration] || 4
		self.scale = {}
		make_dance
	end

	def make_dance
		duration.times { |n| output_dance(n) }
	end

	def output_dance(n)
		puts n + 1
		output(make_moves)
	end
	
	def output(moves)
		moves.each_with_index do |move, index|
		  puts "#{index + 1}: " + move
		end
		puts
	end

	def set_movement_probabilities
		total = 0
		weights = {}
		movements.each do |move|
			weight = move[:weight]
			total += weight
			weights[total.to_s] = move[:name]
		end
	end

	def make_moves
		moves = []
		8.times { moves << movement + times_repeated + movement_quality }
		moves
	end

	def movement
		# TODO: make it so that movements aren't just randomly chosen.
		# Make it possible to specify the probablity that a move gets selected.
		num = (1..100).to_a.sample
		scale.each do |move|
			if num <= move.key.to_i
		end
		movements.choose_movement
	end

	def times_repeated
		repeat = NUM_TIMES.sample
		repeat.empty? ? repeat : " " + repeat
	end

	def movement_quality
		" " + qualities.sample
	end
end


funny_dance_attrs = {
	moves: [
		name: "smile", weight: 15,
		name: "jump", weight: 15,
		name: "shake", weight: 15,
		name: "kick", weight: 15,
		name: "stick out tongue", weight: 5,
		name: "turn head", weight: 5,
		name: "give attitude", weight: 12,
		name: "gesture", weight: 18
	],

	qualities: [
		"lovingly",
		"nervously",
		"slowly",
		"frantically",
		"numbly"
	],

	duration: 2
}

beautiful_dance_attrs = {
	moves: [
		"arch",
		"developpe",
		"pirouette"
	],

	qualities: [
		"gently",
		"slowly",
		"softly"
	],

	duration: 6
}


# funny_dance = DanceMaker.new(funny_dance_attrs)
beautiful_dance = DanceMaker.new(beautiful_dance_attrs)


