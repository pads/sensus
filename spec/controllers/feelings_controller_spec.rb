require 'rails_helper'

RSpec.describe FeelingsController, :type => :controller do
  describe 'index' do
    it 'redirects to the sign in page given an unauthenticated request' do
      get :index
      expect(response).to redirect_to '/users/sign_in'
    end

    it 'assigns an array of feelings belonging to the current user' do
      user = User.create!(email: 'foo@bar.com', password: 'test1234')
      sign_in user

      feelings = []
      expect(Feeling).to receive(:where).with(user: user).and_return feelings

      get :index
      expect(assigns(:feelings)).to eq feelings
    end
  end

  describe 'show' do
    #TODO
  end

  describe 'new' do
    it 'assigns a feelings object' do
      user = User.create!(email: 'foo@bar.com', password: 'test1234')
      sign_in user

      get :new

      expect(assigns(:feeling)).not_to be_nil
    end
  end

  describe 'create' do
    it 'returns to the index page after creating a feeling' do
      user = User.create!(email: 'foo@bar.com', password: 'test1234')
      sign_in user

      feelingPayload = {
          mood: 'good',
          description: 'Yay!'
      }
      feeling = Feeling.new(feelingPayload)

      expect(Feeling).to receive(:new).with(feelingPayload).and_return feeling
      expect(feeling).to receive(:save)

      post :create, feeling: feelingPayload

      expect(response).to redirect_to '/feelings'
    end

    it 'creates a valid feelings record associated with the current user' do
      user = User.create!(email: 'foo@bar.com', password: 'test1234')
      sign_in user

      feelingPayload = {
          mood: 'good',
          description: 'Yay!'
      }
      feeling = Feeling.new(feelingPayload)

      expect(Feeling).to receive(:new).with(feelingPayload).and_return feeling
      expect(feeling).to receive(:save)

      post :create, feeling: feelingPayload

      expect(feeling.user).to eq user
    end
  end
end
