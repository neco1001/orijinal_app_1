class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = current_user.comments.build(comment_params)
    @comment.micropost_id = params[:micropost_id]
    if @comment.save
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
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
