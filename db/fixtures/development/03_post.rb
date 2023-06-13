3.times do |n|
  user = User.offset(rand(User.count)).first
  created_at = DateTime.new(2023, 6, 1, 10, 30, 0)
  post = Post.create!(
    id: n,
    description: "テスト#{n + 1}",
    desk_images: ActiveStorage::Blob.create_and_upload!(
      io: File.open(Rails.root.join('public/images/post_images/Post_image1.jpeg')),
      filename: 'Post_image1.jpeg'),
    user_id: user.id,
    created_at: created_at
  )
  post.desk_images.attach(io: File.open(Rails.root.join('public/images/post_images/Post_image6.jpeg')),
                  filename: 'Post_image6.jpeg')
end

3.times do |n|
  user = User.offset(rand(User.count)).first
  created_at = DateTime.new(2023, 6, 5, 10, 30, 0)
  post = Post.create!(
    id: n+3,
    description: "テスト#{n + 4}",
    user: user,
    created_at: created_at,
    desk_images: ActiveStorage::Blob.create_and_upload!(
      io: File.open(Rails.root.join('public/images/post_images/Post_image2.jpeg')),
      filename: 'Post_image2.jpeg')
  )
  post.desk_images.attach(io: File.open(Rails.root.join('public/images/post_images/Post_image3.jpeg')),
                  filename: 'Post_image3.jpeg')
end

post = Post.create!(
  id: 6,
  description: "テスト6",
  user_id: User.find(1).id,
  created_at: DateTime.new(2023, 6, 10, 10, 30, 0),
  desk_images: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('public/images/post_images/Post_image6.jpeg')),
    filename: 'Post_image6.jpeg')
)

post.desk_images.attach(io: File.open(Rails.root.join('public/images/post_images/Post_image5.jpeg')),
                filename: 'Post_image5.jpeg')


