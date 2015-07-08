class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    respond_to do |format|
      format.html do
        @song = Song.find(params[:id])
        if params[:key]
          @song_chords = @song.send("key_of_#{params[:key]}")
        else
          @song_chords = @song.roman_numerals
        end
      end
      format.json do
        @song = Song.find(params[:id])
        render 'song'
      end
    end
  end

end