require 'rails_helper'

describe 'Search recipes' do
  before do
    Recipe.create!(name: 'Salade de tomates', ingredients: '2 tomates', locale: 'fr')
    Recipe.create!(name: 'Salade de carottes au fenouil', ingredients: '2 carottes, 1 fenouil', locale: 'fr')
    Recipe.create!(name: 'Salade de carottes aux épices', ingredients: '2 carottes, quelques épices', locale: 'fr')
    Recipe.create!(name: 'Carots salad', ingredients: '2 carots', locale: 'en')
  end

  describe 'when I submit the search form without any query' do
    it 'does not show any recipe' do
      visit '/'
      expect(page).to have_no_css('#recipes')
    end
  end

  describe 'when I submit the search form with the name of an ingredient' do
    before do
      visit '/'
      fill_in :search_form_query, with: 'carot'
      click_on 'Ajouter cet ingrédient'
    end

    it 'shows recipes containing this ingredient' do
      expect(page).to have_content('Salade de carottes au fenouil')
      expect(page).to have_content('Salade de carottes aux épices')
      expect(page).to have_no_content('Salade de tomates')
      expect(page).to have_no_content('Carots salad')
    end

    it 'shows the ingredient in ingredients list' do
      within('#ingredients') do
        expect(page).to have_content('carot')
      end
    end

    it 'clears the search form' do
      query_field = find_field(:search_form_query)
      expect(query_field.value).to be_empty
    end

    describe 'when I submit the search form with the name of another ingredient' do
      before do
        fill_in :search_form_query, with: 'épices'
        click_on 'Ajouter cet ingrédient'
      end

      it 'shows all ingredients in list' do
        within('#ingredients') do
          expect(page).to have_content('carot')
          expect(page).to have_content('épices')
        end
      end

      it 'shows recipes containing both ingredients' do
        expect(page).to have_no_content('Salade de carottes au fenouil')
        expect(page).to have_content('Salade de carottes aux épices')
        expect(page).to have_no_content('Salade de tomates')
      end

      describe 'when I remove the ingredient from the search' do
        before do
          within('#ingredients') do
            find('div', text: 'épices').find('a').click
          end
        end

        it 'remove the ingredient from the ingredients list' do
          within('#ingredients') do
            expect(page).to have_content('carot')
            expect(page).to have_no_content('épices')
          end
        end

        it 'shows recipes containing only remaining ingredients' do
          expect(page).to have_content('Salade de carottes au fenouil')
          expect(page).to have_content('Salade de carottes aux épices')
          expect(page).to have_no_content('Salade de tomates')
        end
      end
    end
  end
end
