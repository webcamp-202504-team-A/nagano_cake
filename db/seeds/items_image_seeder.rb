require "open-uri"

items = [
  ["fruit_candy.png", "フルーツキャンディ"],
  ["remon_honey.png", "はちみつレモンのど飴"],
  ["finance.png", "フィナンシェ"],
  ["madrane.png", "マドレーヌ"],
  ["cookie.png", "クッキーアソート"],
  ["short_cake.png", "いちごショートケーキ"],
  ["gato-shocola.png", "濃厚ガトーショコラ"],
  ["milkrape.png", "ミルクレープ"],
  ["pting.png", "クラシックプリン"],
  ["maccha_pting.png", "抹茶プリン"]
]

items.each do |image_filename, item_name|
  item = Item.find_by(name: item_name)
  next unless item

  image_path = Rails.root.join("db", "seed_images", "items", image_filename)

  if File.exist?(image_path)
    item.image.attach(
      io: File.open(image_path),
      filename: image_filename,
      content_type: "image/jpeg"
    )
    puts "✅ #{item_name} に画像を添付しました"
  else
    puts "⚠️ 画像ファイルが見つかりません: #{image_path}"
  end
end