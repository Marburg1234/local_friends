# 管理者用のログイン情報
Admin.create(email: '1@yahoo.co.jp', password: '111111')

# 国と地域のデータ 関連付けて登録する
japan = Country.find_or_create_by!(name: '日本')

Region.find_or_create_by!(name: '北海道', country: japan, latitude: 43.06417, longitude: 141.34694)
Region.find_or_create_by!(name: '青森', country: japan, latitude: 40.82222, longitude: 140.74750)
Region.find_or_create_by!(name: '岩手', country: japan, latitude: 39.70361, longitude: 141.15250)
Region.find_or_create_by!(name: '宮城', country: japan, latitude: 38.26889, longitude: 140.87194)
Region.find_or_create_by!(name: '秋田', country: japan, latitude: 39.71861, longitude: 140.10250)
Region.find_or_create_by!(name: '山形', country: japan, latitude: 38.24056, longitude: 140.36333)
Region.find_or_create_by!(name: '福島', country: japan, latitude: 37.75000, longitude: 140.46778)
Region.find_or_create_by!(name: '茨城', country: japan, latitude: 36.34139, longitude: 140.44667)
Region.find_or_create_by!(name: '栃木', country: japan, latitude: 36.56583, longitude: 139.88361)
Region.find_or_create_by!(name: '群馬', country: japan, latitude: 36.39111, longitude: 139.06083)
Region.find_or_create_by!(name: '埼玉', country: japan, latitude: 35.85694, longitude: 139.64889)
Region.find_or_create_by!(name: '千葉', country: japan, latitude: 35.60556, longitude: 140.12333)
Region.find_or_create_by!(name: '東京', country: japan, latitude: 35.68284, longitude: 139.75945)
Region.find_or_create_by!(name: '神奈川', country: japan, latitude: 35.44778, longitude: 139.64278)
Region.find_or_create_by!(name: '山梨', country: japan, latitude: 35.66389, longitude: 138.56833)
Region.find_or_create_by!(name: '長野', country: japan, latitude: 36.65139, longitude: 138.18111)
Region.find_or_create_by!(name: '新潟', country: japan, latitude: 37.90222, longitude: 139.02361)
Region.find_or_create_by!(name: '富山', country: japan, latitude: 36.69528, longitude: 137.21361)
Region.find_or_create_by!(name: '石川', country: japan, latitude: 36.59444, longitude: 136.62556)
Region.find_or_create_by!(name: '福井', country: japan, latitude: 36.06583, longitude: 136.22194)
Region.find_or_create_by!(name: '岐阜', country: japan, latitude: 35.39111, longitude: 136.72222)
Region.find_or_create_by!(name: '静岡', country: japan, latitude: 34.97556, longitude: 138.38278)
Region.find_or_create_by!(name: '愛知', country: japan, latitude: 35.18028, longitude: 136.90667)
Region.find_or_create_by!(name: '三重', country: japan, latitude: 34.73028, longitude: 136.50861)
Region.find_or_create_by!(name: '滋賀', country: japan, latitude: 35.00444, longitude: 135.86861)
Region.find_or_create_by!(name: '京都', country: japan, latitude: 35.02139, longitude: 135.75556)
Region.find_or_create_by!(name: '大阪', country: japan, latitude: 34.69389, longitude: 135.50278)
Region.find_or_create_by!(name: '兵庫', country: japan, latitude: 34.69139, longitude: 135.18306)
Region.find_or_create_by!(name: '奈良', country: japan, latitude: 34.68528, longitude: 135.83278)
Region.find_or_create_by!(name: '和歌山', country: japan, latitude: 34.22611, longitude: 135.16750)
Region.find_or_create_by!(name: '鳥取', country: japan, latitude: 35.50139, longitude: 134.23583)
Region.find_or_create_by!(name: '島根', country: japan, latitude: 35.47222, longitude: 133.05000)
Region.find_or_create_by!(name: '岡山', country: japan, latitude: 34.66167, longitude: 133.93472)
Region.find_or_create_by!(name: '広島', country: japan, latitude: 34.39639, longitude: 132.45944)
Region.find_or_create_by!(name: '山口', country: japan, latitude: 34.18583, longitude: 131.47194)
Region.find_or_create_by!(name: '徳島', country: japan, latitude: 34.06528, longitude: 134.55944)
Region.find_or_create_by!(name: '香川', country: japan, latitude: 34.34028, longitude: 134.04611)
Region.find_or_create_by!(name: '愛媛', country: japan, latitude: 33.84167, longitude: 132.76611)
Region.find_or_create_by!(name: '高知', country: japan, latitude: 33.55944, longitude: 133.53111)
Region.find_or_create_by!(name: '福岡', country: japan, latitude: 33.59028, longitude: 130.40194)
Region.find_or_create_by!(name: '佐賀', country: japan, latitude: 33.24917, longitude: 130.30000)
Region.find_or_create_by!(name: '長崎', country: japan, latitude: 32.75000, longitude: 129.87500)
Region.find_or_create_by!(name: '熊本', country: japan, latitude: 32.78917, longitude: 130.74167)
Region.find_or_create_by!(name: '大分', country: japan, latitude: 33.23806, longitude: 131.61250)
Region.find_or_create_by!(name: '宮崎', country: japan, latitude: 31.91139, longitude: 131.42333)
Region.find_or_create_by!(name: '鹿児島', country: japan, latitude: 31.56028, longitude: 130.55806)
Region.find_or_create_by!(name: '沖縄', country: japan, latitude: 26.21250, longitude: 127.68111)

usa = Country.find_or_create_by!(name: 'アメリカ')
Region.find_or_create_by!(name: 'Los Angeles', country: usa, latitude: 34.05223, longitude: -118.24368)
Region.find_or_create_by!(name: 'New York', country: usa, latitude: 40.71278, longitude: -74.00600)
Region.find_or_create_by!(name: 'Ohio', country: usa, latitude: 39.09973, longitude: -84.71277)
Region.find_or_create_by!(name: 'Nashville', country: usa, latitude: 36.16278, longitude: -86.78114)
Region.find_or_create_by!(name: 'Chicago', country: usa, latitude: 41.87811, longitude: -87.62980)

germany = Country.find_or_create_by!(name: 'ドイツ')
Region.find_or_create_by!(name: 'Kiel', country: germany, latitude: 54.32329, longitude: 10.13980)
Region.find_or_create_by!(name: 'Hamburg', country: germany, latitude: 53.55109, longitude: 9.99368)
Region.find_or_create_by!(name: 'Berlin', country: germany, latitude: 52.52000, longitude: 13.40500)
Region.find_or_create_by!(name: 'Münster', country: germany, latitude: 51.96066, longitude: 7.62613)
Region.find_or_create_by!(name: 'Bremen', country: germany, latitude: 53.07930, longitude: 8.80170)
Region.find_or_create_by!(name: 'Köln', country: germany, latitude: 50.93753, longitude: 6.96028)
Region.find_or_create_by!(name: 'Hannover', country: germany, latitude: 52.37589, longitude: 9.73201)
Region.find_or_create_by!(name: 'Leipzig', country: germany, latitude: 51.33969, longitude: 12.37307)
Region.find_or_create_by!(name: 'Augsburg', country: germany, latitude: 48.40110, longitude: 10.89880)
Region.find_or_create_by!(name: 'München', country: germany, latitude: 48.13513, longitude: 11.58198)
Region.find_or_create_by!(name: 'Frankfurt am Main', country: germany, latitude: 50.11092, longitude: 8.68213)

france = Country.find_or_create_by!(name: 'フランス')
Region.find_or_create_by!(name: 'Paris', country: france, latitude: 48.8566, longitude: 2.3522)
Region.find_or_create_by!(name: 'Lyon', country: france, latitude: 45.7640, longitude: 4.8357)
Region.find_or_create_by!(name: 'Toulouse', country: france, latitude: 43.6047, longitude: 1.4442)
Region.find_or_create_by!(name: 'Lille', country: france, latitude: 50.6292, longitude: 3.0573)
Region.find_or_create_by!(name: 'Bordeaux', country: france, latitude: 44.8378, longitude: -0.5792)
Region.find_or_create_by!(name: 'Nice', country: france, latitude: 43.7102, longitude: 7.2620)

uk = Country.find_or_create_by!(name: 'イギリス')
Region.find_or_create_by!(name: 'London', country: uk, latitude: 51.5074, longitude: -0.1278)
Region.find_or_create_by!(name: 'Manchester', country: uk, latitude: 53.4839, longitude: -2.2446)
Region.find_or_create_by!(name: 'New Castle', country: uk, latitude: 54.9784, longitude: -1.6170)
Region.find_or_create_by!(name: 'Liverpool', country: uk, latitude: 53.4084, longitude: -2.9916)
Region.find_or_create_by!(name: 'Oxford', country: uk, latitude: 51.7548, longitude: -1.2544)
Region.find_or_create_by!(name: 'Birmingham', country: uk, latitude: 52.4862, longitude: -1.8904)

korea = Country.find_or_create_by!(name: '韓国')
Region.find_or_create_by!(name: 'Seoul', country: korea, latitude: 37.5665, longitude: 126.9780)
Region.find_or_create_by!(name: 'Busan', country: korea, latitude: 35.1796, longitude: 129.0756)
Region.find_or_create_by!(name: 'Incheon', country: korea, latitude: 37.4563, longitude: 126.7052)
Region.find_or_create_by!(name: 'Daegu', country: korea, latitude: 35.8714, longitude: 128.6014)
Region.find_or_create_by!(name: 'Jeju', country: korea, latitude: 33.4996, longitude: 126.5312)
Region.find_or_create_by!(name: 'Suwon', country: korea, latitude: 37.2636, longitude: 127.0286)

china = Country.find_or_create_by!(name: '中国')
Region.find_or_create_by!(name: 'Beijing', country: china, latitude: 39.9042, longitude: 116.4074)
Region.find_or_create_by!(name: 'Shanghai', country: china, latitude: 31.2304, longitude: 121.4737)
Region.find_or_create_by!(name: 'Wuhan', country: china, latitude: 30.5928, longitude: 114.3055)
Region.find_or_create_by!(name: 'Nanjing', country: china, latitude: 32.0603, longitude: 118.7969)
Region.find_or_create_by!(name: 'Suzhou', country: china, latitude: 31.2989, longitude: 120.5853)
Region.find_or_create_by!(name: 'Chongqing', country: china, latitude: 29.5630, longitude: 106.5516)
Region.find_or_create_by!(name: 'Shenzhen', country: china, latitude: 22.5429, longitude: 114.0596)

# 言語のデータ
unless Language.find_by(name: '日本語')
Language.create!(name: '日本語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/japan.png"), filename:"japan.png")
end
end

unless Language.find_by(name: '英語')
Language.create!(name: '英語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/usa.png"), filename:"usa.png")
end
end

unless Language.find_by(name: '韓国語')
Language.create!(name: '韓国語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/korea.png"), filename:"korea.png")
end
end

unless Language.find_by(name: '中国語')
Language.create!(name: '中国語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/china.png"), filename:"china.png")
end
end

unless Language.find_by(name: 'スペイン語')
Language.create!(name: 'スペイン語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/spain.png"), filename:"spain.png")
end
end

unless Language.find_by(name: 'フランス語')
Language.create!(name: 'フランス語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/france.png"), filename:"france.png")
end
end

unless Language.find_by(name: 'イタリア語')
Language.create!(name: 'イタリア語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/italy.png"), filename:"italy.png")
end
end

unless Language.find_by(name: 'ドイツ語')
Language.create!(name: 'ドイツ語') do |language|
    language.flag = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/germany.png"), filename:"germany.png")
end
end


# ユーザーを登録1
unless User.find_by(first_name: 'Isabel')
User.create!(first_name: 'Liam') do |user|
    user.family_name = 'O Connor'
    user.email = '1@yahoo.co.jp'
    user.password = '111111'
    user.nationality = Country.find_by(name: 'アメリカ').id
    user.country_id = Country.find_by(name: 'ドイツ').id
    user.region_id = Region.find_by(name: 'Hamburg').id
    user.mother_language_id = Language.find_by( name: '英語').id
    user.practice_language_id = Language.find_by( name: 'ドイツ語').id
    user.introduction = "Hello, my name is Liam. I am studying German and interested in German beer culture and history. My hobbies are cycling and reading."
    user.age = 24
    user.topic = "Cycling, beer culture, history, travel"
    user.is_active = 'true'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_woman1.png"), filename:"profile_woman1.png")
end
end

# ユーザーを登録2
unless User.find_by(first_name: 'Isabel')
User.create!(first_name: 'Isabel') do |user|
    user.family_name = 'López'
    user.email = '2@yahoo.co.jp'
    user.password = '111111'
    user.nationality = Country.find_by(name: 'イギリス').id
    user.country_id = Country.find_by(name: 'イギリス').id
    user.region_id = Region.find_by(name: 'New Castle').id
    user.mother_language_id = Language.find_by( name: '英語').id
    user.practice_language_id = Language.find_by( name: 'イタリア語').id
    user.introduction = "¡Ora! Me llamo Isabelle. Me encanta el arte y la comida italiana y estoy aprendiendo italiano. Mi sueño es aprender la cocina local en Italia！"
    user.age = 28
    user.topic = "Arte, cocina, viajes, cultura italiana！"
    user.is_active = 'true'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_woman2.jpg"), filename:"profile_woman2.jpg")
end
end

# ユーザーを登録3
unless User.find_by(first_name: 'Sophie')
User.create!(first_name: 'Sophie') do |user|
    user.family_name = 'Müller'
    user.email = '3@yahoo.co.jp'
    user.password = '111111'
    user.nationality = Country.find_by(name: 'ドイツ').id
    user.country_id = Country.find_by(name: 'ドイツ').id
    user.region_id = Region.find_by(name: 'München').id
    user.mother_language_id = Language.find_by( name: 'ドイツ語').id
    user.practice_language_id = Language.find_by( name: 'スペイン語').id
    user.introduction = "Hallo, mein Name ist Sophie. Ich studiere Spanisch und mein Ziel ist es, durch Südamerika zu reisen. Ich liebe Musik und Tanz, und ich bin besonders von lateinamerikanischer Musik angezogen."
    user.age = 21
    user.topic = "Musik, Tanz, Reisen, Sprachen lernen！"
    user.is_active = 'true'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/animal_neko.png"), filename:"animal_neko.png")
end
end

# ユーザーを登録4
unless User.find_by(first_name: 'Hamilton')
User.create!(first_name: 'Hamilton') do |user|
    user.family_name = 'Ojay'
    user.email = '4@yahoo.co.jp'
    user.password = '111111'
    user.nationality = Country.find_by(name: 'アメリカ').id
    user.country_id = Country.find_by(name: '日本').id
    user.region_id = Region.find_by(name: '沖縄').id
    user.mother_language_id = Language.find_by( name: '中国語').id
    user.practice_language_id = Language.find_by( name: '日本語').id
    user.introduction = "I want to talk japanese fluently！！"
    user.age = 29
    user.topic = "Anime, japanese custom, movie"
    user.is_active = 'true'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_man1.png"), filename:"profile_man1.png")
end
end

# ユーザーを登録5
unless User.find_by(first_name: 'Emily')
User.create!(first_name: 'Emily') do |user|
    user.family_name = 'Thompson'
    user.email = '5@yahoo.co.jp'
    user.password = '111111'
    user.nationality = Country.find_by(name: 'アメリカ').id
    user.country_id = Country.find_by(name: 'アメリカ').id
    user.region_id = Region.find_by(name: 'Ohio').id
    user.mother_language_id = Language.find_by( name: '英語').id
    user.practice_language_id = Language.find_by( name: '日本語').id
    user.introduction = "こんにちは！エミリーです。私はテクノロジー業界で働いていて、日本の文化に興味があります。特に日本のアニメや食べ物が大好きです。"
    user.age = 26
    user.topic = "アニメ、テクノロジー、料理、日本文化"
    user.is_active = 'true'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_woman3.png"), filename:"profile_woman3.png")
end
end

# ユーザーを登録6
unless User.find_by(first_name: 'Hiroshi')
User.create!(first_name: 'Hiroshi') do |user|
    user.family_name = 'Nakamura'
    user.email = '6@yahoo.co.jp'
    user.password = '111111'
    user.nationality = Country.find_by(name: 'アメリカ').id
    user.country_id = Country.find_by(name: '日本').id
    user.region_id = Region.find_by(name: '兵庫').id
    user.mother_language_id = Language.find_by( name: '日本語').id
    user.practice_language_id = Language.find_by( name: '英語').id
    user.introduction = "こんにちは、ヒロシです。英語を勉強しながら、世界中の人々と交流するのが大好きです。趣味は写真撮影と旅行です。"
    user.age = 33
    user.topic = "写真、旅行、言語学習、音楽"
    user.is_active = 'true'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_man2.png"), filename:"profile_man2.png")
end
end

# ユーザーを登録7
unless User.find_by(first_name: 'Marta')
User.create!(first_name: 'Marta') do |user|
    user.family_name = 'Nowak'
    user.email = '7@yahoo.co.jp'
    user.password = '111111'
    user.nationality = Country.find_by(name: 'フランス').id
    user.country_id = Country.find_by(name: 'フランス').id
    user.region_id = Region.find_by(name: 'Bordeaux').id
    user.mother_language_id = Language.find_by( name: 'フランス語').id
    user.practice_language_id = Language.find_by( name: '日本語').id
    user.introduction = "ヤチェム！マルタです。日本の歴史や美術に興味があり、日本語を勉強して日本に行くことが夢です。"
    user.age = 36
    user.topic = "美術、歴史、旅行、言語学習"
    user.is_active = 'true'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_man3.png"), filename:"profile_man3.png")
end
end

# ユーザーを登録8
unless User.find_by(first_name: 'Carlos')
User.create!(first_name: 'Carlos') do |user|
    user.family_name = 'Ramirez'
    user.email = '8@yahoo.co.jp'
    user.password = '111111'
    user.nationality = Country.find_by(name: 'ドイツ').id
    user.country_id = Country.find_by(name: 'ドイツ').id
    user.region_id = Region.find_by(name: 'Leipzig').id
    user.mother_language_id = Language.find_by( name: 'ドイツ語').id
    user.practice_language_id = Language.find_by( name: '日本語').id
    user.introduction = "こんにちは！カルロスです。日本文化が好きで、日本語を勉強しています。サッカーが大好きで、旅行して新しい友達を作るのが楽しみです。"
    user.age = 22
    user.topic = "サッカー、旅行、文化交流、料理"
    user.is_active = 'true'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_woman5.png"), filename:"profile_woman5.png")
end
end

# ユーザーを登録9
unless User.find_by(first_name: 'Yumi')
User.create!(first_name: 'Yumi') do |user|
    user.family_name = 'Tanaka'
    user.email = '9@yahoo.co.jp'
    user.password = '111111'
    user.nationality = Country.find_by(name: '日本').id
    user.country_id = Country.find_by(name: '日本').id
    user.region_id = Region.find_by(name: '徳島').id
    user.mother_language_id = Language.find_by( name: '日本語').id
    user.practice_language_id = Language.find_by( name: '韓国語').id
    user.introduction = "こんにちは、ユミです。韓国ドラマが好きで、韓国語を勉強中です。趣味はカフェ巡りとファッションです。"
    user.age = 22
    user.topic = "韓国ドラマ、ファッション、カフェ、旅行"
    user.is_active = 'true'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_woman4.png"), filename:"profile_woman4.png")
end
end

# ユーザーを登録10
unless User.find_by(first_name: 'Takumi')
User.create!(first_name: 'Takumi') do |user|
    user.family_name = 'Yamada'
    user.email = '10@yahoo.co.jp'
    user.password = '111111'
    user.nationality = Country.find_by(name: '日本').id
    user.country_id = Country.find_by(name: '日本').id
    user.region_id = Region.find_by(name: '東京').id
    user.mother_language_id = Language.find_by( name: '日本語').id
    user.practice_language_id = Language.find_by( name: 'フランス語').id
    user.introduction = "こんにちは、拓海です。パティシエとして働いていて、フランス菓子に憧れてフランス語を勉強しています。いつかフランスで修行することが夢です。"
    user.age = 28
    user.topic = "フランス菓子、料理、旅行、映画"
    user.is_active = 'true'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/animal_dog.png"), filename:"animal_dog.png")
end
end

# ユーザーを登録11
unless User.find_by(first_name: 'Haruka')
User.create!(first_name: 'Haruka') do |user|
    user.family_name = 'Saito'
    user.email = '11@yahoo.co.jp'
    user.password = '111111'
    user.nationality = Country.find_by(name: '日本').id
    user.country_id = Country.find_by(name: '日本').id
    user.region_id = Region.find_by(name: '北海道').id
    user.mother_language_id = Language.find_by( name: '日本語').id
    user.practice_language_id = Language.find_by( name: '英語').id
    user.introduction = "英語を学びながら、国際的な視野を広げたいと考えています。自然が大好きで、趣味はキャンプとハイキングです。"
    user.age = 24
    user.topic = "自然、アウトドア、映画、音楽"
    user.is_active = 'true'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_woman6.png"), filename:"profile_woman6.png")
end
end

# ユーザーを登録12
unless User.find_by(first_name: 'Kenta')
User.create!(first_name: 'Kenta') do |user|
    user.family_name = 'Nikaido'
    user.email = '12@yahoo.co.jp'
    user.password = '111111'
    user.nationality = Country.find_by(name: '日本').id
    user.country_id = Country.find_by(name: '日本').id
    user.region_id = Region.find_by(name: '北海道').id
    user.mother_language_id = Language.find_by( name: '日本語').id
    user.practice_language_id = Language.find_by( name: 'スペイン語').id
    user.introduction = "スペインサッカーが好きで、スペイン語を勉強中です。サッカー観戦やヨーロッパ旅行をするのが夢です。"
    user.age = 33
    user.topic = "サッカー、旅行、ヨーロッパ文化、グルメ"
    user.is_active = 'true'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_man4.png"), filename:"profile_man4.png")
end
end

# ユーザーを登録13
unless User.find_by(first_name: 'Shohei')
User.create!(first_name: 'Shohei') do |user|
    user.family_name = 'Suzuki'
    user.email = '13@yahoo.co.jp'
    user.password = '111111'
    user.nationality = Country.find_by(name: '日本').id
    user.country_id = Country.find_by(name: '日本').id
    user.region_id = Region.find_by(name: '長野').id
    user.mother_language_id = Language.find_by( name: '日本語').id
    user.practice_language_id = Language.find_by( name: '中国語').id
    user.introduction = "ビジネスマンとして中国と取引があるため、中国語を勉強しています。趣味は読書とビジネスに関する勉強です。"
    user.age = 36
    user.topic = "ビジネス、読書、言語学習、異文化交流"
    user.is_active = 'true'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_man5.png"), filename:"profile_man5.png")
end
end

# ユーザーを登録14
unless User.find_by(first_name: 'Min-Ji')
User.create!(first_name: 'Min-Ji') do |user|
    user.family_name = 'Kim'
    user.email = '14@yahoo.co.jp'
    user.password = '111111'
    user.nationality = Country.find_by(name: '韓国').id
    user.country_id = Country.find_by(name: '韓国').id
    user.region_id = Region.find_by(name: 'Incheon').id
    user.mother_language_id = Language.find_by( name: '韓国語').id
    user.practice_language_id = Language.find_by( name: '日本語').id
    user.introduction = "アンニョンハセヨ、ミンジです。日本のアニメや漫画に興味があって、日本語を勉強しています。いつか日本に行って、アニメの聖地巡りをしたいです。"
    user.age = 22
    user.topic = "アニメ、漫画、旅行、ファッション"
    user.is_active = 'true'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_woman7.png"), filename:"profile_woman7.png")
end
end

# ユーザーを登録15
unless User.find_by(first_name: 'Jae-Hyun')
User.create!(first_name: 'Jae-Hyun') do |user|
    user.family_name = 'Park'
    user.email = '15@yahoo.co.jp'
    user.password = '111111'
    user.nationality = Country.find_by(name: '韓国').id
    user.country_id = Country.find_by(name: '韓国').id
    user.region_id = Region.find_by(name: 'Incheon').id
    user.mother_language_id = Language.find_by( name: '韓国語').id
    user.practice_language_id = Language.find_by( name: '英語').id
    user.introduction = "I am studying English and hope to work abroad in the future. My hobbies are listening to music and watching movies, and I especially enjoy Hollywood films."
    user.age = 20
    user.topic = "Movies, music, cultural exchange, technology"
    user.is_active = 'true'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_woman8.png"), filename:"profile_woman8.png")
end
end