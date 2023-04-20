require 'rails_helper'

RSpec.describe "Comments", type: :system do
  describe 'CommentのCRUD' do
    describe 'コメントの一覧' do
      context 'コメントされている場合' do
        it 'コメントが表示される' do
        # userの名前が表示される
        # userのavatar画像が表示される
        # コメントした日時が表示される
        # コメントの本文が表示される
        end
      end
      context 'コメントがされていない場合' do
        it '' do

        end

      end
    end
    describe 'コメントの作成' do
      it 'コメントの作成に成功する' do

      end

      it 'コメントの作成に失敗する' do

      end

    end

    describe 'コメントの削除' do
      context '他人のコメントの場合' do
        it '削除ボタンが表示されない' do

        end
      end
      context '自身のコメントの場合' do
        it '削除を行うことができる'
        end
      end
    end

  end
end

