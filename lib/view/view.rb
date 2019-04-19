require 'bundler'
Bundler.require

require_relative "print_me"
require_relative "../app/gossip"

class View


  def create_gossip
    content_ans = PrintMe.new.get_question_answer("What did you heard from the street ??",5).downcase
    author_ans = PrintMe.new.get_question_answer("And who do we say this is from ?",5).capitalize
    params =  { content: content_ans, author: author_ans }
  end

  def show_gossip(message, nb_space)
    PrintMe.new.message(message,5)
  end
end
