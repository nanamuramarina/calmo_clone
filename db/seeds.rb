# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "seedの実行を開始"

Admin.create!(
  email: 'admin@admin',
  password: 'adminmin'
)

customer1 = Customer.find_or_create_by!(email: "taro@mail") do |customer|
  customer.last_name = "山田"
  customer.first_name = "太郎"
  customer.last_name_kana = "ヤマダ"
  customer.first_name_kana = "タロウ"
  customer.phone_number = "11111111111"
  customer.post_code = "1111111"
  customer.address = "東京都八王子市南1-1"
  customer.password = "taropass"
end

 customer2 = Customer.find_or_create_by!(email: "jiro@mail") do |customer|
  customer.last_name = "佐藤"
  customer.first_name = "次郎"
  customer.last_name_kana = "サトウ"
  customer.first_name_kana = "ジロウ"
  customer.phone_number = "22222222222"
  customer.post_code = "2222222"
  customer.address = "神奈川県横浜市西2-2"
  customer.password = "jiropass"
end

 customer3 = Customer.find_or_create_by!(email: "hanako@mail") do |customer|
  customer.last_name = "鈴木"
  customer.first_name = "花子"
  customer.last_name_kana = "スズキ"
  customer.first_name_kana = "ハナコ"
  customer.phone_number = "33333333333"
  customer.post_code = "3333333"
  customer.address = "大阪府大阪市なにわ3-3"
  customer.password = "hanakopass"
end

hotel1 = Hotel.find_or_create_by!(email: "teru@mail") do |hotel|
  hotel.name = "ホテル てる"
  hotel.phone_number = "11111111111"
  hotel.post_code = "1111111"
  hotel.address = "東京都八王子市南1-11"
  hotel.password = "terupass"
end


hotel2 = Hotel.find_or_create_by!(email: "reiwa@mail") do |hotel|
  hotel.name = "ホテル レイワ"
  hotel.phone_number = "22222222222"
  hotel.post_code = "2222222"
  hotel.address = "神奈川県横浜市西2-22"
  hotel.password = "reiwapass"
end

hotel3 = Hotel.find_or_create_by!(email: "seed@mail") do |hotel|
  hotel.name = "HOTEL SEED"
  hotel.phone_number = "33333333333"
  hotel.post_code = "3333333"
  hotel.address = "大阪府大阪市なにわ3-33"
  hotel.password = "seedpass"
end


menu1 = Menu.find_or_create_by!(
  hotel: hotel1,
  title: "素泊まり",
  price: 3000,
  detail: "リモートワークに活用いただけます"
)

menu1.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-menu1.jpg"), filename: "sample-menu1.jpg")

menu2 = Menu.find_or_create_by!(
  hotel: hotel1,
  title: "朝食付",
  price: 4000,
  detail: "朝食バイキングございます",
)

menu2.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-menu2.jpg"), filename: "sample-menu2.jpg")

menu3 = Menu.find_or_create_by!(
  hotel: hotel1,
  title: "夕食、朝食付",
  price: 6000,
  detail: "夜は和食ディナー、朝はバイキングがございます"
)

menu3.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-menu3.jpg"), filename: "sample-menu3.jpg")

menu4 = Menu.find_or_create_by!(
  hotel: hotel2,
  title: "シングルルーム",
  price: 5000,
  detail: "モーニング付となっております"
)

menu4.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-menu4.jpg"), filename: "sample-menu4.jpg")

menu5 = Menu.find_or_create_by!(
  hotel: hotel2,
  title: "ツインルーム",
  price: 4500,
  detail: "モーニング付となっております"
)

menu5.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-menu5.jpg"), filename: "sample-menu5.jpg")

menu6 = Menu.find_or_create_by!(
  hotel: hotel2,
  title: "ダブルルーム",
  price: 4000,
  detail: "モーニング付となっております"
)

menu6.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-menu6.jpg"), filename: "sample-menu6.jpg")

menu7 = Menu.find_or_create_by!(
  hotel: hotel3,
  title: "源泉掛け流し大浴場",
  price: 7000,
  detail: "大浴場が6時から２４時までご自由にご利用いただけます。夕食、朝食付"
)

menu7.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-menu7.jpg"), filename: "sample-menu7.jpg")

menu8 = Menu.find_or_create_by!(
  hotel: hotel3,
  title: "お肉のバイキング！",
  price: 9000,
  detail: "当店自慢のお肉のバイキングです。夕食、朝食付"
)

menu8.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-menu8.jpg"), filename: "sample-menu8.jpg")

menu9 = Menu.find_or_create_by!(
  hotel: hotel3,
  title: "客室露天付",
  price: 14000,
  detail: "客室に当店自慢の温泉がございます。夕食、朝食付"
)

menu9.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-menu9.jpg"), filename: "sample-menu9.jpg")


Reservation.find_or_create_by!(customer_id: customer1.id, menu_id: menu3.id) do |reservation|
  reservation.payment_method = 0
  reservation.start_reservation_date = Date.new(2023, 10, 1)
  reservation.start_reservation_time = "21"
  reservation.end_reservation_date = Date.new(2023, 10, 2)
  reservation.end_reservation_time = "7"
  reservation.number = 2
  reservation.billing_fee = 12000
  reservation.status = 0
end

Reservation.find_or_create_by!(customer_id: customer2.id, menu_id: menu5.id) do |reservation|
  reservation.payment_method = 0
  reservation.start_reservation_date = Date.new(2023, 10, 5)
  reservation.start_reservation_time = "20"
  reservation.end_reservation_date = Date.new(2023, 10, 6)
  reservation.end_reservation_time = "10"
  reservation.number = 2
  reservation.billing_fee = 9000
  reservation.status = 0
end

Reservation.find_or_create_by!(customer_id: customer3.id, menu_id: menu7.id) do |reservation|
  reservation.payment_method = 0
  reservation.start_reservation_date = Date.new(2023, 10, 11)
  reservation.start_reservation_time = "17"
  reservation.end_reservation_date = Date.new(2023, 10, 13)
  reservation.end_reservation_time = "9"
  reservation.number = 2
  reservation.billing_fee = 14000
  reservation.status = 0
end

Report.find_or_create_by!(customer_id: customer1.id, hotel_id: hotel1.id) do |report|
  report.reason = "備品持ち帰り"
end

Contact.create!(
  name: "山田太郎",
  mail: "taro@mail",
  message: "退会になっていることについて"
)

puts "seedの実行が完了しました"