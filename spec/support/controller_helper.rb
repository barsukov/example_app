module ControllerHelper
  def get_basic_auth
    user = 'username'
    pw = 'changeme'
 	ActionController::HttpAuthentication::Basic.encode_credentials user, pw
  end

  def initialize_scrivito_http_header
    controller.request.for_scrivito_obj
 	controller.request.env['HTTP_AUTHORIZATION'] = get_basic_auth
  end
end