RSpec.shared_context "posts and likes" do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }
  let(:user4) { create(:user) }
  let!(:post) { create(:post, :category_engineer, user: user, created_at: Time.now) }
  let!(:post2) { create(:post, :category_writer, user: user2, created_at: Time.now - 1.day) }
  let!(:post3) { create(:post, :category_gamer, user: user3, created_at: Time.now - 2.day) }
  let!(:post4) { create(:post, user: user4, created_at: Time.now - 3.day) }
  let!(:likes) do
    [
      # post3へのLike
      create(:like, post: post3, user: user),
      create(:like, post: post3, user: user2),
      create(:like, post: post3, user: user3),
      # post2へのLike
      create(:like, post: post2, user: user),
      create(:like, post: post2, user: user2),
      # post1へのLike（user4作って修正する必要あり）
      create(:like, post: post, user: user4),
    ]
  end
  let!(:bookmarks) do
    [
      create(:bookmark, post: post2, user: user),
      create(:bookmark, post: post3, user: user)
    ]
  end
end
