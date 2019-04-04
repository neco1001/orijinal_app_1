class MicropostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)

    ### フロント側で設定するようにしたため、一旦コメントアウト ###

    # require 'exifr/jpeg'
    # exif = EXIFR::JPEG::new(@micropost.picture.file.file)
    # # Exifから位置情報(◯◯県◯◯市)を設定
    # if !exif.gps.nil?
    #   @micropost.latitude = exif.gps.latitude
    #   @micropost.longitude = exif.gps.longitude
    #   results = Geocoder.search([@micropost.latitude, @micropost.longitude]).first
    #   @micropost.address = "#{results.state} #{results.city}"
    # end

    if @micropost.save
      flash[:success] = "投稿しました。"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました。"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture, :address, :filter)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
