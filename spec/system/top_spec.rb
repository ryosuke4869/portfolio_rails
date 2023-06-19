require 'rails_helper'

RSpec.describe "Top", type: :system do
  fdescribe 'Topの表示テスト' do
    include_context "posts and likes"
    let!(:post4) { create(:post, created_at: Time.now - 3.day) }

    before do
      visit root_path
    end

    describe 'Topページの表示テスト' do
      context 'いいね数ランキング' do
        it 'いいね数が多い順に３つ表示されている' do
          within '.like-rank' do
            cards = page.all('.card')
            expect(page).to have_selector('.card', count: 3)
            expect(cards[0]).to have_content(post3.title)
            expect(cards[1]).to have_content(post2.title)
            expect(cards[2]).to have_content(post.title)
          end
        end
      end

      context '最近の投稿' do
        it '最近の投稿順に３つ表示されている' do
          within '.recent-post' do
            cards = page.all('.card')
            expect(page).to have_selector('.card', count: 3)
            expect(cards[0]).to have_content(post.title)
            expect(cards[1]).to have_content(post2.title)
            expect(cards[2]).to have_content(post3.title)

          end
        end
      end

      context 'カテゴリー別に投稿検索' do
        it 'カテゴリーがEngineerの投稿に遷移できる' do
          within '.category-search' do
            click_on 'Engineer'
          end
          expect(page).to have_content('#Engineer')
        end
        it 'カテゴリーがWriterの投稿に遷移できる' do
          within '.category-search' do
            click_on 'Writer'
          end
          expect(page).to have_content('#Writer')
        end
        it 'カテゴリーがGamerの投稿に遷移できる' do
          within '.category-search' do
            click_on 'Gamer'
          end
          expect(page).to have_content('#Gamer')
        end
      end
    end
  end
end
