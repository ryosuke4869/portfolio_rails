5.times do |n|
  Post.create!(
    id: n,
    description: "テスト#{n + 1}",
    desk_images: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('public/images/322580172.jpeg')), filename: '322580172.jpeg'),
    user_id: User.offset(rand(User.count)).first.id
  )
end
