class RecordsController < ApplicationController
  include BikesHelper
  include UsersHelper

  before_filter :authenticate_user!
  before_filter :find_bike
  before_filter :correct_user, :only => [:new, :create, :destroy]

  def new
    @records = Record.paginate(:conditions => {:bike_id => @bike.id}, :page => params[:page], :per_page => 10)
    @record = Record.new
    @title = "Edit #{bike_info(@bike)} records"
  end

  def create
    @record = @bike.records.build(params[:record])

    if @record.save
      redirect_to @bike, :flash => { :success => "New maintenance is recorded." }
    else
      @bike.records.delete(@record)
      @records = @bike.records
      @title = "Edit #{bike_info(@bike)} records"
      render :action => :new
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy

    redirect_to @bike, :flash => { :success => "Maintenance record is deleted." }
  end

private

  def find_bike
    @bike_id = params[:bike_id]
    return(redirect_to(bike_url)) unless @bike_id
    @bike = Bike.find(@bike_id)
  end

  def correct_user
    redirect_to current_user unless current_user?(@bike.user)
  end

end
