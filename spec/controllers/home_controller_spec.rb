require 'rails_helper'

describe HomeController do
  describe 'when I visit the home page' do
    it 'redirects to the default localized root' do
      get :index
      expect(response).to redirect_to('/fr')
    end
  end

  context 'when visitor browser language is english' do
    before do
      request.env['HTTP_ACCEPT_LANGUAGE'] = 'en'
    end

    describe 'when I visit the home page' do
      it 'redirects to the english localized root' do
        get :index
        expect(response).to redirect_to('/en')
      end
    end
  end

  context 'when visitor browser language is spanish' do
    before do
      request.env['HTTP_ACCEPT_LANGUAGE'] = 'es'
    end

    describe 'when I visit the home page' do
      it 'redirects to the default localized root' do
        get :index
        expect(response).to redirect_to('/fr')
      end
    end
  end
end
