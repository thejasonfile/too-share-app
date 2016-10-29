class CheckoutsController < ApplicationController
  def index
    @cart = cart
  end

  # def add(item)
  #   # byebug
  #   #add from the list of search results?
  #   #should tool have price?
  #   @cart = cart
  #   @cart << item
  #
  #   # render :index
  # end

  def show

  end

  def edit
    #(options for deleting from cart?)
    #button for deleting from cart? How does that work?
    #search through cart array for that item, remove from cart
  end

  def update
  end

  # def new
  # end
  #
  def create
    #to create transaction
  end

  # def destroy
    #do we need to destroy cart upon logout or does it happen when you delete session?
  # end
  private
  def checkout_params(*args)
    params.require(:checkout).permit(*args)
  end
end
