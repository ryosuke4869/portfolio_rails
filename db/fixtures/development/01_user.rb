User.seed do |s|
  s.id    = 1
  s.email = 'hoge@example.com'
  s.password = 'Hoge1234!'
  s.name = '田中一郎'
end

User.seed do |s|
  s.id    = 2
  s.email = 'hogehoge@example.com'
  s.password = 'HogeHoge1234!'
  s.name = '中山二郎'
end

User.seed do |s|
  s.id    = 3
  s.email = 'hogehogehoge@example.com'
  s.password = 'HogeHogehoge1234!'
  s.name = '山田三郎'
end
