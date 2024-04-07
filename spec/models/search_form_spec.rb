require 'rails_helper'

describe SearchForm do


  describe '#results' do
    let!(:recipe) { Recipe.create!(name: 'Salade de tomates', ingredients: '2 tomates', locale: 'fr') }
    let!(:recipe2) { Recipe.create!(name: 'Salade de carottes', ingredients: '2 carottes', locale: 'fr') }
    let!(:recipe3) { Recipe.create!(name: 'Carots salad', ingredients: '2 carots', locale: 'en') }

    it 'returns recipes containing the query' do
      search_form = described_class.new(query: 'carot', locale: 'fr')
      results = search_form.results
      expect(results).to include(recipe2)
      expect(results).not_to include(recipe)
      expect(results).not_to include(recipe3)
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
end
