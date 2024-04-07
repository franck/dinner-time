require 'rails_helper'

describe Recipes::Importers::ImportRecipes do
  it 'imports recipes' do
    path = Rails.root.join('spec/fixtures/recipes-fr.json')
    expect { described_class.new(path:, locale: 'fr').call }.to change(Recipe, :count).by(10)
  end

  it 'raise an error if file is missing' do
    expect do
      described_class.new(path: 'missing.json', locale: 'fr').call
    end.to raise_error(ArgumentError, 'File not found')
  end

  it 'raise an error if locale is invalid' do
    path = Rails.root.join('spec/fixtures/recipes-fr.json')
    expect { described_class.new(path:, locale: 'es').call }.to raise_error(ArgumentError, 'Invalid locale')
  end
end
