class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      redirect_to root_path
    else
      render root_path
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.delete
      redirect_to root_path
    else
      render root_path
    end
  end

  private

  def favorite_params
    params.permit(:service_id).merge(user_id: current_user.id)
  end
end
