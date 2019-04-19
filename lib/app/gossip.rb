require 'bundler'
Bundler.require

require_relative "../view/print_me"

class Gossip

  attr_reader :author, :content, :gossip_list

  def initialize
    @content = PrintMe.new.get_question_answer("What did you heard from the street ??",5).downcase
    @author = PrintMe.new.get_question_answer("And who do we say this is from ?",5).capitalize
    PrintMe.new.aired_message("!!!#{@author} says #{@content}", 5)
  end

  def save
    csv_string = "#{@author},#{@content}"
    csv_file = File.open("db/gossip.csv", "a")
    csv_file.puts(csv_string)
    csv_file.close
    PrintMe.new.message("Gossip registered ~", 5)
    puts ""
  end

  def delete
    puts "partie non ecrite"
  end

  def self.show_all
    @@gossip_list.each do |gossip|
      puts "#{gossip.author}：#{gossip.content}."
    end
  end

  def self.count
    return @@gossip_list.length
  end

end

# Gossip.new
# Gossip.show_all
# puts Gossip.count
