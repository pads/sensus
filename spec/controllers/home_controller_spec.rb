require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
  it 'redirects to the feelings index controller when signed in' do
    user = User.create!(email: 'foo@bar.com', password: 'test1234')
    sign_in user

    get :index
    response.should redirect_to '/feelings'
  end

  it 'does not redirect when not signed in' do
    get :index
    expect(response.status).to eq 200
  end
end
