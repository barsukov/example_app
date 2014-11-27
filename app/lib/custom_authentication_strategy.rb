module CustomAuthenticationStrategy

  extend ActiveSupport::Concern

  #
  module ClassMethods

    def serialize_from_session(key="", salt=nil)
      resource = self.new(login: key)
      resource
    end

    def serialize_into_session(record)
      [record.login]
    end

  end

  class CustomAuthentication < Devise::Strategies::Authenticatable
    
    # This check is run before +authenticate!+ is called to determine if this
    # authentication strategy is applicable. In this case we only try to authenticate
    # if the login and password are present
    def valid?
      login && password
    end
 
    def authenticate!    
      # Perform your custom authorization check here
      #
      if login == Settings.credentials.user_name && password == Settings.credentials.password
        user = User.new(login: login)
        success! user # Tell devise we have a winner, and give it a User
      else
        fail! "Sorry, your username or password is incorrect"
      end
    end
 
    private
 
    def login
      (params[:user] || {})[:login]
    end
 
    def password
      (params[:user] || {})[:password]
    end
  end

end

Warden::Strategies.add :custom_authentication_strategy, CustomAuthenticationStrategy::CustomAuthentication
# We need to add the module to devise below. The magic juice to get
# routes and sessions working also happens in this line with the 
# :controller and :route keys. 
Devise.add_module :custom_authentication_strategy, :strategy => true, :controller => :sessions,
  :route => :session