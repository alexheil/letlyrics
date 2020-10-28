class tracks::tracksController < ApplicationController

  before_action :set_variables, except: [:new, :create]

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
  end

  def show
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