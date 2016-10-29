class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end
  def new
    @review = Review.new
  end
  def create
    #not sure of below, just started!
    review = Review.create(rating: params[:review][:rating], content: params[:review][:content], tool_id: params[:review][:tool_id])

    review.tool_id = tool.id
    review.save
    if review.save
      redirect_to review_path(review)
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
  end
  def destroy
  end
end
