class BikesController < ApplicationController
  include BikesHelper
  include UsersHelper

  before_filter :authenticate_user!, :except => [:show, :thumbnail, :screen]
  before_filter :correct_user, :only => [:edit, :update, :destroy]

  def show
    @bike = Bike.find(params[:id])
    @components = @bike.components
    @records = Record.paginate(:conditions => {:bike_id => @bike.id}, :page => params[:page], :per_page => 10)
    @total_weight = @bike.components.sum(:weight)
    @title = "#{bike_info(@bike)} information"
  end

  def new
    @bike = Bike.new
    @title = "Register your bike"
  end

  def edit
    @bike = Bike.find(params[:id])
    @title = "Edit #{bike_info(@bike)} basic information"
  end

  def create
    @bike = current_user.bikes.build(params[:bike])

    if @bike.save
      redirect_to root_path, :flash => { :success => "New bike is registered." }
    else
      render 'new'
    end
  end

  def update
    @bike = Bike.find(params[:id])

    if @bike.update_attributes(params[:bike])
      redirect_to @bike, :flash => { :success => "Basic information is updated." }
    else
      render 'edit'
    end
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy

    redirect_to root_path, :flash => { :success => "Bike is deleted." }
  end

  def thumbnail
    @bike = Bike.find(params[:id])

    respond_to do |format|
      format.jpg
    end
  end

  def screen
    @bike = Bike.find(params[:id])

    respond_to do |format|
      format.jpg
    end
  end

private 
  
  def correct_user
    @bike = Bike.find(params[:id])
    redirect_to current_user unless current_user?(@bike.user)
  end

end
