require 'rails_helper'

RSpec.describe "Likes", type: :system do
  describe 'LikeのCRUD' do
    describe 'いいねの作成' do
      context '他ユーザーの投稿, ログインしている場合' do
        it 'いいねが作成できる' do

        end
      end

      context '自分の投稿, ログインしていない場合' do
        it 'いいねをclickできない' do

        end
      end

    end

    describe 'いいねの削除' do
      context 'ログインしている場合' do
        it 'いいねを解除できる' do

        end

      end
      context 'ログインしていない場合' do
        it 'いいねをclickできない' do

        end
      end
    end
  end
end
