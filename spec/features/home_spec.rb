require 'rails_helper'

describe 'Home' do
  describe 'when I visit the home page' do
    it 'I see the app title' do
      visit '/'
      expect(page).to have_content("C'est l'heure du repas")
      expect(page).to have_current_path('/fr', ignore_query: true)
    end
  end

  describe 'when I visit the EN home page' do
    it 'I see the app title' do
      visit '/en'
      expect(page).to have_content('Dinner Time!')
      expect(page).to have_current_path('/en', ignore_query: true)
    end
  end
end
