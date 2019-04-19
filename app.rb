require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)

require "view/router"

class App

  def initialize
    Router.new.perform
  end
end

App.new
