class PhotosController < ApplicationController

  def new
    @spot = Spot.find(params[:spot_id])
    @photo = Photo.new
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @photo = @spot.photos.new(photo_params)
    if @photo.save
      redirect_to spots_path(@spot), :notice => "Print added!"
    else
      render :new, :notice => "Try again!"
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:photo)
    end
end
