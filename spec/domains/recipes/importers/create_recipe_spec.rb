require 'rails_helper'

describe Recipes::Importers::CreateRecipe do
  context 'when locale is FR' do
    context "when json_recipe is valid" do
      it "creates a recipe" do
        recipe_data = {
          name: 'Poulet basquaise',
          ingredients: ['1 poulet', '2 poivrons', '2 tomates'],
        }

        recipe = described_class.new(recipe_data, locale: 'fr').call

        expect(recipe.name).to eq('Poulet basquaise')
        expect(recipe.ingredients).to eq("1 poulet\n2 poivrons\n2 tomates")
        expect(recipe.locale).to eq('fr')
      end
    end

    context "when something is missing" do
      let(:invalid_data) { { ingredients: ['1 poulet', '2 poivrons', '2 tomates'] } }
      it 'returns invalid recipe' do
        recipe = described_class.new(invalid_data, locale: 'fr').call

        expect(recipe).to be_invalid
      end
      it 'does not create a recipe' do
        expect{ described_class.new(invalid_data, locale: 'fr').call }.not_to change { Recipe.count }
      end
    end
    end

  context 'when locale is EN' do
    context "when data is valid" do
      it "creates a recipe" do
        recipe_data = {
          title: 'Buffalo Chicken',
          ingredients: ['1 pound thin-sliced bacon', '3 pounds of Chicken breast'],
        }

        recipe = described_class.new(recipe_data, locale: 'en').call

        expect(recipe.name).to eq('Buffalo Chicken')
        expect(recipe.ingredients).to eq("1 pound thin-sliced bacon\n3 pounds of Chicken breast")
        expect(recipe.locale).to eq('en')
      end
    end
    end

  end
