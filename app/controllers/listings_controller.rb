class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end
  def new
  end
  def create
    @listing = Listing.create(params[:listing][:cost], params[:listing][:notes], params[:listing][:lender_id])
  end
  def show
  end
  def edit
  end
  def update
  end
  def destroy
  end
  private
  def listing_params
    params.require(:listing).permit(*args)
  end
end
