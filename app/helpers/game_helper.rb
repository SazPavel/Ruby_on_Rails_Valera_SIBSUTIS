
module GameHelper

  def available
    loader = ActionLoader.new('action.yaml')
    loader.load
    loader.available_action(VALERA[current_user.id])
  end

  def all_actions
    loader = ActionLoader.new('action.yaml')
    loader.load
  end

  def valera_update(valera)
    VALERA[current_user.id].reinitialize!(valera.health, valera.mana,
      valera.cheerfulness, valera.fatigue, valera.money)
  end
end
