def number_input(prompt)
    loop do
      print prompt
      input = gets.chomp
      if (Float(input) rescue false)
        return input.to_f
      else
        puts "Invalid input. Please enter a valid number."
      end
    end
  end
  
  def perform_calculation(num1, num2, operator)
    case operator
    when "+"
      result = num1 + num2
      operation = "addition"
    when "-"
      result = num1 - num2
      operation = "subtraction"
    when "*"
      result = num1 * num2
      operation = "multiplication"
    when "/"
      if num2.zero?
        raise "Division by zero is not allowed."
      else
        result = num1 / num2
        operation = "division"
      end
    else
      puts "Please enter a valid operator."
      return
    end
  
    puts "#{num1} #{operator} #{num2} = #{result}"
    puts "Performed #{operation}."
  rescue => e
    puts "An error occurred: #{e.message}"
  end
  
  puts "Welcome to the calculator app!"
  puts ""
  
  num1 = number_input("Enter the first number: ")
  num2 = number_input("Enter the second number: ")
  
  operators = ["+", "-", "*", "/"]
  operator = nil
  
  loop do
    print "Enter the operator (+, -, *, /): "
    operator = gets.chomp
    break if operators.include?(operator)
    puts "Invalid operator. Please try again."
  end
  
  perform_calculation(num1, num2, operator)
  