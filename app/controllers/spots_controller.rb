class SpotsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def show
    @user = User.find(params[:user_id])
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @spot = Spot.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @spot = User.spots.new(:spots_params)
    if @spot.save
      redirect_to @spot, notice: "Spot has been successfully listed!"
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
    @user = User.find(params[:user_id])
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      redirect_to spots_path
    else
      render :edit
    end
  end

  private
  def spots_params
    params.require(:spot).permit(:location, :heading, :description, :price, :details, :images, :availability, :user_id)
  end
end
