# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GameController, type: :controller do
  context 'when user' do
    login_user

    it 'should have a current_user' do
      expect(subject.current_user).to_not eq(nil)
    end
    it 'should not be a admin' do
      expect(subject.current_user.admin).to eq(nil)
    end
    describe 'GET #show' do
      subject { get :show }
      it 'should get show' do
        expect(subject).to have_http_status(:success)
      end
    end
  end
end
