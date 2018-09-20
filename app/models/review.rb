# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  self.per_page = 10
end
