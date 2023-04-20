require 'rails_helper'

RSpec.describe "Bookmark", type: :system do
  describe 'BookmarkのCRUD' do
    describe 'bookmarkの作成' do
      context '他ユーザーの投稿, ログインしている場合' do
        it 'bookmarkが作成できる' do

        end
      end

      context '自分の投稿, ログインしていない場合' do
        it '保存をclickできない' do

        end
      end

    end

    describe 'bookmarkの削除' do
      context 'ログインしている場合' do
        it '保存を解除できる' do

        end

      end
      context 'ログインしていない場合' do
        it '保存をclickできない' do

        end
      end
    end
  end
end
