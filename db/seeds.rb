Recipes::Importers::EnglishRecipesImporter.new(Rails.root.join('data', 'recipes-en.json')).call
Recipes::Importers::FrenchRecipesImporter.new(Rails.root.join('data', 'recipes-fr.json')).call
