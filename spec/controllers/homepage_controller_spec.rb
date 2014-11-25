require 'spec_helper'
require 'rails_helper'

describe HomepageController do 

 describe "GET index" do
 	context "succesful authenticate" do 
 	  it 'responds with 200'do 
 	  	get :index
 	  	expect(response).to have_http_status(:ok)  
 	  end
 	end

 	context "failed authenticate without credentials" do 
	  it 'responds with 401' do  
 	  	controller.request.env['HTTP_AUTHORIZATION'] = nil
	  	get :index
	  	expect(response).to have_http_status(:unauthorized)  
	  end
 	end
  end
end