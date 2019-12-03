class ActionsController < ApplicationController
#  def new
#    act = Action()
#    return act
#  end
  def new(name: '', after_text: '',
                 before_text: '', conds: [], effects: [])
    act = Action(name, after_text, before_text, conds, effects)
    return act
  end

end
