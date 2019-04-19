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
    PrintMe.aired_message("Gossip saved", 5)

  end

  def show_all
    PrintMe.aired_message("All current gossips", 5)
    gossips = Gossip.all
    gossips.each do |row|
      @view.show_gossip(row, 5)
    end
  end

  def delete
    params = @view.delete
    i_to_del = params[:index_to_delete]
    Gossip.delete(i_to_del)
    PrintMe.aired_message("Gossip deleted", 5)
    puts ""
    show_all
  end
end
