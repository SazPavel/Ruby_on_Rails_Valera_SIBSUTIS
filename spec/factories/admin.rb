# frozen_string_literal: true

FactoryBot.define do
  factory :admin, class: User do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    admin { true }
  end
end
