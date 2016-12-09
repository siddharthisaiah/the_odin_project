class MasterMind
	attr_accessor :code, :game_over

	@@code_colors = ['g', 'b', 'r', 'y', 'p', 'w']
	@game_over = false

	def initialize
		generate_code
		start
	end

	def generate_code
		@code = []
		4.times { |n| @code << @@code_colors.sample(1)[0] }
	end

	def guess
		print "Enter your guess: "
		guess = gets.chomp.split('')	
	end

	def start
		puts "The code has been generated! start guessing: "
		puts "Green: 'g'\nBlue: 'b'\nRed: 'r'\nYellow: 'y'\nPink: 'p'\nWhite: 'w'\n\n"

		puts code
		while !game_over
			g = guess
			if g == code
				puts "Whoohoo! YOU WON!!"
				break
			end

			red = 0
			white = 0

			
		end
	end
end


#colors - green, blue, red, yellow, black, white

game = MasterMind.new