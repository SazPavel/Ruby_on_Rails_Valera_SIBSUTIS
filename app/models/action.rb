class Action #< ApplicationRecord
  attr_accessor :name, :conds, :effects, :before_text, :after_text

  def initialize(name: '', after_text: '',
                 before_text: '', conds: [], effects: [])
    @name = name
    @before_text = before_text
    @after_text = after_text
    @conds = conds
    @effects = effects
  end
=begin
  # executing actions (no valid check, since this happens in action_container)
  def execute!(valera)
    @effects.each do |effect|
      valera.change_properties!(effect['field'],
                                effect['operator'].to_s +
                                effect['value'].to_s)
    end
    valera
  end
=end
end
