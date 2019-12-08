class GameController < ApplicationController
  include GameHelper
  def show
    redirect_to :index
  end
  def index
    render :show
  end
#  def print_valera
#    redirect_to :show
#  end
end
