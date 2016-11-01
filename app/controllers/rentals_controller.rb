class RentalsController < ApplicationController
  # def index
  # end
  def create
    byebug
    # Rental.new(borrower_id: session[:user_id], lender_id:)
  end

  def destroy

  end

  private
  def listing_params(*args)
    params.require(:rental).permit(*args)
  end

end
