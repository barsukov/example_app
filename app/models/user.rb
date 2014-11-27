class User

  
  #This methods is needed only when you PORO and do not use database orm adapters and default devise database_authentication
  include ActiveModel::Validations #required because some before_validations are defined in devise
  include ActiveModel::Conversion
  extend ActiveModel::Callbacks #required to define callbacks

  extend Devise::Models

  attr_accessor :login
  
  def initialize(options={})
    
  end
 
  define_model_callbacks :validation #required by Devise
  devise :custom_authentication_strategy, :authentication_keys => [:login]
end