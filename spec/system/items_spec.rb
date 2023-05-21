require 'rails_helper'

RSpec.describe "Item", type: :system do
  describe 'ItemのCRUD' do
    describe '投稿詳細ページのアイテム表示' do
      context 'アイテムが保存されている場合' do
        it 'アイテムの情報が表示される' do
          # アイテムの画像が表示される
          expect(page).to have_selector("img[src$='post_image_sample_2.jpeg']")
          # アイテムの名前が表示される
          expect(page).to have_content item.name.truncate(20)
          # アイテムの値段が表示される
          expect(page).to have_content item.price
        end
      end
      context 'アイテムが保存されていない場合' do
        it 'アイテムが登録されていないと表示される' do
          # アイテムが登録されていないと表示される
          expect(page).to have_content('この投稿にはアイテムが登録されていません')
        end
      end
    end

    describe 'アイテムの検索と追加' do
      context '検索欄に入力した時' do
        it '検索ワードに関連したアイテムの情報が表示される' do
          # アイテムの画像が表示される
          # アイテムの名前が表示される
          # アイテムの値段が表示される
        end
        it 'アイテムを投稿に紐づけることができる' do
          # アイテムを追加できる
        end
      end
      context '検索欄に入力していない場合' do
        it '入力してくださいと表示される' do
        end
      end
    end
  end
end
