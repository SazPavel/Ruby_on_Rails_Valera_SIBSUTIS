
module GameHelper

  def available
    loader = ActionLoader.new('action.yaml')
    loader.load
    loader.available_action(VALERA)
  end

  def valera_update(valera)
    VALERA.reinitialize!(valera.health, valera.mana,
      valera.cheerfulness, valera.fatigue, valera.money)

  end
end
