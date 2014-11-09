class HomeController < ApplicationController
  def index
    redirect_to controller: :feelings, action: :index if user_signed_in?
  end
end
