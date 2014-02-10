# encoding: utf-8

Refinery::I18n.configure do |config|
  # config.default_locale = :en

  config.default_frontend_locale = :sk

  config.frontend_locales = [:en, :sk]

  config.locales = Refinery::I18n.built_in_locales
end
