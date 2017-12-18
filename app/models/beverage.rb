# frozen_string_literal: true

class Beverage < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 60 }
  validates :description, presence: true, length: { maximum: 150 }
  validates :recipe, presence: true, length: { maximum: 600 }
  validates :occasion, presence: true
  validates :rating, presence: true, :numericality => { :only_integer => true }
end
