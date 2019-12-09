# frozen_string_literal: true

# GameHelper
module GameHelper
  def available
    loader = ActionLoader.new('action.yaml')
    loader.load
    loader.available_action(VALERA)
  end
end
