# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'

gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # гем позволяет при отправке сообщения на подтверждения почты при регистрации в нашем приложении перехватывать его и не засорять ящик нашей почты. Для этого мы и занесли его в группу развитие.
  gem 'letter_opener' # https://github.com/ryanb/letter_opener
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'rails-i18n'

# мощный гем позволяющий делать аутоинтификацию с огромным функционалом https://github.com/heartcombo/devise
gem 'devise', '~> 4.0' # локализация https://github.com/heartcombo/devise/wiki/I18n

# NETWORKING
gem 'faraday'

# Github client
gem 'octokit'

# Русский перевод для https://github.com/plataformatec/devise/tree/v4.7.1
# https://gist.github.com/k1r8r0wn/2d04e83ec79562d5650e
gem 'devise-i18n', '~> 1.9' # настройки для локализации https://github.com/heartcombo/devise/wiki/I18n

# для использования иконок на github octicons
gem 'octicons_helper', '~> 9.3'

# для работы с переменными окружения, создав в коре приложения .env (внести его в гит игнор файл)
# удобнее чем использовать переменную окружения из операционки
gem 'dotenv-rails'
