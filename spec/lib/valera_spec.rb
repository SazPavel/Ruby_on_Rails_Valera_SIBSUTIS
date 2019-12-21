# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Valera do
  let(:valera) { Valera.new(100, 100, 10, 10, 100) }
  let(:dead_valera) { Valera.new(0, 0, 0, 0, 0) }
  let(:invalid_valera) { Valera.new(10_000, -100, 1000, -1000, -1000) }

  describe '#initializer' do
    context 'when health > 100' do
      it { expect(invalid_valera.health).to be 100 }
    end
    context 'when mana < 0' do
      it { expect(invalid_valera.mana).to be 0 }
    end
    context 'when cheerfulness > 10' do
      it { expect(invalid_valera.cheerfulness).to be 10 }
    end
    context 'when fatigue < 0' do
      it { expect(invalid_valera.fatigue).to be 0 }
    end
    context 'when money < 0' do
      it { expect(invalid_valera.money).to be 0 }
    end
  end

  describe '#reinitializer' do
    context 'when correct reinitialize' do
      subject { Valera.new(0, 0, 0, 0, 0) }
      it do
        subject.reinitialize!(10, 10, 10, 10, 10)
        expect(subject.health).to be 10
        expect(subject.mana).to be 10
        expect(subject.cheerfulness).to be 10
        expect(subject.fatigue).to be 10
        expect(subject.money).to be 10
      end
    end
    context 'when incorrect reinitialize' do
      subject { Valera.new(0, 0, 0, 0, 0) }
      it do
        subject.reinitialize!(1000, 1000, 1000, 1000, -1000)
        expect(subject.health).to be 100
        expect(subject.mana).to be 100
        expect(subject.cheerfulness).to be 10
        expect(subject.fatigue).to be 100
        expect(subject.money).to be 0
      end
    end
  end

  describe '#change_properties!' do
    context 'when mana decrease' do
      it { expect(valera.change_properties!('mana', -50)).to be 50 }
    end
    context 'when health encrease' do
      it { expect(dead_valera.change_properties!('health', 10)).to be 10 }
    end
    context 'when cheerfulness more then 10' do
      it { expect(valera.change_properties!('cheerfulness', 50)).to be 10 }
    end
    context 'when fatigue less then 0' do
      it { expect(valera.change_properties!('fatigue', -150)).to be 0 }
    end
    context 'when money more then 100' do
      it { expect(valera.change_properties!('money', 150)).to be 250 }
    end
  end

  describe '#alive?' do
    context 'when true' do
      it { expect(valera.alive?).to be true }
    end
    context 'when false' do
      it { expect(dead_valera.alive?).to be false }
    end
  end
end
