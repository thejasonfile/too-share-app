class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    user= User.find(session[:user_id])
    @tools = user.tools
  end

  def create
    @review = Review.create!(rating: params[:review][:rating], content: params[:review][:content], tool_id: params[:review][:tool_id])
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
  end
  def update
  end
  def destroy
  end

  private
  def review_params(*args)
    params.require(:review).permit(*args)
  end
end
