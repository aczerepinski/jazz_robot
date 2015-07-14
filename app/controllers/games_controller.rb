class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @game.data}
    end
    
  end

end
