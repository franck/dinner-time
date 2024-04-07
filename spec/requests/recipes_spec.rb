require 'rails_helper'

describe 'Recipes', type: :request do
  before do
    Recipe.create!(name: 'Salade de tomates', ingredients: '2 tomates', locale: 'fr')
    Recipe.create!(name: 'Salade de carottes', ingredients: '2 carottes', locale: 'fr')
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
        json = JSON.parse(response.body)

        expect(json.size).to eq(1)
        expect(json[0]['name']).to eq('Salade de carottes')
      end
    end
  end
end
