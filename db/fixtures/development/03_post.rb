3.times do |n|
  post = Post.create!(
    id: n,
    description: "テスト#{n + 1}",
    desk_images: ActiveStorage::Blob.create_and_upload!(
      io: File.open(Rails.root.join('public/images/post_images/Post_image1.jpeg')),
      filename: 'Post_image1.jpeg'),
    user_id: User.offset(rand(User.count)).first.id
  )
  post.desk_images.attach(io: File.open(Rails.root.join('public/images/post_images/Post_image6.jpeg')),
                  filename: 'Post_image6.jpeg')
end

3.times do |n|
  post = Post.create!(
    id: n+3,
    description: "テスト#{n + 4}",
    desk_images: ActiveStorage::Blob.create_and_upload!(
      io: File.open(Rails.root.join('public/images/post_images/Post_image2.jpeg')),
      filename: 'Post_image2.jpeg'),
    user_id: User.offset(rand(User.count)).first.id
  )
  post.desk_images.attach(io: File.open(Rails.root.join('public/images/post_images/Post_image3.jpeg')),
                  filename: 'Post_image3.jpeg')
end


post = Post.create!(
  id: 7,
  description: "テスト7",
  desk_images: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('public/images/post_images/Post_image6.jpeg')),
    filename: 'Post_image6.jpeg'),
  user_id: User.find(1).id
)

post.desk_images.attach(io: File.open(Rails.root.join('public/images/post_images/Post_image5.jpeg')),
                filename: 'Post_image5.jpeg')


