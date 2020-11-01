class Artists::ArtistsController < ApplicationController

  before_action :set_variables, except: :index

  def index
    @artists = Artist.all
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
      @artist = Artist.friendly.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name)
    end

end