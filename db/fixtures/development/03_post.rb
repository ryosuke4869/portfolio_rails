12.times do |n|
  user = User.offset(rand(User.count)).first
  created_at = DateTime.new(2023, 6, 1, 10, 30, 0)
  post = Post.create!(
    id: n,
    title: "タイトル#{n + 1}",
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

12.times do |n|
  user = User.offset(rand(User.count)).first
  created_at = DateTime.new(2023, 6, 5, 10, 30, 0)
  post = Post.create!(
    id: n+12,
    title: "タイトル#{n + 7}",
    description: "テスト#{n + 7}",
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
  id: 25,
  title: "タイトル25",
  description: "テスト25",
  user_id: User.find(1).id,
  created_at: DateTime.new(2023, 6, 10, 10, 30, 0),
  desk_images: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('public/images/post_images/Post_image6.jpeg')),
    filename: 'Post_image6.jpeg')
)

post.desk_images.attach(
  [
    {
      io: File.open(Rails.root.join('public/images/post_images/Post_image1.jpeg')),
      filename: 'Post_image1.jpeg'
    },
    {
      io: File.open(Rails.root.join('public/images/post_images/Post_image2.jpeg')),
      filename: 'Post_image2.jpeg'
    },
    {
      io: File.open(Rails.root.join('public/images/post_images/Post_image3.jpeg')),
      filename: 'Post_image3.jpeg'
    }
  ]
)

post = Post.create!(
  id: 26,
  title: "タイトル26",
  description: "テスト26",
  user_id: User.find(1).id,
  created_at: DateTime.new(2023, 6, 10, 10, 30, 0),
  desk_images: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('public/images/post_images/Post_image6.jpeg')),
    filename: 'Post_image6.jpeg')
)

post.desk_images.attach(
  [
    {
      io: File.open(Rails.root.join('public/images/post_images/Post_image3.jpeg')),
      filename: 'Post_image1.jpeg'
    },
    {
      io: File.open(Rails.root.join('public/images/post_images/Post_image5.jpeg')),
      filename: 'Post_image2.jpeg'
    },
    {
      io: File.open(Rails.root.join('public/images/post_images/Post_image1.jpeg')),
      filename: 'Post_image3.jpeg'
    },
    {
      io: File.open(Rails.root.join('public/images/post_images/Post_image4.jpeg')),
      filename: 'Post_image4.jpeg'
    }
  ]
)

