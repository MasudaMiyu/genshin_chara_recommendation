class GamesController < ApplicationController
  def new; end

  def create
    game = Game.create!(status: 'in_progress')
    redirect_to new_game_progress_path(game)
  end

  def give_up; end

  def result
    current_game = Game.find(params[:id])
    extract_character =  ExtractionAlgorithm.new(current_game).compute
    @character = extract_character.first
  end
end
