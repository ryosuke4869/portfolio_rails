Like.seed(
  :id,
  # テストユーザー１の投稿
  { post_id: Post.find(0).id, user_id: User.find(2).id },
  { post_id: Post.find(0).id, user_id: User.find(3).id  },
  { post_id: Post.find(0).id, user_id: User.find(4).id  },
  { post_id: Post.find(0).id, user_id: User.find(5).id  },
  { post_id: Post.find(0).id, user_id: User.find(6).id  },
  { post_id: Post.find(0).id, user_id: User.find(7).id  },
  { post_id: Post.find(0).id, user_id: User.find(8).id  },

  { post_id: Post.find(1).id, user_id: User.find(2).id  },
  { post_id: Post.find(1).id, user_id: User.find(3).id  },
  { post_id: Post.find(1).id, user_id: User.find(4).id  },
  { post_id: Post.find(1).id, user_id: User.find(5).id  },

  { post_id: Post.find(2).id, user_id: User.find(2).id  },
  { post_id: Post.find(2).id, user_id: User.find(3).id  },
  { post_id: Post.find(2).id, user_id: User.find(4).id  },

  # テストユーザー２の投稿
  { post_id: Post.find(13).id, user_id: User.find(1).id  },
  { post_id: Post.find(13).id, user_id: User.find(3).id  },
  { post_id: Post.find(13).id, user_id: User.find(4).id  },
  { post_id: Post.find(13).id, user_id: User.find(5).id  },
  { post_id: Post.find(13).id, user_id: User.find(6).id  },
  { post_id: Post.find(13).id, user_id: User.find(7).id  },

  { post_id: Post.find(14).id, user_id: User.find(1).id  },
  { post_id: Post.find(14).id, user_id: User.find(3).id  },
  { post_id: Post.find(15).id, user_id: User.find(1).id  },
  { post_id: Post.find(16).id, user_id: User.find(1).id  },
  { post_id: Post.find(17).id, user_id: User.find(1).id  },
  { post_id: Post.find(18).id, user_id: User.find(1).id  },
  { post_id: Post.find(19).id, user_id: User.find(1).id  },
  { post_id: Post.find(20).id, user_id: User.find(1).id  },

  # テストユーザー３の投稿
  { post_id: Post.find(37).id, user_id: User.find(1).id  },
  { post_id: Post.find(37).id, user_id: User.find(2).id  },
  { post_id: Post.find(37).id, user_id: User.find(4).id  },
  { post_id: Post.find(37).id, user_id: User.find(5).id  },
  { post_id: Post.find(37).id, user_id: User.find(6).id  }
)
