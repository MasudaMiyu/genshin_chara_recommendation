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
          has_heavy_past?(progress)
        when 'gap_app_age'
          gap_app_age?(progress)
        when 'attack_or_support'
          attack_or_support?(progress)
        when 'would_betray'
          would_betray?(progress)
        when 'hot_female'
          hot_female?(progress)
        when 'ikemen'
          ikemen?(progress)
        when 'helpful'
          helpful?(progress)
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

  def has_heavy_past?(progress)
    # answerがpositive_answer(はい)だった時
    if progress.positive_answer?
      @query = @query.where.not("characters.has_heavy_past is null")
    end
    # answerがnegative_answer(いいえ)だった時
    if progress.negative_answer?
      @query = @query.where("characters.has_heavy_past is null")
    end
  end

  def gap_app_age?(progress)
    # answerがpositive_answer(はい)だった時
    if progress.positive_answer?
      @query = @query.where.not("characters.gap_app_age is null")
    end
    # answerがnegative_answer(いいえ)だった時
    if progress.negative_answer?
      @query = @query.where("characters.gap_app_age is null")
    end
  end

  def attack_or_support?(progress)
    # answerがpositive_answer(はい)だった時
    if progress.positive_answer?
      @query = @query.where.not("characters.attack_or_support is null")
    end
    # answerがnegative_answer(いいえ)だった時
    if progress.negative_answer?
      @query = @query.where("characters.attack_or_support is null")
    end
  end

  def would_betray?(progress)
    # answerがpositive_answer(はい)だった時
    if progress.positive_answer?
      @query = @query.where.not("characters.would_betray is null")
    end
    # answerがnegative_answer(いいえ)だった時
    if progress.negative_answer?
      @query = @query.where("characters.would_betray is null")
    end
  end

  def hot_female?(progress)
    # answerがpositive_answer(はい)だった時
    if progress.positive_answer?
      @query = @query.where.not("characters.hot_female is null")
    end
    # answerがnegative_answer(いいえ)だった時
    if progress.negative_answer?
      @query = @query.where("characters.hot_female is null")
    end
  end

  def ikemen?(progress)
    # answerがpositive_answer(はい)だった時
    if progress.positive_answer?
      @query = @query.where.not("characters.ikemen is null")
    end
    # answerがnegative_answer(いいえ)だった時
    if progress.negative_answer?
      @query = @query.where("characters.ikemen is null")
    end
  end

  def helpful?(progress)
    # answerがpositive_answer(はい)だった時
    if progress.positive_answer?
      @query = @query.where.not("characters.helpful is null")
    end
    # answerがnegative_answer(いいえ)だった時
    if progress.negative_answer?
      @query = @query.where("characters.helpful is null")
    end
  end
end
