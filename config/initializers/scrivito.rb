
# config/initializers/scrivito.rb
Scrivito.configure do |config|
  # Authentication stuff goes here...
  config.editing_auth do |env| 
    user = env["warden"].user
    if user.present?
      Scrivito::User.system_user
    end
  end
end