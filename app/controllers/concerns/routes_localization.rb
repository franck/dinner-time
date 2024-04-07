module RoutesLocalization
  extend ActiveSupport::Concern

  included do
    before_action :set_locale
  end

  def set_locale
    I18n.locale = find_locale
  end

  def current_locale
    I18n.locale
  end

  def find_locale
    if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
      params[:locale]
    else
      http_accept_language.compatible_language_from(AppConfig::VALID_LOCALES) || I18n.default_locale
    end
  end
end
