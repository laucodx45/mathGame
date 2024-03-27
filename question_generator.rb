class QuestionGenerator

  def pick_two_nums(player)
    "#{player}, please pick two numbers ranging from 1 to 20. Please leave a space in between the numbers."
  end
  
  def random_operator
    operators = ["plus", "minus", "divide", "multiply"]
    randomized_operator = operators.sample
    return randomized_operator
  end

  def generate_question(num1, num2, player)
    operator = random_operator
    "#{player}: What does #{num1} #{operator} #{num2} equal?"
  end 


  def get_answer(question, input_ans, num1, num2)
    if question.include?("plus")
      correct_ans = num1 + num2
    elsif question.include?("minus")
      correct_ans = num1 - num2
    elsif question.include?("divide")
      correct_ans = (num1.to_f / num2.to_f).round(2)
    elsif question.include?("multiply")
      correct_ans = num1 * num2
    end

    if (input_ans - correct_ans).abs < 0.001
      return "YES. You are correct!"
    else
      return "Seriously? No!"
    end
  end

end