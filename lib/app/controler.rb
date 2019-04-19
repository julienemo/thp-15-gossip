require 'bundler'
Bundler.require

require_relative "gossip"
require_relative "../view/view"

class Controler

  def create
    gossip = Gossip.new
    gossip.save
  end

  def show_all
    messages = []
    CSV.foreach("db/gossip.csv") do |row|
      messages << "#{row[0]} says #{row[1]}"
    end

    messages[1..-1].each_with_index do |mess,i|
      PrintMe.new.message(mess, 5)
    end
    puts ""
  end

end
