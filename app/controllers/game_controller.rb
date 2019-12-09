# frozen_string_literal: true

# GameController
class GameController < ApplicationController
  include GameHelper
  before_action :authenticate_user!, expect: %i[index show]

  def show;  end

  def execute_action
    action = available.find { |a| a.name == params[:action_name] }
    valeroid = action.execute!(VALERA) unless action.nil?
    redirect_to action: "show"
  end
    
  def init_valera
    @valera = ValeraParam.new
    @valera.user_id = current_user.id
    @valera.health = 100
    @valera.money = 100
    valera_update(@valera)
    redirect_to action: "show"
  end
  
  def load_valera
    begin
      @valera = ValeraParam.find_by(user_id: current_user.id)
      if @valera.nil?
        init_valera
      else
        valera_update(@valera)
        redirect_to action: "show"
      end
    rescue ActiveRecord::RecordNotFound
      init_valera
    end
  end
  
  def save_valera
    @valera = ValeraParam.find_by(user_id: current_user.id)
    if @valera.nil?
      @valera = ValeraParam.new
      @valera.user_id = current_user.id
    end
    @valera.health = VALERA.health
    @valera.mana = VALERA.mana
    @valera.cheerfulness = VALERA.cheerfulness
    @valera.fatigue = VALERA.fatigue
    @valera.money = VALERA.money
    @valera.save
    redirect_to action: "show"
  end
end
