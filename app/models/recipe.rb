class Recipe < ApplicationRecord
  include PgSearch::Model

  validates :name, presence: true, uniqueness: true
  validates :ingredients, presence: true
  validates :locale, presence: true

  pg_search_scope :search_by_ingredients,
    against: :ingredients,
    ignoring: :accents,
    using: { tsearch: { dictionary: 'simple', prefix: true } }

end
