class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    respond_to do |format|
      format.html do
        @song = Song.find(params[:id])
        @key = @song.key_of_bb
        @transposed_song = @song.transpose(@key)
      end
      format.js do 
        binding.pry 
        @newKey = params[:key]
        render 'trololololz'
      end
    end
  end

end


# <h2>Roman Numerals</h2>
# <br>
# <div class="row chords">
#   <% @song.chords_array.each do |measure| %>
#   <span class="col-xs-3">
#     <% measure.each do |chord| %>
#     <%= chord %>
#     <% end %>
#   </span>
#   <% end %>
# </div>
# <br>
# <br>