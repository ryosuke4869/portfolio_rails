FactoryBot.define do
  factory :post do
    sequence(:description) { |n| "テスト用の#{n}番目の投稿" }
    association :user

    after(:build) do |post|
      post.desk_images.attach(io: File.open(Rails.root.join('spec/fixtures/image/post_image_sample.jpeg')),
      filename: 'post_image_sample.jpeg',
      content_type: 'image/jpeg')
    end
  end
end
