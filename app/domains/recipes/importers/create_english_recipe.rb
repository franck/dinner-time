module Recipes
  module Importers
    class CreateEnglishRecipe
      def initialize(recipe_data)
        @recipe_data = recipe_data.with_indifferent_access
      end

      def self.call(recipe_data)
        new(recipe_data).call
      end

      def call
        Recipe.create(recipe_params)
      end

      private

      attr_reader :recipe_data

      def recipe_params
        {
          name: recipe_data['title'],
          ingredients: recipe_data['ingredients'].join("\n"),
          locale: 'en'
        }
      end
    end
  end
end
