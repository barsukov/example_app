module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.new(login: Settings.credentials.user_name)
      sign_in user
    end
  end
end
