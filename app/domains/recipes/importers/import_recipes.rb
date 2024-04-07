module Recipes
  module Importers
    class ImportRecipes
      def initialize(path:, locale:)
        @path_to_json_file = path
        @locale = locale
      end

      def call
        raise ArgumentError, 'File not found' unless File.exist?(path_to_json_file)
        raise ArgumentError, 'Invalid locale' unless valid_locales.include?(locale)

        create_recipes_from_json_file
      end

      private

      attr_reader :path_to_json_file, :locale

      def create_recipes_from_json_file
        recipes_data.each do |recipe_data|
          Recipes::Importers::CreateRecipe.new(recipe_data, locale:).call
        end
      end

      def recipes_data
        JSON.parse(json_file)
      end

      def json_file
        File.read(path_to_json_file)
      end

      def valid_locales
        AppConfig::VALID_LOCALES
      end
    end
  end
end
