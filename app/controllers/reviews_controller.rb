class ReviewsController < ApplicationController
  def index

  end

  def new
    @review = Review.new
    @user= User.find(session[:user_id])
    @tools = @user.tools
  end

  def create
    @review = Review.new(rating: params[:review][:rating], content: params[:review][:content], tool_id: params[:review][:tool_id])
  @tool = Tool.find(@review.tool_id)
    if @review.save

      redirect_to tool_path(@tool)
    else
      render new_review_path
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @tool = Tool.find(@review.tool_id)
    @review.update(rating: params[:review][:rating], content: params[:review][:content])
    if @review.valid?
      @review.save
      redirect_to tool_path(@tool)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @tool = Tool.find(@review.tool_id)
    @review.delete
    redirect_to tool_path(@tool)
  end

  private
  def review_params(*args)
    params.require(:review).permit(*args)
  end
end
