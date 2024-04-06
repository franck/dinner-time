require 'rails_helper'

describe Recipes::Importers::FrenchRecipesImporter do
  it "imports recipes" do
    path = Rails.root.join('spec', 'fixtures', 'recipes-fr.json')
    expect { described_class.new(path).call }.to change { Recipe.count }.by(10)
  end
end
