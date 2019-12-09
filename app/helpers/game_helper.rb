module GameHelper

 def get_available
   loader = ActionLoader.new('action.yaml')
   loader.load
   loader.available_action(VALERA)
 end

end
