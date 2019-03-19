class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
     @micropost = current_user.microposts.build
     @feed_items = current_user.feed.paginate(page: params[:page])
     @comment = current_user.comments.build
   end
  end

  def about
  end
end
