# frozen_string_literal: true

require 'action.rb'

# Checker for available actions
class ValeraChecker
  def self.check(valera, action)
    available?(valera, action) && valera.alive? ? action : nil
  end

  def self.available?(valera, action)
    cond_results = []
    action.conds.each do |cond|
      cond_results.push( \
        (valera.send cond['field']).send(cond['operator'], cond['value'])
      )
    end
    !cond_results.include?(false)
  end

  private_class_method :available?
end
