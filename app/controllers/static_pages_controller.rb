class StaticPagesController < ApplicationController

  layout 'home', only: :home

  def home
    @artists = Artist.recent.limit(10)
    @albums = Album.recent.limit(10)
    @tracks = Track.recent.limit(10)
  end

  def about
  end

  def terms
  end

  def privacy
  end

  def dmca
  end

end