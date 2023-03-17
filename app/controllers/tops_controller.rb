class TopsController < ApplicationController
  MAX_POSTS_COUNT = 3
  def index
    @recent_posts = Post.all.order(created_at: :desc).limit(MAX_POSTS_COUNT)
    @like_posts = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(MAX_POSTS_COUNT).pluck(:post_id))

    @categories = Category.all
  end
end
