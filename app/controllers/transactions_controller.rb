class TransactionsController < ApplicationController

  def index
    @cart = cart
  end

  def add
    #add from the list of search results?
    #should tool have price?
    @cart << params[:tool]
    render :index
  end

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
end
