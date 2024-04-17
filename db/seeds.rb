# rubocop:disable Rails/Output
AppConfig::VALID_LOCALES.each do |locale|
  path = Rails.root.join('data', "recipes-#{locale}.json")
  puts "Importing recipes for locale: #{locale}"
  puts "Importing recipes from: #{path}"
  Recipes::Importers::ImportRecipes.new(path:, locale:).call
end
# rubocop:enable Rails/Output
