class SearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :query, :string
  attribute :locale, :string

  def results
    return Recipe.none if query.blank? or locale.blank?

    Recipe.where(locale: locale).where('ingredients ILIKE ?', "%#{query}%")
  end

end
