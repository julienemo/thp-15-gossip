require 'bundler'
Bundler.require

require_relative "../view/print_me"

class Gossip

  attr_reader :author, :content, :gossip_list

  def initialize(content, author)
    @content = content
    @author = author
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

  def self.all
    gossips = []
    CSV.foreach("db/gossip.csv") do |row|
      gossips << "#{row[0]} says #{row[1]}"
    end
    return gossips
  end

end
