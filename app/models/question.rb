class Question < ApplicationRecord
  has_many :progresses

  def self.next_question(game)
  # 受け取った引数からprogressesのquestion_idカラムを取り出して代入
    answered_question_ids = game.progresses.pluck(:question_id)
  # Gameレコードにquiestion_idが存在したQuestion以外をシャッフルして先頭を取り出す
    Question.where.not(id: answered_question_ids).shuffle.take(1).first
  end
end
