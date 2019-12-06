# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'is valid with valid attributes' do
    expect(Article.new(title: 'good title')).to be_valid
  end
  it 'is not valid without title' do
    expect(Article.new).to_not be_valid
  end
  it 'is not valid with short title' do
    expect(Article.new(title: 'bad')).to_not be_valid
  end
end
