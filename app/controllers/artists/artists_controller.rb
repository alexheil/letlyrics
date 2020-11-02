class Artists::ArtistsController < ApplicationController

  before_action :set_variables, except: :index
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @artists = Artist.alpha.page params[:page]
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