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
      choice =  PrintMe.new.get_question_answer("Choose the corresponding action：", 5).to_i
      case choice
      when 1
        puts "-"*38
        PrintMe.new.message("You've choosen to create a gossip!", 5)
        puts ""
        @controler.create_gossip
      when 2
        puts "-"*38
        PrintMe.new.message("You've choosen to see all the gossips!", 5)
        puts ""
        @controler.show_all
      when 3
        puts "-"*38
        PrintMe.new.message("You've choosen to to delete a gossip!", 5)
        puts ""
        @controler.delete
      when 4
        PrintMe.new.aired_message("Go get some inspiration ! Seeya soon !")
        exit
      else
        puts "Come again? Didn't get that..."
      end
    end
  end

  def menu
    puts ""
    PrintMe.new.message("Press <1> to create a gossip", 5)
    PrintMe.new.message("Press <2> to see all the gossips", 5)
    PrintMe.new.message("Press <3> to delete a gossip", 5)
  end
end
