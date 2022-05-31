class ProgressesController < ApplicationController
  def new
    @progress = Progress.new
    # Gameモデルから現在のgame_idを持つレコードを検索
    current_game = Game.find(params[:game_id])
    # Questionモデルのメソッドを呼び出して＠questionに格納
    @question = Question.next_question(current_game)
  end
    
  def create
  # url(game/game_id/progresses_new)のgame_idからGameレコードを検索しcurrent_gameとして保存
    current_game = Game.find(params[:game_id])
  # progressにcurrent_gameと紐づいたprogressを作成
    progress = current_game.progresses.new(create_params)
  # progressモデルのassign_sequenceメソッドを呼び出す
    progress.assign_sequence
  # 回答した内容を保存する
    progress.save!
    next_question = Question.next_question(current_game)
    if next_question.blank?
      # Gameレコードのカラムに代入
      current_game.status = 'finished'
      current_game.result = 'incorrect'
      current_game.save!
    # give_upパスに移動
      redirect_to give_up_game_path(current_game)
      return
    end
    # 現在のゲームのurlに移動
    redirect_to new_game_progress_path(current_game)
  end
  
  private
  
  # 受け取るパラメーターをquestion_idとanswerに限定する
  def create_params
    params.require(:progress).permit(:question_id, :answer)
  end
end
