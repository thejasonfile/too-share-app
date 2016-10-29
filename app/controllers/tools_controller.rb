class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def create
    tool = Tool.create(name: params[:tool][:name], safety_level: params[:tool][:safety_level], portability: params[:tool][:portability], condition: params[:tool][:condition])

    tool.lender_id = session[:user_id]
    tool.save
    if tool.save
      redirect_to tool_path(tool)
    else
      render :new
    end
  end

  def show
    @tool = Tool.find(params[:id])
    #@reviews << @tool.review

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def tool_params(*args)
    params.require(:tool).permit(*args)
  end
end
