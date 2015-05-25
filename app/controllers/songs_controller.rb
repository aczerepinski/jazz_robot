class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    key = @song.key_of_c
    @transposed_song = @song.transpose(key)
  end

end
