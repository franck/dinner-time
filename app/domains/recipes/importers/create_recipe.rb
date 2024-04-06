module Recipes
  module Importers
    class CreateRecipe
      def initialize(recipe_data, locale:)
        @recipe_data = recipe_data.with_indifferent_access
        @locale = locale
      end

      def call
        Recipe.create(recipe_params)
      end

      private

        attr_reader :recipe_data, :locale

        def recipe_params
          {
            name: recipe_data[name_key],
            ingredients: recipe_data['ingredients'].join("\n"),
            locale: locale,
          }
        end

        def name_key
          locale == 'en' ? 'title' : 'name'
        end
    end
  end
end
