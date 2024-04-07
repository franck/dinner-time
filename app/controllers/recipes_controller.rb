class RecipesController < ApplicationController

  def index
    @search = SearchForm.new(search_params)
    @recipes = @search.results.page(params[:page])
  end

  private

    def search_params
      params.fetch(:search_form, {}).permit(:query).merge(locale: I18n.locale)
    end

end
