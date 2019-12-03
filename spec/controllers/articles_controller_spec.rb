require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  article = FactoryBot.create(:article) 
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
    describe 'GET #create' do
      context 'valid article' do
        subject {get :create, params: { article: {title: "good test", text: "Test" } } }
        it "should redirect after create" do
          expect(subject).to have_http_status(:redirect)
        end
      end
      context 'invalid article' do
        subject {get :create, params: { article: {title: "Bad", text: "Test" } } }
        it "should not get create" do
          expect(subject).to have_http_status(:success)
          #subject.should have_content("Title is too short")
        end
      end
    end
    describe 'GET #new' do
      subject {get :new}
      it "should get new" do
        expect(subject).to have_http_status(:success)
      end
    end
    describe 'GET #show' do
      subject {get :show, params: { id: article.id } }
      it "should get show" do
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
    describe 'GET #create' do
      subject {get :create}
      it "should not get create" do
        expect(subject).to have_http_status(:redirect)
      end
    end
    describe 'GET #new' do
      subject {get :new}
      it "should not get new" do
        expect(subject).to have_http_status(:redirect)
      end
    end
    describe 'GET #show' do
      subject {get :show, params: { id: article.id } }
      it "should get show" do
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
    describe 'GET #create' do
      subject {get :create}
      it "should not get create" do
        expect(subject).to have_http_status(:redirect)
      end
    end
    describe 'GET #new' do
      subject {get :new}
      it "should not get new" do
        expect(subject).to have_http_status(:redirect)
      end
    end
    describe 'GET #show' do
      subject {get :show, params: { id: article.id } }
      it "should get show" do
        expect(subject).to have_http_status(:success)
      end
    end
  end
end
