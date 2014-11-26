# config/initializers/scrivito.rb
Scrivito.configure do |config|
  # Authentication stuff goes here...
  config.editing_auth { |env| Scrivito::User.system_user }
end