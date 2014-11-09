require 'rails_helper'

RSpec.describe FeelingsController, :type => :controller do
  describe 'index' do
    it 'redirects to the sign in page given an unauthenticated request' do
      get :index
      response.should redirect_to '/users/sign_in'
    end
  end

  describe 'new' do
    it 'assigns a feelings object belonging to the current user' do
      user = User.create!(email: 'foo@bar.com', password: 'test1234')
      sign_in user

      get :new

      feeling = assigns(:feeling)
      expect(feeling.user).to eq user
    end
  end
end
