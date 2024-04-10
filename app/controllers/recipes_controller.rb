class RecipesController < ApplicationController
  def index
    @search = SearchForm.new(search_params)
    @recipes = @search.results.page(params[:page])

    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def search_params
    params.fetch(:search_form, {}).permit(:query, ingredients: []).merge(locale: I18n.locale)
  end
end
