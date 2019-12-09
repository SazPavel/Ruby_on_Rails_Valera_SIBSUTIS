# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  post = FactoryBot.create(:post_comment_model)
  it 'is valid with valid attributes' do
    expect(Comment.new(post: post, commenter: 'name', body: 'text')).to be_valid
  end
  it 'is not valid without commenter' do
    expect(Comment.new(post: post, body: 'text')).to_not be_valid
  end
  it 'is not valid without body' do
    expect(Comment.new(post: post, commenter: 'name')).to_not be_valid
  end
end
