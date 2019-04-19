require 'bundler'
Bundler.require

require_relative "print_me"
require_relative "../app/gossip"

class View


  def create_gossip
    content_ans = PrintMe.get_question_answer("What did you heard from the street ??",5).downcase
    author_ans = PrintMe.get_question_answer("And who do we say this is from ?",5).capitalize
    { content: content_ans, author: author_ans }
  end

  def show_gossip(message, nb_space)
    PrintMe.message(message,nb_space)
  end

  def delete
    ans = PrintMe.get_question_answer("Which one do you want to get rid of? \n type the preceeding number",5).to_i
    { index_to_delete: ans }
  end
end
