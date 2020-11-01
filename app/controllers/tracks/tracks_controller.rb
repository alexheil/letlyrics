class Tracks::TracksController < ApplicationController

  before_action :set_variables, except: [:new, :create]

  def new
    #@artist = Artist.find(1)
    @track = Track.new
  end

  def create

    @artist = Artist.find_or_create_by(name: params[:track][:artist_name])
    @album = Album.find_or_create_by(name: params[:track][:album_name], artist_id: @artist.id, artist_name: @artist.name)

    @uni_track = Track.new(track_params)
    @uni_track.artist_id = @artist.id
    @uni_track.album_id = @album.id

    if @uni_track.save
      redirect_to root_url
    else
      render 'new'
    end

  end

  def show
    @albums = @artist.albums
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_variables
      @track = Track.friendly.find(params[:id])
      @album = @track.album
      @artist = @album.artist
    end

    def track_params
      params.require(:track).permit(:artist_id, :artist_name, :album_id, :album_name, :name, :content)
    end
    
end