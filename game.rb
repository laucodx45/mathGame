require './question_generator.rb'
require './player.rb'

class Game 
  def string_to_num(string)
    string.split(' ')[1].to_i
  end

  def start_game

    question_generator = QuestionGenerator.new
    player1 = Player.new
    player2 = Player.new

    while player1.lives > 0 && player2.lives > 0
  
      player_array = ["Player 1", "Player 2"]
    
      player_array.each do |player|
        player_number = string_to_num(player)
        puts question_generator.pick_two_nums(player)

        input_num = gets.chomp.split(' ')
        numbers = input_num.map(&:to_i)
    
        question = question_generator.generate_question(numbers[0], numbers[1], player)
        puts question
    
        input_ans = gets.chomp.to_f
        response_to_answer = " #{player}: #{question_generator.get_answer(question, input_ans, numbers[0], numbers[1])}"
        puts response_to_answer
    
        if response_to_answer.include?("No")
          if player_number == 1
            player1.decrement_lives
          else
            player2.decrement_lives
          end
        end
    
        puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
        puts "----- New Turn -----"
    
        if player1.lives == 0 || player2.lives == 0
          break  # Exit the loop if one of the players' lives reaches 0
        end
      end
    
    end
    
    puts player1.lives == 0 ? "Player 2 wins with a score of #{player2.lives}/3": "Player 1 wins with a score of #{player1.lives}/3"
    puts "----- Game Over -----"
    puts "Good bye!"
  end
end