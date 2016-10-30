class ListingsController < ApplicationController

  def index
    if params[:search]
      @listings = Listing.search(params[:search])
    else
      @listings = Listing.all
    end
  end

  def new
      @listing = Listing.new
      user= User.find(session[:user_id])
      @tools = user.tools
  end

  def create
    @listing = Listing.new(cost: params[:listing][:cost], notes: params[:listing][:notes], name: params[:listing][:name], tool_id: params[:listing][:tool_id])
    @user = User.find(session[:user_id])
    if @listing.save
      redirect_to user_path(@user)
    else
      render new_listing_path
    end
  end

  def show

    @listing = Listing.find(params[:id])
    @tool = Tool.find(@listing.tool_id)
    @user = User.find(@tool.lender_id)
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @listing = Listing.find(params[:id])
    @listing.update(cost: params[:listing][:cost], notes: params[:listing][:notes], name: params[:listing][:name])
    if @listing.valid?
      @listing.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    listing = Listing.find(params[:id])
    @user = User.find(session[:user_id])
    listing.delete
    redirect_to user_path(@user)
  end

  private
  def listing_params(*args)
    params.require(:listing).permit(*args)
  end
end
