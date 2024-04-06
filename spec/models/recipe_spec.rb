require 'rails_helper'

describe Recipe do

  describe "validations" do
    it "is valid with a name, ingredients and locale" do
      recipe = Recipe.new(valid_params)
      expect(recipe).to be_valid
    end

    it "is invalid without a name" do
      recipe = Recipe.new(valid_params.except(:name))
      expect(recipe).to be_invalid
    end

    it 'is invalid if name is not unique' do
      Recipe.create(valid_params)
      recipe = Recipe.new(valid_params)
      expect(recipe).to be_invalid
    end

    it "is invalid without ingredients" do
      recipe = Recipe.new(valid_params.except(:ingredients))
      expect(recipe).to be_invalid
    end

    it "is invalid without a locale" do
      recipe = Recipe.new(valid_params.except(:locale))
      expect(recipe).to be_invalid
    end
  end

  private

    def valid_params
      {
        name: 'Poulet basquaise',
        ingredients: '1 poulet, 2 poivrons, 2 tomates',
        locale: 'fr',
      }
    end

end
