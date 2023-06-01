require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post validation' do
    context 'すべてのfieldが有効の場合' do
      it '投稿できる' do
        post = build(:post, :category_engineer)
        expect(post).to be_valid
      end
    end

    context '画像の拡張子が許されていないものでアップロードされた場合' do
      it '投稿に失敗する' do
        post = build(:post)
        post.desk_images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'post_image_test.rb')), filename: 'post_image_test.rb')
        expect(post).not_to be_valid
      end
    end

    context '画像が５枚以上アップロードされた場合' do
      it '投稿に失敗する' do
        post = build(:post)
        post.desk_images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'image', 'post_image_sample.jpeg')), filename: 'post_image_sample.jpeg')
        post.desk_images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'image', 'post_image_sample_2.jpeg')), filename: 'post_image_sample_2.jpeg')
        post.desk_images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'image', 'post_image_sample_3.jpeg')), filename: 'post_image_sample_3.jpeg')
        post.desk_images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'image', 'post_image_sample_4.jpeg')), filename: 'post_image_sample_4.jpeg')
        post.desk_images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'image', 'post_image_sample_5.jpeg')), filename: 'post_image_sample_5.jpeg')
        post.desk_images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'image', 'post_image_sample_6.jpeg')), filename: 'post_image_sample_6.jpeg')
        expect(post).not_to be_valid
      end
    end

    context '5MB以上の画像がアップロードされた場合' do
      it '投稿に失敗する' do
        post = build(:post)
        post.desk_images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'image', 'post_image_sample_7.jpeg')), filename: 'post_image_sample_7.jpeg')
        expect(post).not_to be_valid
      end
    end
  end
end
