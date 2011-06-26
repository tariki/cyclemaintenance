class ComponentsController < ApplicationController
  include BikesHelper
  include UsersHelper

  before_filter :authenticate_user!
  before_filter :find_bike
  before_filter :correct_user, :only => [:new, :create, :destroy]

  def new
    @components = @bike.components
    @component = Component.new
    @title = "Edit #{bike_info(@bike)} components"
  end

  def create
    @component = @bike.components.build(params[:component])

    if @component.save
      redirect_to @bike, :flash => { :success => "New component is registered." }
    else
      @bike.components.delete(@component)
      @components = @bike.components
      @title = "Edit #{bike_info(@bike)} components"
      render :action => :new
    end
  end

  def destroy
    @component = Component.find(params[:id])
    @component.destroy

    redirect_to @bike, :flash => { :success => "Component is deleted." }
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
