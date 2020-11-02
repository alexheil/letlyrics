class Albums::AlbumsController < ApplicationController

  before_action :set_variables
  before_action :authenticate_user!, except: :show

  def show
    @tracks = @album.tracks
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_variables
      @album = Album.friendly.find(params[:id])
      @artist = @album.artist
    end

    def album_params
      params.require(:album).permit(:artist_id, :artist_name, :name)
    end
    
end