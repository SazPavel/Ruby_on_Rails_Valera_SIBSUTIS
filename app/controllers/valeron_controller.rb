class ValeronController < ApplicationController
  def new
    val = Valeron()
    val.health = 100
    @valeron = val
    return val
  end
=begin
  def index
    @valerons = Valeron.all
  end

  def create
    @valeron = Valeron(100, 0, 0, 0, 100)
  end
=end
end