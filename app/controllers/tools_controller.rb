class ToolsController < ApplicationController

    def index
    sql = <<-SQL
      select tools.lender_id, count(*) as count
      from tools inner join users on tools.lender_id = users.id
      group by tools.lender_id
    SQL
    tools = Tool.find_by_sql(sql)

    @chart_info = tools.map do |tool|
      [User.find(tool.lender_id).name, tool.count]
    end
  end


  def new
    @tool = Tool.new
  end

  def create
    tool = Tool.new(name: params[:tool][:name], safety_level: params[:tool][:safety_level], portability: params[:tool][:portability], condition: params[:tool][:condition], lender_id: session[:user_id])
    if tool.save
      redirect_to tool_path(tool)
    else
      render :new
    end
  end

  def show
    @tool = Tool.find(params[:id])
    #
    # @tool.reviews << @review

  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    @tool.update(name: params[:tool][:name], safety_level: params[:tool][:safety_level], portability: params[:tool][:portability], condition: params[:tool][:condition])
    if @tool.valid?
      @tool.save
      redirect_to tool_path(@tool)
    else
      render :edit
    end
  end

  def destroy
    tool = Tool.find(params[:id])
    @user = User.find(session[:user_id])
    tool.delete
    redirect_to user_path(@user)
  end

  private
  def tool_params(*args)
    params.require(:tool).permit(*args)
  end
end
