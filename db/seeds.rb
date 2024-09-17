# 管理者用のログイン情報
Admin.create(email: '1@yahoo.co.jp', password: '111111')

# 国と地域のデータ 関連付けて登録する
japan = Country.create(name: '日本')

Region.create(name: '北海道', country: japan, latitude: 43.06417, longitude: 141.34694)
Region.create(name: '青森', country: japan, latitude: 40.82222, longitude: 140.74750)
Region.create(name: '岩手', country: japan, latitude: 39.70361, longitude: 141.15250)
Region.create(name: '宮城', country: japan, latitude: 38.26889, longitude: 140.87194)
Region.create(name: '秋田', country: japan, latitude: 39.71861, longitude: 140.10250)
Region.create(name: '山形', country: japan, latitude: 38.24056, longitude: 140.36333)
Region.create(name: '福島', country: japan, latitude: 37.75000, longitude: 140.46778)
Region.create(name: '茨城', country: japan, latitude: 36.34139, longitude: 140.44667)
Region.create(name: '栃木', country: japan, latitude: 36.56583, longitude: 139.88361)
Region.create(name: '群馬', country: japan, latitude: 36.39111, longitude: 139.06083)
Region.create(name: '埼玉', country: japan, latitude: 35.85694, longitude: 139.64889)
Region.create(name: '千葉', country: japan, latitude: 35.60556, longitude: 140.12333)
Region.create(name: '東京', country: japan, latitude: 35.68284, longitude: 139.75945)
Region.create(name: '神奈川', country: japan, latitude: 35.44778, longitude: 139.64278)
Region.create(name: '山梨', country: japan, latitude: 35.66389, longitude: 138.56833)
Region.create(name: '長野', country: japan, latitude: 36.65139, longitude: 138.18111)
Region.create(name: '新潟', country: japan, latitude: 37.90222, longitude: 139.02361)
Region.create(name: '富山', country: japan, latitude: 36.69528, longitude: 137.21361)
Region.create(name: '石川', country: japan, latitude: 36.59444, longitude: 136.62556)
Region.create(name: '福井', country: japan, latitude: 36.06583, longitude: 136.22194)
Region.create(name: '岐阜', country: japan, latitude: 35.39111, longitude: 136.72222)
Region.create(name: '静岡', country: japan, latitude: 34.97556, longitude: 138.38278)
Region.create(name: '愛知', country: japan, latitude: 35.18028, longitude: 136.90667)
Region.create(name: '三重', country: japan, latitude: 34.73028, longitude: 136.50861)
Region.create(name: '滋賀', country: japan, latitude: 35.00444, longitude: 135.86861)
Region.create(name: '京都', country: japan, latitude: 35.02139, longitude: 135.75556)
Region.create(name: '大阪', country: japan, latitude: 34.69389, longitude: 135.50278)
Region.create(name: '兵庫', country: japan, latitude: 34.69139, longitude: 135.18306)
Region.create(name: '奈良', country: japan, latitude: 34.68528, longitude: 135.83278)
Region.create(name: '和歌山', country: japan, latitude: 34.22611, longitude: 135.16750)
Region.create(name: '鳥取', country: japan, latitude: 35.50139, longitude: 134.23583)
Region.create(name: '島根', country: japan, latitude: 35.47222, longitude: 133.05000)
Region.create(name: '岡山', country: japan, latitude: 34.66167, longitude: 133.93472)
Region.create(name: '広島', country: japan, latitude: 34.39639, longitude: 132.45944)
Region.create(name: '山口', country: japan, latitude: 34.18583, longitude: 131.47194)
Region.create(name: '徳島', country: japan, latitude: 34.06528, longitude: 134.55944)
Region.create(name: '香川', country: japan, latitude: 34.34028, longitude: 134.04611)
Region.create(name: '愛媛', country: japan, latitude: 33.84167, longitude: 132.76611)
Region.create(name: '高知', country: japan, latitude: 33.55944, longitude: 133.53111)
Region.create(name: '福岡', country: japan, latitude: 33.59028, longitude: 130.40194)
Region.create(name: '佐賀', country: japan, latitude: 33.24917, longitude: 130.30000)
Region.create(name: '長崎', country: japan, latitude: 32.75000, longitude: 129.87500)
Region.create(name: '熊本', country: japan, latitude: 32.78917, longitude: 130.74167)
Region.create(name: '大分', country: japan, latitude: 33.23806, longitude: 131.61250)
Region.create(name: '宮崎', country: japan, latitude: 31.91139, longitude: 131.42333)
Region.create(name: '鹿児島', country: japan, latitude: 31.56028, longitude: 130.55806)
Region.create(name: '沖縄', country: japan, latitude: 26.21250, longitude: 127.68111)

usa = Country.create(name: 'アメリカ')
Region.create(name: 'Los Angeles', country: usa, latitude: 34.05223, longitude: -118.24368)
Region.create(name: 'New York', country: usa, latitude: 40.71278, longitude: -74.00600)
Region.create(name: 'Ohio', country: usa, latitude: 39.09973, longitude: -84.71277)
Region.create(name: 'Nashville', country: usa, latitude: 36.16278, longitude: -86.78114)
Region.create(name: 'Chicago', country: usa, latitude: 41.87811, longitude: -87.62980)

germany = Country.create(name: 'ドイツ')
Region.create(name: 'Kiel', country: germany, latitude: 54.32329, longitude: 10.13980)
Region.create(name: 'Hamburg', country: germany, latitude: 53.55109, longitude: 9.99368)
Region.create(name: 'Berlin', country: germany, latitude: 52.52000, longitude: 13.40500)
Region.create(name: 'Münster', country: germany, latitude: 51.96066, longitude: 7.62613)
Region.create(name: 'Bremen', country: germany, latitude: 53.07930, longitude: 8.80170)
Region.create(name: 'Köln', country: germany, latitude: 50.93753, longitude: 6.96028)
Region.create(name: 'Hannover', country: germany, latitude: 52.37589, longitude: 9.73201)
Region.create(name: 'Leipzig', country: germany, latitude: 51.33969, longitude: 12.37307)
Region.create(name: 'Augsburg', country: germany, latitude: 48.40110, longitude: 10.89880)
Region.create(name: 'München', country: germany, latitude: 48.13513, longitude: 11.58198)
Region.create(name: 'Frankfurt am Main', country: germany, latitude: 50.11092, longitude: 8.68213)

france = Country.create(name: 'フランス')
Region.create(name: 'Paris', country: france, latitude: 48.8566, longitude: 2.3522)
Region.create(name: 'Lyon', country: france, latitude: 45.7640, longitude: 4.8357)
Region.create(name: 'Toulouse', country: france, latitude: 43.6047, longitude: 1.4442)
Region.create(name: 'Lille', country: france, latitude: 50.6292, longitude: 3.0573)
Region.create(name: 'Bordeaux', country: france, latitude: 44.8378, longitude: -0.5792)
Region.create(name: 'Nice', country: france, latitude: 43.7102, longitude: 7.2620)

uk = Country.create(name: 'イギリス')
Region.create(name: 'London', country: uk, latitude: 51.5074, longitude: -0.1278)
Region.create(name: 'Manchester', country: uk, latitude: 53.4839, longitude: -2.2446)
Region.create(name: 'New Castle', country: uk, latitude: 54.9784, longitude: -1.6170)
Region.create(name: 'Liverpool', country: uk, latitude: 53.4084, longitude: -2.9916)
Region.create(name: 'Oxford', country: uk, latitude: 51.7548, longitude: -1.2544)
Region.create(name: 'Birmingham', country: uk, latitude: 52.4862, longitude: -1.8904)

korea = Country.create(name: '韓国')
Region.create(name: 'Seoul', country: korea, latitude: 37.5665, longitude: 126.9780)
Region.create(name: 'Busan', country: korea, latitude: 35.1796, longitude: 129.0756)
Region.create(name: 'Incheon', country: korea, latitude: 37.4563, longitude: 126.7052)
Region.create(name: 'Daegu', country: korea, latitude: 35.8714, longitude: 128.6014)
Region.create(name: 'Jeju', country: korea, latitude: 33.4996, longitude: 126.5312)
Region.create(name: 'Suwon', country: korea, latitude: 37.2636, longitude: 127.0286)

china = Country.create(name: '中国')
Region.create(name: 'Beijing', country: china, latitude: 39.9042, longitude: 116.4074)
Region.create(name: 'Shanghai', country: china, latitude: 31.2304, longitude: 121.4737)
Region.create(name: 'Wuhan', country: china, latitude: 30.5928, longitude: 114.3055)
Region.create(name: 'Nanjing', country: china, latitude: 32.0603, longitude: 118.7969)
Region.create(name: 'Suzhou', country: china, latitude: 31.2989, longitude: 120.5853)
Region.create(name: 'Chongqing', country: china, latitude: 29.5630, longitude: 106.5516)
Region.create(name: 'Shenzhen', country: china, latitude: 22.5429, longitude: 114.0596)

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