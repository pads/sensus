class FeelingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @feelings = Feeling.where(user: current_user)
  end

  def new
    @feeling = Feeling.new
  end

  def show
    @feeling = Feeling.where(id: params[:id], user: current_user).first
    render file: 'public/404.html', status: 404, layout: false if @feeling.nil?
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
