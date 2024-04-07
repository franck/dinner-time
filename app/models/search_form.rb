class SearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :query, :string
  attribute :locale, :string

  def results
    return Recipe.none if query.blank? || locale.blank?

    Recipe.where(locale:).search_by_ingredients(query)
  end
end
