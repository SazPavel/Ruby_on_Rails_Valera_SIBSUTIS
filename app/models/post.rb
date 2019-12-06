# frozen_string_literal: true

# Post model
class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 10 }
end
