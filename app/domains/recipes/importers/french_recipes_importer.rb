module Recipes
  module Importers
    class FrenchRecipesImporter

      def initialize(path_to_json_file)
        @path_to_json_file = path_to_json_file
      end

      def call
        raise ArgumentError, 'path_to_json_file is required' if path_to_json_file.blank?

        create_recipes_from_json_file
      end

      private

        attr_reader :path_to_json_file

        def create_recipes_from_json_file
          json_recipes.each do |json_recipe|
            create_recipe(json_recipe)
          end
        end

        def create_recipe(json_recipe)
          Recipe.create!(recipe_params(json_recipe))
        end

        def recipe_params(json_recipe)
          {
            name: json_recipe['name'],
            ingredients: json_recipe['ingredients'].join("\n"),
            locale: 'fr',
          }
        end

        def json_recipes
          JSON.parse(json_file)
        end

        def json_file
          File.read(path_to_json_file)
        end

    end
  end
end
