class ValeraParam < ApplicationRecord
  validates :user_id, presence: true, numericality: true
  validates :health, presence: true, 
    		numericality: { greater_than_or_equal_to: 0,
    			           less_than_or_equal_to: 100 }
  validates :mana, presence: true, 
    		numericality: { greater_than_or_equal_to: 0,
    			           less_than_or_equal_to: 100 }
  validates :cheerfulness, presence: true, 
    		numericality: { greater_than_or_equal_to: -10,
    			           less_than_or_equal_to: 10 }
  validates :fatigue, presence: true, 
    		numericality: { greater_than_or_equal_to: 0,
    			           less_than_or_equal_to: 100 }
  validates :money, presence: true, 
    		numericality: { greater_than_or_equal_to: 0 }
end
