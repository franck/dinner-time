AppConfig::VALID_LOCALES.each do |locale|
  path = Rails.root.join('data', "recipes-#{locale}.json")
  Recipes::Importers::ImportRecipes.new(path, locale:).call
end
