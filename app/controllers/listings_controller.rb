class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def new
      @listing = Listing.new
      user= User.find(session[:user_id])
      @tools = user.tools
      # byebug

  end

  def create
    @listing = Listing.create(cost: params[:listing][:cost], notes: params[:listing][:notes], name: params[:listing][:name], tool_id: params[:listing][:tool_id])
    @user = User.find(session[:user_id])
    @listing.save
    if @listing.save
      # @user=User.find(@listing.tool.lender_id)
      redirect_to user_path(@user)
      # redirect_to root_path
    else
      render new_listing_path
    end
  end

  def show

  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(cost: params[:listing][:cost], notes: params[:listing][:notes], name: params[:user][:name])
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    listing = Listing.find(params[:id])
    @user = User.find(listing.tool.lender_id)
    listing.delete
    redirect_to user_path(@user)
  end

  private
  def listing_params(*args)
    params.require(:listing).permit(*args)
  end
end
