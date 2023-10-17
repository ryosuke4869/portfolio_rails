require 'rails_helper'

RSpec.describe "Item", type: :system do
  describe 'Item' do
    let(:user) { create(:user) }
    let(:user2) { create(:user) }
    let(:user3) { create(:user) }
    let!(:post) { create(:post, :category_engineer, user: user, created_at: Time.now) }
    let!(:post2) { create(:post, :category_writer, user: user2, created_at: Time.now - 1.day) }
    let!(:post3) { create(:post, :category_gamer, user: user3, created_at: Time.now - 2.day) }

    before do
      sign_in(user)
      visit posts_path
      click_on post.user.name
      visit post_path(post.id)
    end

    it 'アイテムの検索と登録ができる' do
      allow(RakutenWebService::Ichiba::Product).to receive(:search).and_return([{ "productName" => "test_item", "averagePrice" => 1000, "mediumImageUrl" => "test_item.jpg", "affiliateUrl" => "url1" }])
      click_on "アイテムを追加する"
      fill_in "keyword", with: "example"
      click_button "検索する"
      expect(page).to have_content("test_item")
      expect(page).to have_selector("img[src*='test_item']")
      # アイテムの登録機能
      click_on "アイテムを追加"
      expect(page).to have_content("test_item")
    end
  end
end
