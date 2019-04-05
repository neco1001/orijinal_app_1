class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :following, :followers]

  def index
    @users = User.search(params[:key]).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def following
     @title = "フォロー"
     @user  = User.find(params[:id])
     @users = @user.following.paginate(page: params[:page])
     render 'show_follow'
   end

   def followers
     @title = "フォロワー"
     @user  = User.find(params[:id])
     @users = @user.followers.paginate(page: params[:page])
     render 'show_follow'
   end
end
