class FeelingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @feelings = Feeling.where(user: current_user)
  end

  def new
    @feeling = Feeling.new
  end

  def create
    @feeling = Feeling.new(feeling_params)
    @feeling.user = current_user
    @feeling.save
    redirect_to feelings_url
  end

  private
    def feeling_params
      params.require(:feeling).permit(Feeling.attribute_names)
    end
end
