require 'rails_helper'

describe 'Recipes' do
  before do
    Recipe.create!(name: 'Salade de tomates', ingredients: '2 tomates', locale: 'fr')
    Recipe.create!(name: 'Salade de carottes', ingredients: '2 carottes', locale: 'fr')
    Recipe.create!(name: 'Salade de carottes aux épices', ingredients: '2 carottes, des épices', locale: 'fr')
  end

  context 'when json requests' do
    describe 'GET / with a query' do
      before do
        get '/fr', headers: { 'ACCEPT' => 'application/json' }, params: { search_form: { query: 'carot' } }
      end

      it 'responds with a 200 status' do
        expect(response).to be_successful
      end

      it 'is a json response' do
        expect(response.content_type).to include('application/json')
      end

      it 'displays recipes' do
        recipes = response.parsed_body

        expect(recipes.size).to eq(2)

        recipe_names = recipes.pluck('name')
        expect(recipe_names).to include('Salade de carottes')
        expect(recipe_names).to include('Salade de carottes aux épices')
      end
    end

    describe 'GET / with ingredients' do
      before do
        get '/fr', headers: { 'ACCEPT' => 'application/json' },
                   params: { search_form: { ingredients: %w[carot epice] } }
      end

      it 'responds with a 200 status' do
        expect(response).to be_successful
      end

      it 'is a json response' do
        expect(response.content_type).to include('application/json')
      end

      it 'displays recipes' do
        recipes = response.parsed_body
        expect(recipes.size).to eq(1)

        recipe_names = recipes.pluck('name')
        expect(recipe_names).not_to include('Salade de carottes')
        expect(recipe_names).to include('Salade de carottes aux épices')
      end
    end
  end
end
