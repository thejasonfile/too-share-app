class RentalsController < ApplicationController
  # def index
  # end
  def create
    @rental = Rental.create(borrower_id: session[:user_id], listing_id: params[:listing_id])
    redirect_to @rental
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def destroy

  end

  private
  def listing_params(*args)
    params.require(:rental).permit(*args)
  end

end
