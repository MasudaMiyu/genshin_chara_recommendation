class Progress < ApplicationRecord
  belongs_to :game
  belongs_to :question

  def positive_answer?
    answer == 'positive'
  end
  
  def negative_answer?
    answer == 'negative'
  end

  def assign_sequence
    next_sequence = 1
    #　もしgame(gameコントローラーのcreateアクション)が存在していたとき
    if game.present?
      # all_progressにゲームの進捗(game.progresses)を保存
      all_progress = game.progresses
      # 進捗が0以上の時
      if all_progress.count > 0
        # progressesのsequenceカラムの最大値に1をプラスする
        next_sequence = all_progress.maximum(:sequence) + 1
      end
    end
    # 自身のsequenceにnext_sequenceを代入する
    self.sequence = next_sequence
  end
end
