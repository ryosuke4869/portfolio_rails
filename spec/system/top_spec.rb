require 'rails_helper'

RSpec.describe "Top", type: :system do
  describe 'Topの表示テスト' do
    let(:user) { create(:user) }
    let(:user2) { create(:user) }
    let(:user3) { create(:user) }
    let!(:post) { create(:post, :category_engineer, created_at: Time.now) }
    let!(:post2) { create(:post, :category_writer, created_at: Time.now - 1.day) }
    let!(:post3) { create(:post, :category_gamer, created_at: Time.now - 2.day) }
    let!(:post4) { create(:post, created_at: Time.now - 3.day) }
    let!(:likes) do
      [
        create(:like, post: post, user: user),
        create(:like, post: post, user: user2),
        create(:like, post: post, user: user3),
        create(:like, post: post2, user: user),
        create(:like, post: post2, user: user2),
        create(:like, post: post3, user: user)
      ]
    end

    posts = Post.order(created_at: :desc)

    before do
      visit root_path
    end

    describe 'Topページの表示テスト' do
      context 'いいね数ランキング' do
        it 'いいね数が多い順に３つ表示されている' do
          within '.like-rank' do
            expect(page).to have_selector('.card', count: 3)
            expect(posts.first).to eq(post)
            expect(posts.second).to eq(post2)
            expect(posts.third).to eq(post3)
          end
        end
      end

      context '最近の投稿' do
        it '最近の投稿順に３つ表示されている' do
          within '.recent-post' do
            expect(page).to have_selector('.card', count: 3)
            recent_posts = Post.order(created_at: :desc).take(3)
            expect(recent_posts.first).to eq(post)
            expect(recent_posts.second).to eq(post2)
            expect(recent_posts.third).to eq(post3)
          end
        end
      end

      context 'カテゴリー別に投稿検索' do
        it 'カテゴリーがEngineerの投稿に遷移できる' do
          within '.category-search' do
            click_on 'Engineer'
          end
          expect(page).to have_content ('#Engineer')
        end
        it 'カテゴリーがWriterの投稿に遷移できる' do
          within '.category-search' do
            click_on 'Writer'
          end
          expect(page).to have_content ('#Writer')
        end
        it 'カテゴリーがGamerの投稿に遷移できる' do
          within '.category-search' do
            click_on 'Gamer'
          end
          expect(page).to have_content ('#Gamer')
        end
      end
    end
  end
end
