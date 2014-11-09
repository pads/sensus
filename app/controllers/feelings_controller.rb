class FeelingsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @feeling = Feeling.new(user: current_user)
  end

  def create

  end
end
