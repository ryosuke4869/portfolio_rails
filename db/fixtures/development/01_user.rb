User.seed do |s|
  s.id    = 1
  s.email = 'aaaa@email.com'
  s.password = 'test12'
  s.name = 'テストユーザー1'
  s.avatar = ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('public/images/avatar_image1.jpeg')), filename: 'avatar_images1.jpeg')
end

User.seed do |s|
  s.id    = 2
  s.email = 'bbbb@gmail.com'
  s.password = 'test34'
  s.name = 'テストユーザー2'
  s.avatar = ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('public/images/avatar_image2.jpeg')), filename: 'avatar_images2.jpeg')
end

User.seed do |s|
  s.id    = 3
  s.email = 'cccc@outlook.jp'
  s.password = 'test56'
  s.name = 'テストユーザー3'
  s.avatar = ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('public/images/avatar_image3.jpeg')), filename: 'avatar_images3.jpeg')
end

User.seed do |s|
  s.id    = 4
  s.email = 'hoge@example.com'
  s.password = 'Hoge1234!'
  s.name = '山田一華'
end

User.seed do |s|
  s.id    = 5
  s.email = 'hogehoge@example.com'
  s.password = 'HogeHoge1234!'
  s.name = '田中二誌'
end

User.seed do |s|
  s.id    = 6
  s.email = 'hogehogehoge@example.com'
  s.password = 'HogeHogeHoge1234!'
  s.name = '山田三次'
end

User.seed do |s|
  s.id    = 7
  s.email = 'hogehogehogeHoge@example.com'
  s.password = 'HogeHogeHogeHoge1234!'
  s.name = '山田四葉'
end

User.seed do |s|
  s.id    = 8
  s.email = 'hogehogehogehogehoge@example.com'
  s.password = 'HogeHogeHogeHogeHoge1234!'
  s.name = '山田五木'
end
