class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.paginate(:page => params[:page], :per_page => 10)
    @title = "All users"
  end

  def show
    @user =  User.find(params[:id])
    @bikes = Bike.paginate(:conditions => {:user_id => @user.id}, :page => params[:page], :per_page => 5)
    @title = "#{@user.username} bikes"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, :flash => { :success => "User is deleted." }
  end

end
