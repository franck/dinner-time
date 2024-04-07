module Recipes
  module Importers
    class EnglishRecipesImporter
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
        recipes_data.each do |recipe_data|
          Recipes::Importers::CreateEnglishRecipe.call(recipe_data)
        end
      end

      def recipes_data
        JSON.parse(json_file)
      end

      def json_file
        File.read(path_to_json_file)
      end
    end
  end
end
