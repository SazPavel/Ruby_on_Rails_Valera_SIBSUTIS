# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  article = FactoryBot.create(:article)

  context 'when user' do
    login_user

    it 'should have a current_user' do
      expect(subject.current_user).to_not eq(nil)
    end
    it 'should not be a admin' do
      expect(subject.current_user.admin).to eq(nil)
    end
    describe 'GET #index' do
      subject { get :index }
      it 'should get index' do
        expect(subject).to have_http_status(:success)
      end
    end
    describe 'GET #create' do
      subject { get :create }
      it 'should not get create' do
        expect(subject).to have_http_status(:redirect)
      end
    end
    describe 'GET #new' do
      subject { get :new }
      it 'should not get new' do
        expect(subject).to have_http_status(:redirect)
      end
    end
    describe 'GET #show' do
      context 'with valid article' do
        subject { get :show, params: { id: article.id } }
        it 'should get show' do
          expect(subject).to have_http_status(:success)
        end
      end
      context 'with invalid article' do
        subject { get :show, params: { id: 100 } }
        it 'should not get show' do
          expect(subject).to have_http_status(:redirect)
        end
      end
    end
    describe 'GET #edit' do
      subject { get :edit, params: { id: article.id } }
      it 'should not get edit' do
        expect(subject).to have_http_status(:redirect)
      end
    end
    describe 'GET #update' do
      subject { get :update, params: { id: article.id } }
      it 'should not get update' do
        expect(subject).to have_http_status(:redirect)
      end
    end
    describe 'GET #destroy' do
      subject { get :destroy, params: { id: article.id } }
      it 'should not get destroy' do
        expect(subject).to have_http_status(:redirect)
      end
    end
  end

  context 'when unregistered' do
    it 'should not have a current_user' do
      expect(subject.current_user).to eq(nil)
    end
    describe 'GET #index' do
      subject { get :index }
      it 'should get index' do
        expect(subject).to have_http_status(:success)
      end
    end
    describe 'GET #create' do
      subject { get :create }
      it 'should not get create' do
        expect(subject).to have_http_status(:redirect)
      end
    end
    describe 'GET #new' do
      subject { get :new }
      it 'should not get new' do
        expect(subject).to have_http_status(:redirect)
      end
    end
    describe 'GET #show' do
      context 'with valid article' do
        subject { get :show, params: { id: article.id } }
        it 'should get show' do
          expect(subject).to have_http_status(:success)
        end
      end
      context 'with invalid article' do
        subject { get :show, params: { id: 100 } }
        it 'should not get show' do
          expect(subject).to have_http_status(:redirect)
        end
      end
    end
    describe 'GET #edit' do
      subject { get :edit, params: { id: article.id } }
      it 'should not get edit' do
        expect(subject).to have_http_status(:redirect)
      end
    end
    describe 'GET #update' do
      subject { get :update, params: { id: article.id } }
      it 'should not get update' do
        expect(subject).to have_http_status(:redirect)
      end
    end
    describe 'GET #destroy' do
      subject { get :destroy, params: { id: article.id } }
      it 'should not get destroy' do
        expect(subject).to have_http_status(:redirect)
      end
    end
  end

  context 'when admin' do
    login_admin

    it 'should have a current_user' do
      expect(subject.current_user).to_not eq(nil)
    end
    it 'should be a admin' do
      expect(subject.current_user.admin).to eq(true)
    end
    describe 'GET #create' do
      context 'with valid article' do
        subject do
          get :create, params: { article: { title: 'good test', text: 'Test' } }
        end
        it 'should redirect after create' do
          expect(subject).to have_http_status(:redirect)
        end
      end
      context 'with invalid article' do
        subject do
          get :create, params: { article: { title: 'Bad', text: 'Test' } }
        end
        it 'should not get create' do
          expect(subject).to have_http_status(:success)
        end
      end
    end
    describe 'GET #index' do
      subject { get :index }
      it 'should get index' do
        expect(subject).to have_http_status(:success)
        assigns(:articles).except eq([article])
      end
    end
    describe 'GET #new' do
      subject { get :new }
      it 'should get new' do
        expect(subject).to have_http_status(:success)
      end
    end
    describe 'GET #show' do
      context 'with valid article' do
        subject { get :show, params: { id: article.id } }
        it 'should get show' do
          expect(subject).to have_http_status(:success)
        end
      end
      context 'with invalid article' do
        subject { get :show, params: { id: 100 } }
        it 'should not get show' do
          expect(subject).to have_http_status(:redirect)
        end
      end
    end
    describe 'GET #edit' do
      subject { get :edit, params: { id: article.id } }
      it 'should get edit' do
        expect(subject).to have_http_status(:success)
      end
    end
    describe 'GET #update' do
      context 'with valid article' do
        subject do
          get :update, params: {
            id: article.id,
            article: { title: 'good', text: 'Test' }
          }
        end
        it 'should get update' do
          expect(subject).to have_http_status(:redirect)
        end
      end
      context 'with invalid article' do
        subject do
          get :update, params: {
            id: article.id, article: { title: 'Bad', text: 'Test' }
          }
        end
        it 'should not get update' do
          expect(subject).to have_http_status(:success)
        end
      end
    end
    describe 'GET #destroy' do
      subject { get :destroy, params: { id: article.id } }
      it 'should get destroy' do
        expect(subject).to have_http_status(:redirect)
      end
    end
  end
end
