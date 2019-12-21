# frozen_string_literal: true

require 'rails_helper'

# TODO: make tests less insane
RSpec.describe ActionLoader do
  describe '#load' do
    context 'when file exists' do
      let(:filename) { './spec/lib/test_action.yaml' }
      context 'testing text fields' do
        subject { ActionLoader.new(filename).load[0] }
        it { expect(subject.name).to eq 'work' }
        it { expect(subject.before_text).to eq 'Go to work' }
        it { expect(subject.after_text).to eq 'STUPID TEXT' }
      end
      context 'testing conditions' do
        subject { ActionLoader.new(filename).load[0].conds }
        it {
          expect(subject[0]).to eq \
            'field' => 'mana', 'operator' => '<', 'value' => 50
        }
        it {
          expect(subject[1]).to eq \
            'field' => 'fatigue', 'operator' => '<', 'value' => 10
        }
      end
      context 'testing effects' do
        subject { ActionLoader.new(filename).load[0].effects }
        it {
          expect(subject[0]).to eq \
            'field' => 'cheerfulness', 'operator' => '-', 'value' => 5
        }
        it {
          expect(subject[1]).to eq \
            'field' => 'mana', 'operator' => '-', 'value' => 30
        }
        it {
          expect(subject[2]).to eq \
            'field' => 'money', 'operator' => '+', 'value' => 150
        }
        it {
          expect(subject[3]).to eq \
            'field' => 'fatigue', 'operator' => '+', 'value' => 70
        }
      end
    end
    context 'when file doesn\'t exist' do
      subject { ActionLoader.new(filename).load }
      let(:filename) { 'no_action.yaml' }
      it { is_expected.to be nil }
    end
  end
end
