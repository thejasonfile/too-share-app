class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login, except: [:current_user, :logged_in?]
  helper_method :current_user
  helper_method :cart

  def current_user
    session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def cart
    session[:cart] ||= []#means it is either the cart so far, or empty array
  end

  private

  def require_login
    redirect_to root_path unless current_user
  end

end
