class BandsController < ApplicationController

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(params[:band])

    if @band.save
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def index
    @bands = Band.all
    render :index
  end

  def update
    @band = Band.find(params[:id])
    @band.update_attributes(params[:band])
    if @band.save
      render :show
    else
      flash[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    flash[:confirmation] = "#{@band.name} deleted!"
    redirect_to bands_url
  end
end
