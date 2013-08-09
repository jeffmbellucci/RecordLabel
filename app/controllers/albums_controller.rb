class AlbumsController < ApplicationController
  def new
    @bands = Band.all
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors]  = @album.errors.full_messages
      @bands = Band.all
      render :new
    end
  end

  def index
    @albums = Album.all
    render :index
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    @album.update_attributes(params[:album])

    if @album.save
      render :show
    else
      flash[:errors]  = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:confirmation] = "#{@album.name} deleted!"
    redirect_to albums_url
  end


end
