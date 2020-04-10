# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.time_zone = 'Moscow'

    config.i18n.default_locale = :ru

    # autoload_paths массив содержащий в себе все пути которые учитывает Rails при автоматическом
    # поиске и загрузке констант
    # config.autoload_paths << "#{Rails.root}/lib/clients"
  end
end
