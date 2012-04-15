class InfosController < ApplicationController

  def index
    @infos = Info.paginate(:page => params[:page], :per_page => 10)
    @title = "New informations"
  end

  def new
    @info = Info.new
    @title = "Register a new information"
  end

  def create
    @info = Info.new(params[:info])

    if @info.save
      redirect_to infos_path, :flash => { :success => "New information is registered." }
    else
      render :action => :new
    end
  end

  def destroy
    @info = Info.find(params[:id])
    @info.destroy

    redirect_to infos_path, :flash => { :success => "A information is deleted." }
  end

end
