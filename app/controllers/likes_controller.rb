class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @like = Like.new(user_id: current_user.id, micropost_id: params[:micropost_id])
    if @like.save
      flash[:success] = "いいね！しました。"
      redirect_to root_path
    else
      flash[:success] = "失敗です"
      redirect_to root_path
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @like.destroy
    flash[:success] = "いいね！を取り消しました。"
    redirect_to root_path
  end
end
