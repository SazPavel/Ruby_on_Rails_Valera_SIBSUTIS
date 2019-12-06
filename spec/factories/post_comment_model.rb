# frozen_string_literal: true

FactoryBot.define do
  factory :post_comment_model, class: Post do
    id { 10 }
    title { 'test_test_test' }
    text { 'test_test_test' }
  end
end
