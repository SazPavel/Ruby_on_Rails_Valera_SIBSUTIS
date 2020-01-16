# frozen_string_literal: true

# GameController
class GameController < ApplicationController
  include GameHelper
  before_action :authenticate_user!
  add_flash_types :valera_action

  def show
    action = all_actions.find { |a| a.name == params[:valera_action] }
    if current_user.valera_param.nil?
      valeraa = ValeraParam.new
      valeraa.health = 100
      valeraa.mana = 0
      valeraa.cheerfulness = 0
      valeraa.fatigue = 0
      valeraa.money = 100
      current_user.valera_param = valeraa
    end
    @last_action = action.after_text unless action.nil?
    @user = current_user.id

  end
    
  def execute_action    
    valera = Valera.new(
      current_user.valera_param.health,
      current_user.valera_param.mana,
      current_user.valera_param.cheerfulness,
      current_user.valera_param.fatigue,
      current_user.valera_param.money
    )
    action = available.find { |a| a.name == params[:action_name] }
    action.execute!(valera) unless action.nil?
    params = params.except(:action_name) unless params.nil?
    
    current_user.valera_param.health = valera.health
    current_user.valera_param.mana = valera.mana
    current_user.valera_param.cheerfulness = valera.cheerfulness
    current_user.valera_param.fatigue = valera.fatigue
    current_user.valera_param.money = valera.money
    current_user.valera_param.save  

    redirect_to action: "show", valera_action: action.name
  end

  def init_valera
    current_user.valera_param.health = 100
    current_user.valera_param.mana = 0
    current_user.valera_param.cheerfulness = 0
    current_user.valera_param.fatigue = 0
    current_user.valera_param.money = 100
    current_user.valera_param.save

    redirect_to action: "show"
  end
end
