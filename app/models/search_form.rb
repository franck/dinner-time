class SearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :locale, :string

  attr_accessor :query, :ingredients

  def initialize(attributes = {})
    super
    self.ingredients = attributes.fetch(:ingredients, [])
    self.query = attributes.fetch(:query, '')

    return if query.blank?

    ingredients.push(query.dup)

    query.clear
  end

  def results
    return Recipe.none if full_query.blank? || locale.blank?

    Recipe.where(locale:).search_by_ingredients(full_query)
  end

  def full_query
    ingredients.join(' ')
  end
end
