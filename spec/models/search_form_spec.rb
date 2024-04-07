require 'rails_helper'

describe SearchForm do
  describe '#results' do
    context 'with some recipes' do
      let!(:recipe1) { Recipe.create!(name: 'Salade de tomates', ingredients: '2 tomates', locale: 'fr') }
      let!(:recipe2) { Recipe.create!(name: 'Salade de carottes', ingredients: '2 carottes', locale: 'fr') }

      it 'returns recipes containing the query' do
        search_form = described_class.new(query: 'carot', locale: 'fr')
        results = search_form.results
        expect(results).not_to include(recipe1)
        expect(results).to include(recipe2)
      end

      it 'returns no recipe if the query is blank' do
        search_form = described_class.new(query: '', locale: 'fr')
        results = search_form.results
        expect(results).to be_empty
      end

      it 'returns no recipe if the locale is missing' do
        search_form = described_class.new(query: 'carot', locale: nil)
        results = search_form.results
        expect(results).to be_empty
      end
    end

    context 'with accents' do
      let!(:recipe1) { Recipe.create!(name: 'Salade de tomates', ingredients: '2 tomates, des épices', locale: 'fr') }
      let!(:recipe2) { Recipe.create!(name: 'Salade de carottes', ingredients: '2 carottes, des epices', locale: 'fr') }

      it 'returns recipes ignoring accencts' do
        search_form = described_class.new(query: 'epice', locale: 'fr')
        results = search_form.results
        expect(results).to include(recipe1)
        expect(results).to include(recipe2)
      end
    end

    context 'with recipes in different locales' do
      let!(:recipe1) { Recipe.create!(name: 'Salade de carottes', ingredients: '2 carottes, des epices', locale: 'fr') }
      let!(:recipe2) { Recipe.create!(name: 'Carot salads', ingredients: '2 carots, des epices', locale: 'en') }

      it 'returns recipes in the given locale' do
        search_form = described_class.new(query: 'carot', locale: 'fr')
        results = search_form.results
        expect(results).to include(recipe1)
        expect(results).not_to include(recipe2)
      end
    end
  end
end
