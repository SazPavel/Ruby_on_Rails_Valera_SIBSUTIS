# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  post = FactoryBot.create(:post_comment)
  comment = FactoryBot.create(:comment)

  describe 'GET #create' do
    subject do
      get :create, params: { post_id: post.id, \
                             comment: { commenter: 'good test', body: 'Test' } }
    end
    it 'should redirect after create' do
      expect(subject).to have_http_status(:redirect)
    end
  end
  describe 'GET #destroy' do
    subject do
      get :destroy, params: { post_id: post.id, id: comment.id }
    end
    it 'should redirect after destroy' do
      expect(subject).to have_http_status(:redirect)
    end
  end
end
