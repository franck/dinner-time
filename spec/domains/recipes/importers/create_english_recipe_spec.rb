require 'rails_helper'

describe Recipes::Importers::CreateEnglishRecipe do

  context "when json_recipe is valid" do
    it "creates a recipe" do
      recipe_data = {
        title: 'Buffalo Chicken',
        ingredients: ['1 pound thin-sliced bacon', '3 pounds of Chicken breast'],
      }

      recipe = described_class.call(recipe_data)

      expect(recipe.name).to eq('Buffalo Chicken')
      expect(recipe.ingredients).to eq("1 pound thin-sliced bacon\n3 pounds of Chicken breast")
      expect(recipe.locale).to eq('en')
    end
  end

  context "when something is missing" do
    let(:invalid_data) { { ingredients: ['1 pound thin-sliced bacon', '3 pounds of Chicken breast'], } }
    it 'returns invalid recipe' do
      recipe = described_class.call(invalid_data)

      expect(recipe).to be_invalid
    end
    it 'does not create a recipe' do
      expect{ described_class.call(invalid_data) }.not_to change { Recipe.count }
    end
  end

end
