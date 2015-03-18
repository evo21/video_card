class InfoController < ApplicationController

  def index
  	@card = Card.new
  end
end