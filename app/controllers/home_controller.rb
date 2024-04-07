class HomeController < ApplicationController
  def index
    redirect_to localized_root_path(locale: current_locale), status: :moved_permanently
  end
end
