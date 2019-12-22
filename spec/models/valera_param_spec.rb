# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ValeraParam, type: :model do
  describe 'when valid attributes' do
    it 'is valid' do
      expect(ValeraParam.new(user_id: 1, health: 100, mana: 100, 
      					             cheerfulness: 10, fatigue: 100, 
    	 				               money: 100)).to be_valid
    end
  end
  describe 'when not valid attributes' do
    context 'without attribute' do
      it 'is not valid without user_id' do
        expect(ValeraParam.new(health: 100, mana: 100, 
                               cheerfulness: 10, fatigue: 100, 
                               money: 100)).to_not be_valid
      end
      it 'is not valid without health' do
        expect(ValeraParam.new(user_id: 1, mana: 100, 
                               cheerfulness: 10, fatigue: 100, 
                               money: 100)).to_not be_valid
      end
      it 'is not valid without mana' do
        expect(ValeraParam.new(user_id: 1, health: 100,
                               cheerfulness: 10, fatigue: 100, 
                               money: 100)).to_not be_valid
      end
      it 'is not valid without cheerfulness' do
        expect(ValeraParam.new(user_id: 1, health: 100, mana: 100,
                               fatigue: 100, 
                               money: 100)).to_not be_valid
      end
      it 'is not valid without fatigue' do
        expect(ValeraParam.new(user_id: 1, health: 100, mana: 100, 
                               cheerfulness: 10, 
                               money: 100)).to_not be_valid
      end
      it 'is not valid without money' do
        expect(ValeraParam.new(user_id: 1, health: 100, mana: 100, 
                               cheerfulness: 10, 
                               fatigue: 100)).to_not be_valid
      end
    end
    context 'with incorrect attribute' do
      it 'is not valid if health less then 0' do
        expect(ValeraParam.new(user_id: 1, health: -1, mana: 100, 
                               cheerfulness: 10, fatigue: 100, 
                               money: 100)).to_not be_valid
      end
      it 'is not valid if health less greater 100' do
        expect(ValeraParam.new(user_id: 1, health: 101, mana: 100, 
                               cheerfulness: 10, fatigue: 100, 
                               money: 100)).to_not be_valid
      end
      it 'is not valid if mana less then 0' do
        expect(ValeraParam.new(user_id: 1, health: 100, mana: -1, 
                               cheerfulness: 10, fatigue: 100, 
                               money: 100)).to_not be_valid
      end
      it 'is not valid if mana less greater 100' do
        expect(ValeraParam.new(user_id: 1, health: 100, mana: 101, 
                               cheerfulness: 10, fatigue: 100, 
                               money: 100)).to_not be_valid
      end
      it 'is not valid if cheerfulness less then -10' do
        expect(ValeraParam.new(user_id: 1, health: 100, mana: 100, 
                               cheerfulness: -11, fatigue: 100, 
                               money: 100)).to_not be_valid
      end
      it 'is not valid if cheerfulness less greater 10' do
        expect(ValeraParam.new(user_id: 1, health: 100, mana: 100, 
                               cheerfulness: 11, fatigue: 100, 
                               money: 100)).to_not be_valid
      end
      it 'is not valid if fatigue less then 0' do
        expect(ValeraParam.new(user_id: 1, health: 100, mana: 100, 
                               cheerfulness: 10, fatigue: -1, 
                               money: 100)).to_not be_valid
      end
      it 'is not valid if fatigue less greater 100' do
        expect(ValeraParam.new(user_id: 1, health: 100, mana: 100, 
                               cheerfulness: 10, fatigue: 101, 
                               money: 100)).to_not be_valid
      end
      it 'is not valid if money less then 0' do
        expect(ValeraParam.new(user_id: 1, health: 100, mana: 100, 
                               cheerfulness: 10, fatigue: 100, 
                               money: -1)).to_not be_valid
      end
    end
  end
end
