class TopsController < ApplicationController
  MAX_LIKES_COUNT = 3
  def index
    @posts = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(MAX_LIKES_COUNT).pluck(:post_id))
  end
end
