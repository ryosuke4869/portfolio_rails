Like.seed(
  :id,
  { post_id: Post.find(0).id, user_id: User.find(1).id },
  { post_id: Post.find(0).id, user_id: User.find(2).id  },
  { post_id: Post.find(0).id, user_id: User.find(3).id  },
  { post_id: Post.find(1).id, user_id: User.find(1).id  },
  { post_id: Post.find(1).id, user_id: User.find(2).id  },
  { post_id: Post.find(2).id, user_id: User.find(3).id  }

)
