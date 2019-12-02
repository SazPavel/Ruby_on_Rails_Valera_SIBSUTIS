require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:articles) {create :articles}
  context 'when admin' do
    login_admin

    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end
    it "should be a admin" do
      expect(subject.current_user.admin).to eq(true)
    end
    describe 'GET #index' do
      subject {get :index}
      it "should get index" do
        expect(subject).to have_http_status(:success)
      end
    end
  end

  context 'when user' do
    login_user

    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end
    it "should not be a admin" do
      expect(subject.current_user.admin).to eq(nil)
    end
    describe 'GET #index' do
      subject {get :index}
      it "should get index" do
        expect(subject).to have_http_status(:success)
      end
    end
  end

  context 'when unregistered' do
    it "should not have a current_user" do
      expect(subject.current_user).to eq(nil)
    end
    describe 'GET #index' do
      subject {get :index}
      it "should get index" do
        expect(subject).to have_http_status(:success)
      end
    end
  end
end
