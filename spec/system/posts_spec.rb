require 'rails_helper'

RSpec.describe "Post", type: :system do
  describe 'PostのCRUD' do
    let(:user) { create(:user) }
    let!(:post) { create(:post, user_id: user.id) }
    let!(:post_category_engineer) { create(:post, :category_engineer) }
    let!(:post_category_writer) { create(:post, :category_writer) }
    let!(:post_category_gamer) { create(:post, :category_gamer) }
    let(:post_user) { create(:post, user: user) }
    let(:post_others) { create(:post) }

    describe '投稿一覧ページ' do
      before do
        visit posts_path
      end

      context '投稿が存在する場合' do
        it '投稿一覧が表示される' do
          expect(page).to have_selector("img[src$='sample_icon.jpeg']")
          expect(page).to have_content post.user.name
          expect(page).to have_selector("img[src$='post_image_sample.jpeg']")
        end
        it '投稿詳細ページへの遷移テスト' do
          click_on post.user.name
          expect(current_path).to eq post_path(post.id)
        end
      end
    end

    #----------------新規投稿------------------------
    describe '新規投稿の作成' do
      context 'ログインしている場合' do
        before do
          sign_in(user)
          click_on '新規投稿'
          visit new_post_path
        end

        it '投稿の作成が成功する' do
          fill_in 'デスク紹介', with: 'デスク紹介テスト文'
          attach_file 'デスク画像', "#{Rails.root}/spec/fixtures/image/post_image_sample_2.jpeg"
          click_on '投稿する'
          expect(current_path).to eq(posts_path)
          expect(page).to have_content('投稿しました')
          expect(page).to have_selector("img[src$='post_image_sample_2.jpeg']")
        end
        it '投稿の作成が失敗する' do
          click_on '投稿する'
          expect(page).to have_css('.field_with_errors')
          expect(page).to have_content("件のエラーにより、投稿が失敗しました")
        end
      end

      context 'ログインしていない場合' do
        it 'ログインページにリダイレクトされる' do
          visit new_post_path
          expect(current_path).to eq(user_session_path)
        end
      end
    end
    #----------------postの詳細ページ-------------------
    describe '投稿詳細' do
      before do
        visit posts_path
        click_on post.user.name
        visit post_path(post.id)
      end
      context 'ユーザー共通の投稿詳細ページ' do
        it '投稿の詳細が表示される' do
          # userの名前が表示される
          expect(page).to have_content post.user.name
          # userのavatar画像が表示される
          expect(page).to have_selector("img[src$='sample_icon.jpeg']")
          # 投稿の画像が表示される
          expect(page).to have_selector("img[src$='post_image_sample.jpeg']")
          # 投稿の紹介が表示される
          expect(page).to have_content post.description
          # いいね, 保存数が表示される
          expect(page).to have_content post.likes.count
          expect(page).to have_content post.bookmarks.count
        end
      end
      context '自身の投稿の場合' do
        it '編集と削除ボタンが表示される' do
          sign_in(user)
          visit post_path(post_user)
          expect(page).to have_link '編集'
          expect(page).to have_link '削除'
        end
      end
      context '他ユーザーの投稿の場合' do
        it '編集と削除ボタンが表示されない' do
          visit post_path(post_others)
          expect(page).to have_no_link '編集'
          expect(page).to have_no_link '削除'
        end
      end
    end
    #----------------postの編集------------------------
    describe '投稿の編集' do
      before do
        sign_in(user)
        visit post_path(post_user)
        click_on '編集'
        visit edit_post_path(post_user)
      end

      it '投稿の編集が成功する' do
        fill_in 'デスク紹介', with: 'デスク紹介テスト編集した文'
        attach_file 'デスク画像', "#{Rails.root}/spec/fixtures/image/post_image_sample_2.jpeg"
        click_on '投稿する'
        expect(current_path).to eq(posts_path)
        expect(page).to have_content('投稿を編集しました')
        expect(page).to have_selector("img[src$='post_image_sample_2.jpeg']")
      end
    end

    describe '投稿の削除' do
      before do
        sign_in(user)
        visit post_path(post_user)
      end
      it '投稿を削除する' do
        click_on '削除'
        expect(current_path).to eq(posts_path)
        expect(page).to have_content "投稿を削除しました。"
      end
    end
  end
end
