require 'bundler'
Bundler.require

require_relative "gossip"
require_relative "../view/view"

class Controler
  attr_reader :view

  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    gossip = Gossip.new(params[:content], params[:author])
    gossip.save
  end

  def show_all
    CSV.foreach("db/gossip.csv") do |row|
      @view.show_gossip(row[0], row[1])
    end

    puts ""
  end

end
