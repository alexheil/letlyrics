class Users::UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @tracks = @user.tracks
  end

end