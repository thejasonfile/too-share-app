class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]


  def index
    #@chart_info = Tool.group(:lender_id).count

    sql = <<-SQL 
      select tools.lender_id, count(*) as count
      from tools inner join users on tools.lender_id = users.id
      group by tools.lender_id
    SQL
    tools = Tool.find_by_sql(sql)
    
    @chart_info = tools.map do |tool|
      [tool.lender_id, tool.count] 
    end
  end

  def new
  end

  def create
    @user = User.create(name: params[:user][:name], email: params[:user][:email], location: params[:user][:location],password: params[:user][:password],password_confirmation: params[:user][:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show

    if session[:user_id] == params[:id].to_i
      @user = User.find(params[:id])

    else
      redirect_to user_path(session[:user_id])
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(name: params[:user][:name], email: params[:user][:email], location: params[:user][:location])
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    redirect_to root_path
  end

  private
  def user_params(*args)
    params.require(:user).permit(*args)
  end
end
