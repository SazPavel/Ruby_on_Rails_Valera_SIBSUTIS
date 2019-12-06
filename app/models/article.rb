# frozen_string_literal: true

# Article model
class Article < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 4 }
end
