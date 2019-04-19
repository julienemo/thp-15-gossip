require 'bundler'
Bundler.require


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
  end


  def self.all
    file = CSV.read("db/gossip.csv")
    return file.each_with_index.map{|row,i|
      "#{i+1}. #{row[0]} says #{row[1]}"
    }
  end

  def self.delete(index)
    content = CSV.read("db/gossip.csv")
    content.delete_at(index - 1)
    file = File.open("db/gossip.csv","w")
    content.each {|row| file.puts("#{row[0]},#{row[1]}")}
    file.close
  end
end
