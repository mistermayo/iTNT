class SpotsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @spots = Spot.all
   end

  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def create
    @spot = Spot.new(spots_params)
    if @spot.save
      redirect_to spots_path, notice: "Spot has been successfully listed!"
    else
      render :new
    end
  end

  def destroy

    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to spots_path
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spots_params)
      redirect_to spots_path(@spot)
    else
      render :edit
    end
  end

  private
  def spots_params
    params.require(:spot).permit(:location, :header, :description, :price, :details, :images, :availability, :user_id)
  end
end
