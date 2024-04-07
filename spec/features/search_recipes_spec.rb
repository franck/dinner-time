require 'rails_helper'

describe 'Search recipes' do
  before do
    Recipe.create!(name: 'Salade de tomates', ingredients: '2 tomates', locale: 'fr')
    Recipe.create!(name: 'Salade de carottes', ingredients: '2 carottes', locale: 'fr')
    Recipe.create!(name: 'Carots salad', ingredients: '2 carots', locale: 'en')
  end

  describe 'when I submit the search form without any query' do
    it 'does not show any recipe' do
      visit '/'

      expect(page).to have_no_content('Salade de tomates')
      expect(page).to have_no_content('Salade de carottes')
      expect(page).to have_no_content('Carots salad')
    end
  end

  describe 'when I submit the search form with the name of an ingredient' do
    it 'shows recipes containing this ingredient' do
      visit '/'
      fill_in :search_form_query, with: 'carot'
      click_button 'Rechercher'

      expect(page).to have_content('Salade de carottes')
      expect(page).to have_no_content('Salade de tomates')
      expect(page).to have_no_content('Carots salad')
    end
  end
end
