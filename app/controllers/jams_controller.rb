class JamsController < ApplicationController

  def show
    respond_to do |format|
      format.html do
        @song = Song.find(params[:song_id])
        if params[:key]
          @song_chords = @song.send("key_of_#{params[:key]}")
        else
          @song_chords = @song.roman_numerals
        end
      end
      format.json do
        @song = Song.find(params[:song_id])
        render 'jam'
      end
    end
  end

end