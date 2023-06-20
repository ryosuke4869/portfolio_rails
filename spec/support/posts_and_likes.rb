RSpec.shared_context "posts and likes" do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }
  let!(:post) { create(:post, :category_engineer, created_at: Time.now) }
  let!(:post2) { create(:post, :category_writer, created_at: Time.now - 1.day) }
  let!(:post3) { create(:post, :category_gamer, created_at: Time.now - 2.day) }
  let!(:likes) do
    [
      create(:like, post: post3, user: user),
      create(:like, post: post3, user: user2),
      create(:like, post: post3, user: user3),
      create(:like, post: post2, user: user),
      create(:like, post: post2, user: user2),
      create(:like, post: post, user: user),
    ]
  end
end
