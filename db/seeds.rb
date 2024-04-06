LOCALES = %w[en fr]

LOCALES.each do |locale|
  path = Rails.root.join('data', "recipes-#{locale}.json")
  Recipes::Importers::ImportRecipes.new(path, locale: locale).call
end
