User.seed do |s|
  s.id    = 1
  s.email = 'hoge@example.com'
  s.password = 'Hoge1234!'
  s.username = '田中太郎'
end

User.seed do |s|
  s.id    = 2
  s.email = 'hogehoge@example.com'
  s.password = 'HogeHoge1234!'
  s.username = '田中二郎'
end
