# frozen_string_literal: true

# GameController
class GameController < ApplicationController
  include GameHelper

  def show;  end

  def execute_action
    action = available.find { |a| a.name == params[:action_name] }
    valeroid = action.execute!(VALERA) unless action.nil?
    redirect_to action: 'show'
  end

  def refresh
  	VALERA.reinitialize!(100, 0, 0, 0, 100)
    redirect_to action: 'show'
  end
end
