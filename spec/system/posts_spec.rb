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

        it '投稿の作成が成功する' do
        end

        it '投稿の作成が失敗する' do
        end
      end

      context 'ログインしていない場合' do
        it 'ログインページにリダイレクトされる' do
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
