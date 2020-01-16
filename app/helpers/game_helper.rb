
module GameHelper

  def available
    loader = ActionLoader.new('action.yaml')
    loader.load
    valera = Valera.new(
      current_user.valera_param.health,
      current_user.valera_param.mana,
      current_user.valera_param.cheerfulness,
      current_user.valera_param.fatigue,
      current_user.valera_param.money
    )
    loader.available_action(valera)
  end

  def all_actions
    loader = ActionLoader.new('action.yaml')
    loader.load
  end
end
