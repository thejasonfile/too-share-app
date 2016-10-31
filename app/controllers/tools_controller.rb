class ToolsController < ApplicationController


    def index

      pie = <<-SQL
        select listings.tool_id, count(*) as count
        from listings inner join tools on listings.tool_id = tools.id
        group by listings.tool_id
        SQL
        names = Listing.find_by_sql(pie)
      @tool_name_pie = names.map do |listing|
        [Tool.find(listing.tool_id).name, listing.count]
      end

    sql = <<-SQL
      select tools.lender_id, count(*) as count
      from tools inner join users on tools.lender_id = users.id
      group by tools.lender_id
    SQL
    tools = Tool.find_by_sql(sql)


    @chart_info = tools.map do |tool|
      [User.find(tool.lender_id).name, tool.count]

    end

    @reviews = Review.all
    chart_info = Review.find_by_sql("SELECT rating, count(*) as count FROM reviews GROUP BY rating" )

@user = User.find(session[:user_id])
  end

  def new
    @tool = Tool.new
  end

  def create
    tool = Tool.new(name: params[:tool][:name], safety_level: params[:tool][:safety_level], portability: params[:tool][:portability], condition: params[:tool][:condition], lender_id: session[:user_id])
    if tool.save
      tool.name = tool.proper_tool_name(tool.name)
      tool.save
      @tool = tool
      redirect_to tool_path(@tool)
    else
      render new_tool_path
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
    tool = Tool.find(params[:id])
    tool.update(name: params[:tool][:name], safety_level: params[:tool][:safety_level], portability: params[:tool][:portability], condition: params[:tool][:condition])
    if tool.valid?
      tool.name = tool.proper_tool_name(tool.name)
      tool.save
      @tool = tool
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
