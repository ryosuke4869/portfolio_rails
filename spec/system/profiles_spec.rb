require 'rails_helper'

RSpec.describe "Profiles", type: :system, js: true do
  describe 'Mypage' do
    include_context "posts and likes"

    describe 'Tab切り替えと表示テスト' do
      before do
        sign_in(user)
        visit users_profile_path
      end

      it 'TabのLikeをclickするといいねした投稿が表示される' do
        find('.tab', text: 'Like').click
        expect(page).to have_css('.tab.active')
        expect(page).to have_css('.panel.active')
        expect(page).to have_text("いいねした投稿")
        expect(page).to have_text(post2.title)
        expect(page).to have_text(post3.title)
      end
      it 'TabのPostをclickするとユーザーの投稿が表示される' do
        find('.tab', text: 'Post').click
        expect(page).to have_css('.tab.active')
        expect(page).to have_css('.panel.active')
        expect(page).to have_text("このユーザーの投稿")
        expect(page).to have_text(post.title)
      end
      it 'TabのBookmarkをclickすると保存した投稿が表示される' do
        find('.tab', text: 'Bookmark').click
        expect(page).to have_css('.tab.active')
        expect(page).to have_css('.panel.active')
        expect(page).to have_text("保存した投稿")
        expect(page).to have_text(post2.title)
        expect(page).to have_text(post3.title)
      end
    end
  end
end
