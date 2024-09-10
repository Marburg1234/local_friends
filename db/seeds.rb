
Admin.create(email: '1@yahoo.co.jp', password: '111111')

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
Region.create(name: 'Lübeck', country: germany)
Region.create(name: 'Rostock', country: germany)
Region.create(name: 'Bremen', country: germany)
Region.create(name: 'Oldenburg', country: germany)
# Region.create(name: 'Wilhelmshafen', country: germany)
# Region.create(name: 'Osnabrück', country: germany)
# Region.create(name: 'Cloppenburg', country: germany)
# Region.create(name: 'Meppen', country: germany)
# Region.create(name: 'Nordhorn', country: germany)
# Region.create(name: 'Münster', country: germany)
# Region.create(name: 'Dortmund', country: germany)
# Region.create(name: 'Geslenkirchen', country: germany)
# Region.create(name: 'Essen', country: germany)
# Region.create(name: 'Duisburg', country: germany)
# Region.create(name: 'Düsseldorf', country: germany)
# Region.create(name: 'Köln', country: germany)
# Region.create(name: 'Bonn', country: germany)
# Region.create(name: 'Koblenz', country: germany)
# Region.create(name: 'Siegen', country: germany)
# Region.create(name: 'Giessen', country: germany)
# Region.create(name: 'Hannover', country: germany)
# Region.create(name: 'Marburg', country: germany)
# Region.create(name: 'Kassel', country: germany)
# Region.create(name: 'Bielefeld', country: germany)
# Region.create(name: 'Hannover', country: germany)
# Region.create(name: 'Hildesheim', country: germany)
# Region.create(name: 'Paderborn', country: germany)
# Region.create(name: 'Magdeburg', country: germany)
# Region.create(name: 'Brandenburg', country: germany)
# Region.create(name: 'Berlin', country: germany)
# Region.create(name: 'Cottbus', country: germany)
# Region.create(name: 'Leipzig', country: germany)
# Region.create(name: 'Halle', country: germany)
# Region.create(name: 'Dresden', country: germany)
# Region.create(name: 'Chemnitz', country: germany)
# Region.create(name: 'Zwickau', country: germany)
# Region.create(name: 'Jena', country: germany)
# Region.create(name: 'Erfurt', country: germany)
# Region.create(name: 'Eisenach', country: germany)
# Region.create(name: 'Fulda', country: germany)
# Region.create(name: 'Butzback', country: germany)
# Region.create(name: 'Frankfurt am Main', country: germany)
# Region.create(name: 'Mainz', country: germany)
# Region.create(name: 'Wiesbaden', country: germany)
# Region.create(name: 'Darmstadt', country: germany)
# Region.create(name: 'Aschaffenburg', country: germany)
# Region.create(name: 'Würzburg', country: germany)
# Region.create(name: 'Heidelberg', country: germany)
# Region.create(name: 'Kaiserslautern', country: germany)
# Region.create(name: 'Homburg', country: germany)
# Region.create(name: 'Saarbrücken', country: germany)
# Region.create(name: 'Merzig', country: germany)
# Region.create(name: 'Trier', country: germany)
# Region.create(name: 'Bitburg', country: germany)
# Region.create(name: 'Karlsruhe', country: germany)
# Region.create(name: 'Pforzheim', country: germany)
# Region.create(name: 'Bruchsal', country: germany)
# Region.create(name: 'Heilbronn', country: germany)
# Region.create(name: 'Stuttgart', country: germany)
# Region.create(name: 'Tübingen', country: germany)
# Region.create(name: 'Freiburg', country: germany)
# Region.create(name: 'Konztanz', country: germany)
# Region.create(name: 'Ulm', country: germany)
# Region.create(name: 'Augsburg', country: germany)
# Region.create(name: 'München', country: germany)
# Region.create(name: 'Ingolstadt', country: germany)
# Region.create(name: 'Regensburg', country: germany)
# Region.create(name: 'Nürnberg', country: germany)
# Region.create(name: 'Landshut', country: germany)
# Region.create(name: 'Rosenheim', country: germany)
# Region.create(name: 'Passau', country: germany)
# Region.create(name: 'Deggendorf', country: germany)
# Region.create(name: 'Bayreuth', country: germany)
# Region.create(name: 'Bamberg', country: germany)


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


User.create!(first_name: '元太') do |user|
    user.family_name = '小嶋'
    user.email = '1@yahoo.co.jp'
    user.password = '111111'
    user.country_id = 1
    user.region_id = 1
    user.mother_language_id = 1
    user.practice_language_id = 2
    user.introduction = "小嶋元太、参上！！"
    user.age = 11
    user.topic = "うな重食わせろ！"
    user.is_active = 'true'
end