class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :uni_track

  private

    def uni_track
      @uni_track = Track.new
    end
    
end
