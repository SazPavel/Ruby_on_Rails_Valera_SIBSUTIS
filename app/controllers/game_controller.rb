# frozen_string_literal: true

# GameController
class GameController < ApplicationController
  include GameHelper

  def show;  end

  def index
    render :show
  end

  def execute_action
    action = get_available.find { |a| a.name == params[:action_name] }
    valeroid = action.execute!(VALERA) unless action.nil?
    redirect_to action: 'show'
  end
end
