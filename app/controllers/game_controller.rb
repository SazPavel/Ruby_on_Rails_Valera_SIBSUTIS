# frozen_string_literal: true

# GameController
class GameController < ApplicationController
  include GameHelper
  before_action :authenticate_user!
  add_flash_types :valera_action

  def show
    action = all_actions.find { |a| a.name == params[:valera_action] }
    if not VALERA[current_user.id]
      VALERA[current_user.id] = Valera.new
    end
    @last_action = action.after_text unless action.nil?
  end
    
  def execute_action
    action = available.find { |a| a.name == params[:action_name] }
    action.execute!(VALERA[current_user.id]) unless action.nil?
    params = params.except(:action_name) unless params.nil?

    redirect_to action: "show", valera_action: action.name
  end

  def init_valera
    @valera = ValeraParam.new
    @valera.health = 100
    @valera.money = 100
    valera_update(@valera)
    redirect_to action: "show"
  end
  
  def load_valera
    @valera = ValeraParam.find_by(user_id: current_user.id)
    if @valera.nil?
      init_valera
      @valera.user_id = current_user.id
    else
      valera_update(@valera)
      redirect_to action: "show"
    end
  end
  
  def save_valera
    @valera = ValeraParam.find_by(user_id: current_user.id)
    if @valera.nil?
      @valera = ValeraParam.new
      @valera.user_id = current_user.id
    end
    @valera.health = VALERA[current_user.id].health
    @valera.mana = VALERA[current_user.id].mana
    @valera.cheerfulness = VALERA[current_user.id].cheerfulness
    @valera.fatigue = VALERA[current_user.id].fatigue
    @valera.money = VALERA[current_user.id].money
    @valera.save
    redirect_to action: "show"
  end
end
