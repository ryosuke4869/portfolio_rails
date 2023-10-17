require 'rails_helper'

RSpec.describe "Bookmark", type: :system, js: true do
  describe 'BookmarkのCRUD' do
    include_context "posts and likes"
    let!(:post_others) { create(:post) }
    let!(:post_others_bookmarked) { create(:post) }
    let!(:bookmark) { create(:bookmark, post: post_others_bookmarked, user: user) }

    describe 'ブックマークの作成と解除' do
      context 'ログインしている場合' do
        before do
          sign_in(user)
        end
        it 'ブックマークを作成できる' do
          visit post_path(post_others)
          click_on "btn-bookmark-#{post_others.id}"
          expect(page).to have_selector('.fas.fa-bookmark')
          expect(post_others.bookmarks.count).to eq(1)
        end
        it 'ブックマークを解除できる' do
          visit post_path(post_others_bookmarked)
          click_on "btn-unbookmark-#{post_others_bookmarked.id}"
          expect(page).to have_selector('.far.fa-bookmark')
          expect(post_others_bookmarked.bookmarks.count).to eq(0)
        end
      end

      context '自分の投稿の場合' do
        it 'ブックマークをclickすることができない' do
          sign_in(user)
          visit post_path(post)
          expect(page).to have_css('.mypost-bookmark')
        end
      end

      context 'ログインしていない場合' do
        it 'いいねをclickすることができない' do
          visit post_path(post_others)
          expect(page).to have_css('.nologin-bookmark')
        end
      end
    end
  end
end
