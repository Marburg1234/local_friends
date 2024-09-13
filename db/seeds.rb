# 管理者用のログイン情報
Admin.create(email: '1@yahoo.co.jp', password: '111111')

# 国と地域のデータ 関連付けて登録する
japan = Country.create(name: '日本')
Region.create(name: '北海道', country: japan)
Region.create(name: '青森', country: japan)
Region.create(name: '岩手', country: japan)
Region.create(name: '宮城', country: japan)
Region.create(name: '秋田', country: japan)
Region.create(name: '山形', country: japan)
Region.create(name: '福島', country: japan)
Region.create(name: '茨城', country: japan)
Region.create(name: '栃木', country: japan)
Region.create(name: '群馬', country: japan)
Region.create(name: '埼玉', country: japan)
Region.create(name: '千葉', country: japan)
Region.create(name: '東京', country: japan)
Region.create(name: '神奈川', country: japan)
Region.create(name: '山梨', country: japan)
Region.create(name: '長野', country: japan)
Region.create(name: '新潟', country: japan)
Region.create(name: '富山', country: japan)
Region.create(name: '石川', country: japan)
Region.create(name: '福井', country: japan)
Region.create(name: '岐阜', country: japan)
Region.create(name: '静岡', country: japan)
Region.create(name: '愛知', country: japan)
Region.create(name: '三重', country: japan)
Region.create(name: '滋賀', country: japan)
Region.create(name: '京都', country: japan)
Region.create(name: '大阪', country: japan)
Region.create(name: '兵庫', country: japan)
Region.create(name: '奈良', country: japan)
Region.create(name: '和歌山', country: japan)
Region.create(name: '鳥取', country: japan)
Region.create(name: '島根', country: japan)
Region.create(name: '岡山', country: japan)
Region.create(name: '広島', country: japan)
Region.create(name: '山口', country: japan)
Region.create(name: '徳島', country: japan)
Region.create(name: '香川', country: japan)
Region.create(name: '愛媛', country: japan)
Region.create(name: '高知', country: japan)
Region.create(name: '福岡', country: japan)
Region.create(name: '佐賀', country: japan)
Region.create(name: '長崎', country: japan)
Region.create(name: '熊本', country: japan)
Region.create(name: '大分', country: japan)
Region.create(name: '宮崎', country: japan)
Region.create(name: '鹿児島', country: japan)
Region.create(name: '沖縄', country: japan)

usa = Country.create(name: 'アメリカ')
Region.create(name: 'Los Angeles', country: usa)
Region.create(name: 'New York', country: usa)
Region.create(name: 'Ohio', country: usa)
Region.create(name: 'Nashville', country: usa)
Region.create(name: 'Chicago', country: usa)

germany = Country.create(name: 'ドイツ')
Region.create(name: 'Kiel', country: germany)
Region.create(name: 'Hamburg', country: germany)
Region.create(name: 'Berlin', country: germany)
Region.create(name: 'Münster', country: germany)
Region.create(name: 'Bremen', country: germany)
Region.create(name: 'Köln', country: germany)
Region.create(name: 'Hannover', country: germany)
Region.create(name: 'Leipzig', country: germany)
Region.create(name: 'Augsburg', country: germany)
Region.create(name: 'München', country: germany)
Region.create(name: 'Frankfurt am Main', country: germany)

france = Country.create(name: 'フランス')
Region.create(name: 'Paris', country: france)
Region.create(name: 'Lyon', country: france)
Region.create(name: 'Toulouse', country: france)
Region.create(name: 'Lille', country: france)
Region.create(name: 'Bordeaux', country: france)
Region.create(name: 'Nice', country: france)

uk = Country.create(name: 'イギリス')
Region.create(name: 'London', country: uk)
Region.create(name: 'Manchester', country: uk)
Region.create(name: 'New Castle', country: uk)
Region.create(name: 'Liverpool', country: uk)
Region.create(name: 'Oxford', country: uk)
Region.create(name: 'Birmingham', country: uk)

korea = Country.create(name: '韓国')
Region.create(name: 'Soul', country: korea)
Region.create(name: 'Pusan', country: korea)
Region.create(name: 'Incheon', country: korea)
Region.create(name: 'Daegu', country: korea)
Region.create(name: 'Jeju', country: korea)
Region.create(name: 'Suwon', country: korea)

china = Country.create(name: '中国')
Region.create(name: 'Beijing', country: china)
Region.create(name: 'Shanghai', country: china)
Region.create(name: 'Wuhan', country: china)
Region.create(name: 'Nanjing', country: china)
Region.create(name: 'Suzhou', country: china)
Region.create(name: 'Chongqing', country: china)
Region.create(name: 'Shenzhen', country: china)

# 言語のデータ
Language.create!(name: '日本語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/japan.png"), filename:"japan.png")
end

Language.create!(name: '英語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/usa.png"), filename:"usa.png")
end

Language.create!(name: '韓国語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/korea.png"), filename:"korea.png")
end

Language.create!(name: '中国語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/china.png"), filename:"china.png")
end

Language.create!(name: 'スペイン語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/spain.png"), filename:"spain.png")
end

Language.create!(name: 'フランス語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/france.png"), filename:"france.png")
end

Language.create!(name: 'イタリア語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/italy.png"), filename:"italy.png")
end

Language.create!(name: 'ドイツ語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/germany.png"), filename:"germany.png")
end


# ユーザーを登録1
User.create!(first_name: 'Liam') do |user|
    user.family_name = 'O Connor'
    user.email = '1@yahoo.co.jp'
    user.password = '111111'
    user.country_id = 2
    user.region_id = 54
    user.mother_language_id = 2
    user.practice_language_id = 8
    user.introduction = "Hello, my name is Liam. I am studying German and interested in German beer culture and history. My hobbies are cycling and reading."
    user.age = 24
    user.topic = "Cycling, beer culture, history, travel"
    user.is_active = 'true'
end

# ユーザーを登録2
User.create!(first_name: 'Isabel') do |user|
    user.family_name = 'López'
    user.email = '2@yahoo.co.jp'
    user.password = '111111'
    user.country_id = 5
    user.region_id = 72
    user.mother_language_id = 2
    user.practice_language_id = 7
    user.introduction = "¡Ora! Me llamo Isabelle. Me encanta el arte y la comida italiana y estoy aprendiendo italiano. Mi sueño es aprender la cocina local en Italia！"
    user.age = 28
    user.topic = "Arte, cocina, viajes, cultura italiana！"
    user.is_active = 'true'
end

# ユーザーを登録3
User.create!(first_name: 'Sophie') do |user|
    user.family_name = 'Müller'
    user.email = '3@yahoo.co.jp'
    user.password = '111111'
    user.country_id = 3
    user.region_id = 62
    user.mother_language_id = 8
    user.practice_language_id = 5
    user.introduction = "Hallo, mein Name ist Sophie. Ich studiere Spanisch und mein Ziel ist es, durch Südamerika zu reisen. Ich liebe Musik und Tanz, und ich bin besonders von lateinamerikanischer Musik angezogen."
    user.age = 21
    user.topic = "Musik, Tanz, Reisen, Sprachen lernen！"
    user.is_active = 'true'
end

# ユーザーを登録4
User.create!(first_name: 'Hamilton') do |user|
    user.family_name = 'Ojay'
    user.email = '4@yahoo.co.jp'
    user.password = '111111'
    user.country_id = 2
    user.region_id = 47
    user.mother_language_id = 4
    user.practice_language_id = 1
    user.introduction = "I want to talk japanese fluently！！"
    user.age = 29
    user.topic = "Anime, japanese custom, movie"
    user.is_active = 'true'
end

# ユーザーを登録5
User.create!(first_name: 'Emily') do |user|
    user.family_name = 'Thompson'
    user.email = '5@yahoo.co.jp'
    user.password = '111111'
    user.country_id = 2
    user.region_id = 50
    user.mother_language_id = 2
    user.practice_language_id = 1
    user.introduction = "こんにちは！エミリーです。私はテクノロジー業界で働いていて、日本の文化に興味があります。特に日本のアニメや食べ物が大好きです。"
    user.age = 26
    user.topic = "アニメ、テクノロジー、料理、日本文化"
    user.is_active = 'true'
end

# ユーザーを登録6
User.create!(first_name: 'Hiroshi') do |user|
    user.family_name = 'Nakamura'
    user.email = '6@yahoo.co.jp'
    user.password = '111111'
    user.country_id = 1
    user.region_id = 28
    user.mother_language_id = 1
    user.practice_language_id = 2
    user.introduction = "こんにちは、ヒロシです。英語を勉強しながら、世界中の人々と交流するのが大好きです。趣味は写真撮影と旅行です。"
    user.age = 33
    user.topic = "写真、旅行、言語学習、音楽"
    user.is_active = 'true'
end

# ユーザーを登録7
User.create!(first_name: 'Marta') do |user|
    user.family_name = 'Nowak'
    user.email = '7@yahoo.co.jp'
    user.password = '111111'
    user.country_id = 4
    user.region_id = 68
    user.mother_language_id = 6
    user.practice_language_id = 1
    user.introduction = "ヤチェム！マルタです。日本の歴史や美術に興味があり、日本語を勉強して日本に行くことが夢です。"
    user.age = 22
    user.topic = "美術、歴史、旅行、言語学習"
    user.is_active = 'true'
end

# ユーザーを登録8
User.create!(first_name: 'Carlos') do |user|
    user.family_name = 'Ramirez'
    user.email = '8@yahoo.co.jp'
    user.password = '111111'
    user.country_id = 3
    user.region_id = 60
    user.mother_language_id = 8
    user.practice_language_id = 1
    user.introduction = "こんにちは！カルロスです。日本文化が好きで、日本語を勉強しています。サッカーが大好きで、旅行して新しい友達を作るのが楽しみです。"
    user.age = 22
    user.topic = "サッカー、旅行、文化交流、料理"
    user.is_active = 'true'
end

# ユーザーを登録9
User.create!(first_name: 'Yumi') do |user|
    user.family_name = 'Tanaka'
    user.email = '9@yahoo.co.jp'
    user.password = '111111'
    user.country_id = 1
    user.region_id = 36
    user.mother_language_id = 1
    user.practice_language_id = 3
    user.introduction = "こんにちは、ユミです。韓国ドラマが好きで、韓国語を勉強中です。趣味はカフェ巡りとファッションです。"
    user.age = 22
    user.topic = "韓国ドラマ、ファッション、カフェ、旅行"
    user.is_active = 'true'
end