class TicTacToe
	attr_accessor :board, :player_symbol, :computer_symbol, :current_player, :game_over
	@@winning_combinations = [
								[0, 1, 2],
							 	[3, 4, 5],
							 	[6, 7, 8],
							 	[0, 3, 6],
							 	[1, 4, 7],
							 	[2, 5, 8],
							 	[0, 4, 8],
							 	[2, 4, 6]
							 ]

	@game_over = false
	

	def initialize
		@board = '---------'.split('')
		print "Do you want to be X or O? "
		@player_symbol = gets.chomp()
		@computer_symbol = player_symbol == 'X'? 'O' : 'X'
		@current_player = "player"
	end

	def print_board
		puts board.slice(0..2).join(' ')
		puts board.slice(3..5).join(' ')
		puts board.slice(6..8).join(' ')
	end
	
	def computer_move
		legal_moves = []
		board.each_with_index { |n, index| legal_moves << index if n == '-' }
		puts legal_moves
		move = legal_moves.sample(1)
		board[move[0].to_i] = computer_symbol
		# puts "HEllo?!"
	end

	def player_move
		puts "Where do you move? [0-8]"
		move = gets.chomp().to_i
		board[move] = player_symbol
	end

	def current_player_win?
		if current_player == "player"
			current_symbol = player_symbol
		else
			current_symbol = computer_symbol
		end

		@@winning_combinations.each do |x, y, z|
			if board[x] == current_symbol && board[y] == current_symbol && board[z] == current_symbol
				return true
			end
		end
		false
	end

	def start
		while !game_over
			#get input from current player
			current_player == "player" ? player_move : computer_move

			#print board
			print_board

			if current_player_win?
				puts "#{current_player} WINS!"
				break
			elsif board.find { |x| x == '-' }.nil?
				puts "Its a draw!"
				break
			end

			if current_player == "player"
				@current_player = 'ai'
			else
				@current_player = "player"
			end

		end
	end

end

game = TicTacToe.new
game.start