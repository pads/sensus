require 'rails_helper'

RSpec.describe FeelingsController, :type => :controller do
  it 'redirects to the sign in page given an unauthenticated request' do
    get :index
    response.should redirect_to '/users/sign_in'
  end
end
