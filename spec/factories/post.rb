FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "テスト用の#{n}番目の投稿タイトル" }
    sequence(:description) { |n| "テスト用の#{n}番目の投稿説明" }
    association :user

    after(:build) do |post|
      post.desk_images.attach(io: File.open(Rails.root.join('spec/fixtures/image/post_image_sample.jpeg')),
                              filename: 'post_image_sample.jpeg',
                              content_type: 'image/jpeg')
    end
  end
  # 中間テーブルのテストデータ
  trait :category_engineer do
    after(:build) do |post|
      post.categories << create(:category, :engineer)
    end
  end
  trait :category_writer do
    after(:build) do |post|
      post.categories << create(:category, :writer)
    end
  end
  trait :category_gamer do
    after(:build) do |post|
      post.categories << create(:category, :gamer)
    end
  end
end
