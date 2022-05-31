case ENV['SECTION']
  when "2"
    characters = [
      { name: 'ジン', element: '風', weapon: '片手剣', character_voice: '斎藤千和' },
      { name: 'ディルック', element: '炎', weapon: '大剣', character_voice: '小野賢章' },
      { name: 'モナ', element: '水', weapon: '法器', character_voice: '小原好美' },
      { name: '刻晴', element: '雷', weapon: '片手剣', character_voice: '喜多村英梨' },
      { name: 'アルベド', element: '岩', weapon: '片手剣', character_voice: '野島健児' },
      { name: 'エウルア', element: '', weapon: '大剣', character_voice: '佐藤利奈' },
      { name: 'クレー', element: '炎', weapon: '法器', character_voice: '久野美咲' },
      { name: 'ウェンティ', element: '風', weapon: '', character_voice: '村瀬歩' },
      { name: '七七', element: '氷', weapon: '片手剣', character_voice: '田村ゆかり' },
      { name: '胡桃', element: '炎', weapon: '槍', character_voice: '高橋李依' },
      { name: '魈', element: '風', weapon: '槍', character_voice: '松岡禎丞' },
      { name: '甘雨', element: '氷', weapon: '弓', character_voice: '上田麗奈' },
      { name: '鍾離', element: '岩', weapon: '槍', character_voice: '前野智昭' },
      { name: 'タルタリヤ', element: '水', weapon: '弓', character_voice: '木村良平' },
      { name: '申鶴', element: '氷', weapon: '槍', character_voice: '川澄綾子' },
      { name: '神里綾華', element: '氷', weapon: '片手剣', character_voice: '早見沙織' },
      { name: '神里綾人', element: '水', weapon: '片手剣', character_voice: '石田彰' },
      { name: '宵宮', element: '炎', weapon: '弓', character_voice: '植田佳奈' },
      { name: '雷電将軍', element: '雷', weapon: '槍', character_voice: '沢城みゆき' },
      { name: '珊瑚宮心海', element: '水', weapon: '法器', character_voice: '三森すずこ' },
      { name: '荒滝一斗', element: '岩', weapon: '大剣', character_voice: '西川貴教' },
      { name: '楓原万葉', element: '風', weapon: '片手剣', character_voice: '島崎信長' },
      { name: '八重神子', element: '雷', weapon: '法器', character_voice: '佐倉綾音' },
      { name: '夜蘭', element: '水', weapon: '弓', character_voice: '遠藤綾' },
    ]

  when "3"
    characters = [
      { name: 'ディルック', element: '炎', weapon: '大剣', character_voice: '小野賢章' },
    ]

    questions = [
      { content: '重い過去を持ったキャラクターが好き？', algorithm: 'past_match', eval_value: '重い過去を持っている' }, 
      { content: '無愛想に見えて実は優しいキャラクターが好き？', algorithm: 'kind_match', eval_value: '優しい' }
    ]
end

if characters.present?
  characters.each do |character|
    Character.create!(character)
  end
end

if questions.present?
  questions.each do |question|
    Question.create!(question)
  end
end
