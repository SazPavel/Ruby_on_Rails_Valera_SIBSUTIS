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
    @iozhic = current_user.valera_param

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
    
    VALERA[current_user.id].reinitialize!(
      current_user.valera_param.health, 
      current_user.valera_param.mana,
      current_user.valera_param.cheerfulness,
      current_user.valera_param.fatigue,
      current_user.valera_param.money
    )
      

    redirect_to action: "show", valera_action: action.name
  end

  def init_valera
    current_user.valera_param.health = 100
    current_user.valera_param.mana = 0
    current_user.valera_param.cheerfulness = 0
    current_user.valera_param.fatigue = 0
    current_user.valera_param.money = 100
    current_user.valera_param.save
    VALERA[current_user.id].reinitialize!(
      current_user.valera_param.health, 
      current_user.valera_param.mana,
      current_user.valera_param.cheerfulness,
      current_user.valera_param.fatigue,
      current_user.valera_param.money
    )
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
