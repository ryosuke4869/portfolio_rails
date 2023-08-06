require 'rails_helper'

RSpec.describe "Pagination with Kaminari", type: :system do
  describe '投稿一覧ページのページネーション機能' do
    let(:user) { create(:user) }
    let!(:posts_kaminari) { create_list(:post, 30) }

    describe 'ページネーション機能' do
      before do
        visit posts_path
      end

      it 'ページ数が正確に表示されている' do
        expect(page).to have_selector('.card', count: 6)
        page_count = find('.pagination').all('li').count - 2
        expect(page_count).to eq(5)
      end

      it 'ページが正しく切り替わる' do
        click_on('›')
        expect(page).to have_selector('.page-item.active', text: '2')
        click_on('4')
        expect(page).to have_selector('.page-item.active', text: '4')
        click_link('«')
        expect(page).to have_selector('.page-item.active', text: '1')
        click_link('»')
        expect(page).to have_selector('.page-item.active', text: '5')
      end
    end
  end
end
