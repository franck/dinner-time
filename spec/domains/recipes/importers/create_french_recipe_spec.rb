require 'rails_helper'

describe Recipes::Importers::CreateFrenchRecipe do

  context "when json_recipe is valid" do
    it "creates a recipe" do
      recipe_data = {
        name: 'Poulet basquaise',
        ingredients: ['1 poulet', '2 poivrons', '2 tomates'],
      }

      recipe = described_class.call(recipe_data)

      expect(recipe.name).to eq('Poulet basquaise')
      expect(recipe.ingredients).to eq("1 poulet\n2 poivrons\n2 tomates")
      expect(recipe.locale).to eq('fr')
    end
  end

  context "when something is missing" do
    let(:invalid_data) { { ingredients: ['1 poulet', '2 poivrons', '2 tomates'], locale: 'fr', } }
    it 'returns invalid recipe' do
      recipe = described_class.call(invalid_data)

      expect(recipe).to be_invalid
    end
    it 'does not create a recipe' do
      expect{ described_class.call(invalid_data) }.not_to change { Recipe.count }
    end
  end

end
