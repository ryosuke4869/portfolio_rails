require 'rails_helper'

RSpec.describe "Comments", type: :system do
  describe 'CommentのCRUD' do
    let(:user) { create(:user) }
    let(:user_other) { create(:user) }
    let!(:post) { create(:post, user: user) }
    let!(:post_other) { create(:post, user: user_other) }
    let!(:post_category_engineer) { create(:post, :category_engineer) }
    let!(:post_category_writer) { create(:post, :category_writer) }
    let!(:post_category_gamer) { create(:post, :category_gamer) }
    let!(:comment) { create(:comment, post: post, user: user) }
    let!(:comment_others) { create(:comment, post: post_other, user: user) }

    before do
      visit post_path(post.id)
    end

    describe 'コメントの一覧' do
      context 'コメントされている場合' do
        it 'コメントが表示される' do
          # userの名前が表示される
          expect(page).to have_content comment.user.name
          # userのavatar画像が表示される
          expect(page).to have_selector("img[src$='sample_icon.jpeg']")
          # コメントの本文が表示される
          expect(page).to have_content comment.body
        end
      end
    end

    describe 'コメントの作成' do
      context 'ログインしている場合' do
        before do
          sign_in(user)
          visit post_path(post.id)
        end
        it 'コメントの作成に成功する' do
          # コメント記入欄にコメント本文を記入
          fill_in 'コメント記入欄', with: 'コメントテスト文'
          # コメントするbrnを押す
          click_on 'コメントする'
          # 投稿したコメントが表示される
          expect(page).to have_content('コメントを投稿しました')
        end

        it 'コメントの作成に失敗する' do
          # コメント記入欄にコメント本文を未記入
          fill_in 'コメント記入欄', with: ' '
          # コメントするbtnを押す
          click_on 'コメントする'
          # コメント失敗の表示される
          expect(page).to have_content('コメントの投稿に失敗しました')
        end
      end

      context 'ログインしていない場合' do
        it 'コメント記入欄とコメントするbtnが表示されtない' do
          # コメント記入欄が表示されていない
          expect(page).not_to have_content('コメント記入欄')
          # コメントするbtnが表示されない
          expect(page).not_to have_content('コメントする')
        end
      end
    end

    describe 'コメントの削除' do
      context '他人のコメントの場合' do
        it '削除ボタンが表示されない' do
          expect(page).not_to have_link '削除'
        end
      end
      context '自身のコメント, 自身の投稿のコメントの場合' do
        before do
          sign_in(user)
        end

        it '自身のコメントの削除を行うことができる' do
          visit post_path(post_other.id)
          within '.comment-delete' do
            click_on '削除'
          end
          expect(page).to have_content('コメントを削除しました')
        end

        it '他人のコメントの削除を行うことができる' do
          visit post_path(post.id)
          within '.comment-delete' do
            click_on '削除'
          end
          expect(page).to have_content('コメントを削除しました')
        end
      end
    end
  end
end
