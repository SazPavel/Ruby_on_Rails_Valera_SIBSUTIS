# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    expect(Post.new(title: 'good title')).to be_valid
  end
  it 'is not valid without title' do
    expect(Post.new).to_not be_valid
  end
  it 'is not valid with short title' do
    expect(Post.new(title: 'bad')).to_not be_valid
  end
end
