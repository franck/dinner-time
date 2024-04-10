module RecipesHelper
  def remove_ingredient_from_search(current_ingredients, ingredient)
    new_ingredients = current_ingredients.dup
    new_ingredients.delete(ingredient)
    {
      search_form: {
        ingredients: new_ingredients
      }
    }
  end
end
