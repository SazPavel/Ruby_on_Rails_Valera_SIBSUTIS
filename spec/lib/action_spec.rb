# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Action do
  let(:valera) { Valera.new(100, 100, 0, 0, 0) }
  let(:action_decrease) do
    Action.new(name: 'work', effects: \
      [{ 'field' => 'mana', 'operator' => '-', 'value' => 50 }, \
       { 'field' => 'fatigue', 'operator' => '-', 'value' => 10 }])
  end
  let(:action_increase) do
    Action.new(name: 'work', effects: \
      [{ 'field' => 'mana', 'operator' => '+', 'value' => 50 }, \
       { 'field' => 'fatigue', 'operator' => '+', 'value' => 10 }])
  end
  describe '#execute!' do
    context 'when decrease' do
      subject { action_decrease.execute!(valera) }
      it { is_expected.to be_a Valera }
      it { expect(subject.mana).to eq 50 }
      it { expect(subject.fatigue).to eq 0 }
    end
    context 'when increase' do
      subject { action_increase.execute!(valera) }
      it { is_expected.to be_a Valera }
      it { expect(subject.mana).to eq 100 }
      it { expect(subject.fatigue).to eq 10 }
    end
  end
end
