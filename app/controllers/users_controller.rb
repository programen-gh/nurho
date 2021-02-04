class UsersController < ApplicationController
  # def show
  #   user = User.find(params[:id])
  #   @services = user.services
  # end

  def index
    user = User.find(current_user.id)
    @services = user.services
  end
end
