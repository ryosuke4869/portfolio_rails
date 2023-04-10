require 'rails_helper'

RSpec.describe "Post", type: :system do
  describe 'PostのCRUD' do
    let(:user) { create(:user) }
    let!(:post) { create(:post, user_id: user.id) }
    let!(:post_category_engineer) { create(:post, :category_engineer) }
    let!(:post_category_writer) { create(:post, :category_writer) }
    let!(:post_category_gamer) { create(:post, :category_gamer) }

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
      it '投稿の詳細が表示される' do
      end
    end
    #----------------postの編集------------------------
    describe '投稿の編集と削除' do
      context '自身の投稿の場合' do
        it '編集と削除ボタンが表示される' do
        end
      end

      context '他ユーザーの投稿の場合' do
        it '編集と削除ボタンが表示されない' do
        end
      end
    end
  end
end
