class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(name: params[:user][:name], email: params[:user][:email], location: params[:user][:location],password: params[:user][:password],password_confirmation: params[:user][:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(name: params[:user][:name], email: params[:user][:email], location: params[:user][:location])
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end 
  end

  def destroy
  end

  private
  def user_params(*args)
    params.require(:user).permit(*args)
  end
end
