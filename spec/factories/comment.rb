FactoryBot.define do
  factory :comment do
    id { 28 }
    commenter { "name" }
    body { "test_test_test"}
    post_id { 11 }
  end
end
