class TracksController < ApplicationController
  def new
    @albums = Album.all
    @track = Track.new
    render :new
  end

  def create
    p params
    @track = Track.new(params[:track])
    if @track.save
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      @albums = Album.all
      render :new
    end
  end

  def index
    @tracks = Track.all
    render :index
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    @track.update_attributes(params[:track])

    if @track.save
      render :show
    else
      flash[:errors]  = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    flash[:confirmation] = "#{@track.name} deleted!"
    redirect_to tracks_url
  end
end
