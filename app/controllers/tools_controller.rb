class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def create

    tool = Tool.create(name: params[:tool][:name], safety_level: params[:tool][:safety_level], portability: params[:tool][:portability], condition: params[:tool][:condition], availability_start: params[:tool][:availability_start], availability_end: params[:tool][:availability_end])
    if tool.save
      redirect_to tool_path(tool)
    else
      render :new
    end
  end

  def show
    @tool = Tool.find(params[:id])
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

  def tool_available?

  end
end
