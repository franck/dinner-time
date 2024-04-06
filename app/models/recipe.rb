class Recipe < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :ingredients, presence: true
  validates :locale, presence: true
end
