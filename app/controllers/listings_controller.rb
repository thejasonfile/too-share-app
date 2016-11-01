class ListingsController < ApplicationController

  def index
    if params[:search]
      @listings = APIMaps.search(params[:search]).select {|listing| listing.tool.available? }
    else
      @listings = Listing.all.select {|listing| listing.tool.available? }
    end
  end

    # if params[:zip_code]
    #   @zip_code_search = Listing.by_zip_code(params[:zip_code])
    # end



  def new
      @listing = Listing.new
      @user= User.find(session[:user_id])
      @tools = @user.tools
      @tools_without_listings = @user.your_tools_without_listings
  end

  def create
    @listing = Listing.new(notes: params[:listing][:notes], name: params[:listing][:name], tool_id: params[:listing][:tool_id])
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
    @owner = User.find(@tool.lender_id)
    @user = User.find(session[:user_id])


  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @listing = Listing.find(params[:id])
    @listing.update(notes: params[:listing][:notes], name: params[:listing][:name])
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
