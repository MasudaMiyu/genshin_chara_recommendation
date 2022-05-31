class ExtractionAlgorithm
  attr_reader :game
  attr_reader :query

  def initialize(game)
    Rails.logger.debug('ExtractionAlgorithm initialized.')
    @game = game
    @query = Character.all
  end

  # 絞り込みを行い@queryを返却する
  def compute
    progresses = @game.progresses
    progresses.each do |progress|
      # question
      question = progress.question

      # questionのalgoruthmカラムが存在するとき
		  case question.algorithm
        # lgorithmカラムがhas_heavy_pastだった時
        when 'has_heavy_past'
          # serialization_end?メソッドを呼び出す
          serialization_end?(progress)
        else
          # されていない時をエラー発生させる
          raise Exception('Invalid algorithm. --> ' + question.algorithm.to_s)
      end

      # クエリ文字列を出力
      Rails.logger.debug('On the way query is ' + @query.to_sql.to_s)
      # 絞り込んだキャラクターの名前を出力
      Rails.logger.debug('On the way haracters are ' + @query.pluck(:name).to_a.to_s)
    end
    @query
  end

  private

  def serialization_end?(progress)
    # answerがpositive_answer(はい)だった時
    if progress.positive_answer?
      @query = @query.where.not("characters.has_heavy_past is null")
    end
    # answerがnegative_answer(いいえ)だった時
    if progress.negative_answer?
      @query = @query.where("characters.has_heavy_past is null")
    end
  end
end
