require 'rails_helper'

RSpec.describe "Likes", type: :system, js: true do
  describe 'LikeのCRUD' do
    let(:user) { create(:user) }
    let!(:post_user) { create(:post, user: user) }
    let!(:post_others) { create(:post) }
    let!(:post_others_liked) { create(:post) }
    let!(:like) { create(:like, post: post_others_liked, user: user) }
    let!(:post_category_engineer) { create(:post, :category_engineer) }
    let!(:post_category_writer) { create(:post, :category_writer) }
    let!(:post_category_gamer) { create(:post, :category_gamer) }

    describe 'いいねの作成と解除' do
      context 'ログインしている場合' do
        before do
          sign_in(user)
        end
        it 'いいねを作成できる' do
          visit post_path(post_others)
          click_on "btn-like-#{post_others.id}"
          expect(page).to have_selector('.fas.fa-heart')
          expect(post_others.likes.count).to eq(1)
        end
        it 'いいねを削除できる' do
          visit post_path(post_others_liked)
          click_on "btn-unlike-#{post_others_liked.id}"
          expect(page).to have_selector('.far.fa-heart')
          expect(post_others_liked.likes.count).to eq(0)
        end
      end

      context '自分の投稿の場合' do
        it 'いいねをclickすることができない' do
          sign_in(user)
          visit post_path(post_user)
          expect(page).to have_css('.mypost-like')
        end
      end

      context 'ログインしていない場合' do
        it 'いいねをclickすることができない' do
          visit post_path(post_others)
          expect(page).to have_css('.nologin-like')
        end
      end
    end
  end
end
