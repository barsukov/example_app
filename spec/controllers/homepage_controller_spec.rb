require 'rails_helper'

describe HomepageController do
  login_user

  context 'when logged in' do

    it { subject.current_user.should_not be_nil }
   
    it "responds with 200" do
      request.for_scrivito_obj
      get 'index'
      response.should be_success
    end
  end
end