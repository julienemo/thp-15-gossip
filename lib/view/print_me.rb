require 'bundler'
Bundler.require

class PrintMe

  def aired_message(message,nb_space)
    puts "="*38
    puts ""
    print " "* nb_space
    puts message
    puts ""
    puts "="*38
  end

  def get_question_answer(question,nb_space)
    print " "*nb_space
    puts "#{question}"
    print " "*nb_space
    print "> "
    ans = gets.chomp
    puts ""
    return ans
  end

  def message(message,nb_space)
    print " "*nb_space
    puts message
  end
end
