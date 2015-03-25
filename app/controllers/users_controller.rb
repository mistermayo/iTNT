class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

private
  def users_params
    params.require(:user).permit(:name, :email, :encrypted_password)
  end
end