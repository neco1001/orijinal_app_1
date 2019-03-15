class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @like = current_user.likes.build(micropost_id: params[:micropost_id])
    if @like.save
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js
      end
    else
      flash[:success] = "失敗です"
      redirect_to root_path
    end
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    Like.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  end
end
