require 'bundler'
Bundler.require

class PrintMe

  def self.aired_message(message,nb_space)
    puts "="*38
    puts ""
    print " "* nb_space
    puts message
    puts ""
    puts "="*38
  end

  def self.get_question_answer(question,nb_space)
    print " "*nb_space
    puts "#{question}"
    print " "*nb_space
    print "> "
    ans = gets.chomp
    puts ""
    return ans
  end

  def self.message(message,nb_space)
    print " "*nb_space
    puts message
  end
end
