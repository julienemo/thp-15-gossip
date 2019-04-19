require 'bundler'
Bundler.require

require_relative "view"
require_relative "../app/gossip"
require_relative "../app/controler"
require_relative "print_me"

class Router

  def initialize
    @controler =  Controler.new
  end

  def perform
    welcome
    action
  end

  private

  def welcome
    puts '   ' + '-' * 33
    puts '   |        Welcome to the         |'
    puts '   |                               |'
    puts '   |       Machine of Gossips      |'
    puts '   |                               |'
    puts '   |   powered by Julie the sage   |'
    puts '   ' + '-' * 33
  end

  def action
    while true
      menu
      choice =  PrintMe.get_question_answer("Choose the corresponding action：", 5).to_i
      case choice
      when 1
        PrintMe.aired_message("You've choosen to create a gossip!", 5)
        puts ""
        @controler.create_gossip
      when 2
        PrintMe.aired_message("You've choosen to see all the gossips!", 5)
        puts ""
        @controler.show_all
      when 3
        PrintMe.aired_message("You've choosen to to delete a gossip!", 5)
        puts ""
        @controler.delete
      when 4
        PrintMe.aired_message("Go get some inspiration ! Seeya soon !", 5)
        exit
      else
        puts "Come again? Didn't get that..."
      end
    end
  end

  def menu
    puts ""
    PrintMe.message("Press <1> to create a gossip", 5)
    PrintMe.message("Press <2> to see all the gossips", 5)
    PrintMe.message("Press <3> to delete a gossip", 5)
    PrintMe.message("Press <4> to quit", 5)
  end
end
