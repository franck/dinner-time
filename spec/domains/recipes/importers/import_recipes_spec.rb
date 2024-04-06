require 'rails_helper'

describe Recipes::Importers::ImportRecipes do
  it "imports recipes" do
    path = Rails.root.join('spec', 'fixtures', 'recipes-fr.json')
    expect { described_class.new(path: path, locale: 'fr').call }.to change { Recipe.count }.by(10)
  end
end
