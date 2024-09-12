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


# ユーザーを登録
User.create!(first_name: '田中') do |user|
    user.family_name = 'タロウ'
    user.email = '1@yahoo.co.jp'
    user.password = '111111'
    user.country_id = 1
    user.region_id = 1
    user.mother_language_id = 1
    user.practice_language_id = 2
    user.introduction = "田中タロウ、参上！！"
    user.age = 11
    user.topic = "うな重食わせろ！"
    user.is_active = 'true'
end