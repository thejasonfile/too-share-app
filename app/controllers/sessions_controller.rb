class SessionsController < ApplicationController

  # def new
  # end

  def create
    user = User.find_by(email: params[:user][:email])
    if user == nil
      redirect_to new_user_path
    elsif user.authenticate(params[:user][:password])
      #return head(:forbidden) unless user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      #@user = user
      redirect_to user_path(user)
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root
  end

end
