Admin.create!(
  email: 'admin@example.com',
  password: 'password',  
  password_confirmation: 'password'
)

customers = [
  {
    last_name:         "山田",
    first_name:        "太郎",
    last_name_kana:    "ヤマダ",
    first_name_kana:   "タロウ",
    postal_code:       "1000001",
    address:           "東京都千代田区千代田1-1",
    telephone_number:  "0312345678",
    email:             "user1@example.com",
    password:          "password1"
  },
  {
    last_name:         "佐藤",
    first_name:        "花子",
    last_name_kana:    "サトウ",
    first_name_kana:   "ハナコ",
    postal_code:       "1500001",
    address:           "東京都渋谷区神宮前5-10-1",
    telephone_number:  "0367890123",
    email:             "user2@example.com",
    password:          "password2"
  },
  {
    last_name:         "鈴木",
    first_name:        "次郎",
    last_name_kana:    "スズキ",
    first_name_kana:   "ジロウ",
    postal_code:       "5300001",
    address:           "大阪府大阪市北区梅田3-1-1",
    telephone_number:  "0661234567",
    email:             "user3@example.com",
    password:          "password3"
  },
  {
    last_name:         "高橋",
    first_name:        "真由美",
    last_name_kana:    "タカハシ",
    first_name_kana:   "マユミ",
    postal_code:       "4600001",
    address:           "愛知県名古屋市中区栄2-2-2",
    telephone_number:  "0522345678",
    email:             "user4@example.com",
    password:          "password4"
  },
  {
    last_name:         "田中",
    first_name:        "健一",
    last_name_kana:    "タナカ",
    first_name_kana:   "ケンイチ",
    postal_code:       "0600001",
    address:           "北海道札幌市中央区北1条西2-2",
    telephone_number:  "0113456789",
    email:             "user5@example.com",
    password:          "password5"
  },
  {
    last_name:         "伊藤",
    first_name:        "愛",
    last_name_kana:    "イトウ",
    first_name_kana:   "アイ",
    postal_code:       "8100001",
    address:           "福岡県福岡市中央区天神1-1-1",
    telephone_number:  "0924567890",
    email:             "user6@example.com",
    password:          "password6"
  },
  {
    last_name:         "渡辺",
    first_name:        "隆",
    last_name_kana:    "ワタナベ",
    first_name_kana:   "タカシ",
    postal_code:       "7300001",
    address:           "広島県広島市中区紙屋町2-2-2",
    telephone_number:  "0825678901",
    email:             "user7@example.com",
    password:          "password7"
  },
  {
    last_name:         "山本",
    first_name:        "彩",
    last_name_kana:    "ヤマモト",
    first_name_kana:   "アヤ",
    postal_code:       "9800001",
    address:           "宮城県仙台市青葉区中央1-1-1",
    telephone_number:  "0226789012",
    email:             "user8@example.com",
    password:          "password8"
  },
  {
    last_name:         "中村",
    first_name:        "悠太",
    last_name_kana:    "ナカムラ",
    first_name_kana:   "ユウタ",
    postal_code:       "3200001",
    address:           "栃木県宇都宮市馬場通り3-3-3",
    telephone_number:  "0287890123",
    email:             "user9@example.com",
    password:          "password9"
  },
  {
    last_name:         "小林",
    first_name:        "美咲",
    last_name_kana:    "コバヤシ",
    first_name_kana:   "ミサキ",
    postal_code:       "9800002",
    address:           "宮城県仙台市青葉区中央2-2-2",
    telephone_number:  "0228901234",
    email:             "user10@example.com",
    password:          "password10"
  }
]

customers.each do |attrs|
  Customer.create!(attrs)
end

Customer.find_each do |customer|
  2.times do |i|
    Address.create!(
      name: "#{customer.last_name} 配送先#{i + 1}",
      postal_code: "123456#{i}",
      address: "東京都サンプル区#{i + 1}丁目#{customer.id}番地",
      customer_id: customer.id
    )
  end
end

genres = ["キャンディ", "焼き菓子", "ケーキ", "プリン"]

genres.each do |genre_name|
  Genre.find_or_create_by!(name: genre_name)
end

items = [
  # キャンディ
  {
    name: "フルーツキャンディ",
    introduction: "いちご、オレンジ、ぶどうなどの味が楽しめるカラフルなキャンディ。",
    genre_id: 1,
    price_without_tax: 300
  },
  {
    name: "はちみつレモンのど飴",
    introduction: "喉にやさしいはちみつと爽やかなレモン風味の飴。",
    genre_id: 1,
    price_without_tax: 320
  },

  # 焼き菓子
  {
    name: "フィナンシェ",
    introduction: "アーモンドの香ばしさとバターの風味が広がるフランス焼き菓子。",
    genre_id: 2,
    price_without_tax: 200
  },
  {
    name: "マドレーヌ",
    introduction: "ふんわり優しい甘さの貝殻型の伝統的な焼き菓子。",
    genre_id: 2,
    price_without_tax: 180
  },
  {
    name: "クッキーアソート",
    introduction: "チョコ、抹茶、紅茶味が詰まった贅沢な詰め合わせ。",
    genre_id: 2,
    price_without_tax: 500
  },

  # ケーキ
  {
    name: "いちごショートケーキ",
    introduction: "ふわふわスポンジといちご、生クリームの王道コンビ。",
    genre_id: 3,
    price_without_tax: 480
  },
  {
    name: "濃厚ガトーショコラ",
    introduction: "ビターで濃厚なチョコが楽しめるしっとりケーキ。",
    genre_id: 3,
    price_without_tax: 520
  },
  {
    name: "ミルクレープ",
    introduction: "何層にも重なるクレープとクリームがとろける味わい。",
    genre_id: 3,
    price_without_tax: 460
  },

  # プリン
  {
    name: "クラシックプリン",
    introduction: "昔ながらの固めでほろ苦カラメルが香る定番プリン。",
    genre_id: 4,
    price_without_tax: 350
  },
  {
    name: "抹茶プリン",
    introduction: "抹茶のほろ苦さと甘さが絶妙な和風プリン。",
    genre_id: 4,
    price_without_tax: 370
  }
]

items.each do |attrs|
  Item.create!(attrs)
end



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
