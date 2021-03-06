class FavoritesController < ApplicationController
  def create
    @service = Service.find(params[:service_id])
    @service.favorites.each do |favorite|
      if favorite.user_id == current_user.id
        flash[:danger] = "マイページに追加済みです"
        redirect_to service_path(@service.id) and return
      end
    end
    @favorite = Favorite.new(favorite_params)
    @favorite.save
    flash[:success] = "マイページに追加しました"
    redirect_to service_path(@service.id) and return
  end

  def destroy
    @service = Service.find(params[:service_id])
    @user =  User.find(params[:id])
    @user.favorites.each do |favorite|
      if favorite.service_id == @service.id
        if favorite.delete
          flash[:success] = "マイページから削除されました"
          redirect_to controller: :users, action: :show and return
        else
          flash.now[:danger] = "失敗しました"
          render controller: :users, action: :show
        end
      end
    end
  end

  private

  def favorite_params
    params.permit(:service_id).merge(user_id: current_user.id)
  end
end
