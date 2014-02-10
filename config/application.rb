require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Refinerysk
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.active_record.default_timezone = :local

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    require 'rack/rewrite'

    config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do

      rewrite '/system/images/W1siZiIsIjIwMTMvMDkvMTQvMTZfMzZfNDhfMTUzXzE3XzM0XzAyXzQ2NV9TY3JlZW5zaG90X2Zyb21fMjAxMl8xMF8wMV8xN18zMF81Ni5wbmciXSxbInAiLCJ0aHVtYiIsIjQ1MHg0NTBcdTAwM0UiXSxbInAiLCJzdHJpcCJdXQ/17_34_02_465_Screenshot_from_2012_10_01_17_30_56.png', '/system/images/W1siZiIsIjIwMTQvMDIvMTAvM2ZwbHBmZGhhXzE3XzM0XzAyXzQ2NV9TY3JlZW5zaG90X2Zyb21fMjAxMl8xMF8wMV8xN18zMF81Ni5wbmciXV0/17_34_02_465_Screenshot_from_2012_10_01_17_30_56.png?sha=80842569'
      rewrite '/system/images/W1siZiIsIjIwMTMvMDkvMTQvMTZfMzZfNDdfOTY3XzE3XzM0XzE0XzEyMl9TY3JlZW5zaG90X2Zyb21fMjAxMl8xMF8wMV8xN18zMl8wMC5wbmciXSxbInAiLCJ0aHVtYiIsIjQ1MHg0NTBcdTAwM0UiXSxbInAiLCJzdHJpcCJdXQ/17_34_14_122_Screenshot_from_2012_10_01_17_32_00.png', '/system/images/W1siZiIsIjIwMTQvMDIvMTAvM2U5b2FncXZoZ18xN18zNF8xNF8xMjJfU2NyZWVuc2hvdF9mcm9tXzIwMTJfMTBfMDFfMTdfMzJfMDAucG5nIl1d/17_34_14_122_Screenshot_from_2012_10_01_17_32_00.png?sha=ab14717a'
      rewrite '/system/images/W1siZiIsIjIwMTMvMDkvMTQvMTdfMTdfMTNfNzMxX291dC5naWYiXV0/out.gif', '/system/images/W1siZiIsIjIwMTQvMDIvMTAvOWxzNzZtNm4wbV9vdXQuZ2lmIl1d/out.gif?sha=b4cb1302'
      rewrite '/system/images/W1siZiIsIjIwMTMvMDkvMTQvMTdfMjFfMDhfOTg0X3VzZXIucG5nIl1d/user.png', '/system/images/W1siZiIsIjIwMTQvMDIvMTAvNWdwa25mdjM5c191c2VyLnBuZyJdXQ/user.png?sha=0fcd213e'
      rewrite '/system/images/W1siZiIsIjIwMTMvMDkvMTQvMTZfMzZfNDhfNjVfMjJfMDVfMTBfODcwX2NsaWVudHNpZGVfc3RhY2sucG5nIl1d/22_05_10_870_clientside_stack.png', '/system/images/W1siZiIsIjIwMTQvMDIvMTAvNjVoNzJsY3k0b18yMl8wNV8xMF84NzBfY2xpZW50c2lkZV9zdGFjay5wbmciXV0/22_05_10_870_clientside_stack.png?sha=20bc5ee9'
      rewrite '/system/images/W1siZiIsIjIwMTMvMDkvMTQvMTZfMzZfNDhfNjVfMjJfMDVfMTBfODcwX2NsaWVudHNpZGVfc3RhY2sucG5nIl0sWyJwIiwidGh1bWIiLCI0NTB4NDUwXHUwMDNFIl0sWyJwIiwic3RyaXAiXV0/22_05_10_870_clientside_stack.png', '/system/images/W1siZiIsIjIwMTQvMDIvMTAvNjVoNzJsY3k0b18yMl8wNV8xMF84NzBfY2xpZW50c2lkZV9zdGFjay5wbmciXV0/22_05_10_870_clientside_stack.png?sha=20bc5ee9'
    end
  end
end
