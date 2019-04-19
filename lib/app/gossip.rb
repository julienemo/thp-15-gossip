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
    file = CSV.read("db/gossip.csv")
    gossips = []
    file.each_with_index do |row, index|
      gossips << "#{index+1}. #{row[0]} says #{row[1]}"
    end
    return gossips
  end

  def self.delete(index_of_gossip_to_delete)
    table = CSV.read("db/gossip.csv")
    p table
    table.delete_at(index_of_gossip_to_delete - 1)
    p table

    File.open("db/gossip.csv", 'w') do |f|
      f.write(table.to_csv)
    end
  end
end
