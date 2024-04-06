require 'rails_helper'

describe "Home" do

  describe "when I visit the home page" do
    it "I see the app title" do
      visit '/'
      expect(page).to have_content("C'est l'heure du repas")
    end
  end

end
