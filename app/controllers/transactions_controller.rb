class TransactionsController < ApplicationController
  #will we need an add to cart thing? Like adding to a list of stuff you want?
  #will there be a session[:cart]
  #do we need to instantiate an empty cart for new login/new session?

  #@cart = []

  def index
    @cart = cart
  end

  def add
    cart << params[:product]
    render :index
  end

  def edit
    #(options for deleting from cart?)
    #button for deleting from cart? How does that work?
  end

  # def new
  # end
  #
  # def create
  # end

  # def show
  # end


  # def update
  # end


  # def destroy
    #do we need to destroy cart upon logout or does it happen when you delete session?
  # end
end
