# frozen_string_literal: true

class Beverage < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 60 }
  validates :description, presence: true, length: { maximum: 150 }
  validates :recipe, presence: true, length: { maximum: 300 }
  validates :instructions, presence: true, length: { maximum: 400 }
  validates :occasion, presence: true
  validates :rating, presence: true
end
