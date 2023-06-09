module ApplicationHelper
  extend ActiveSupport::Concern

  def apply_sorting(query, sorting_param)
    case sorting_param
    when 'created_at asc', 'created_at desc'
      created_at_order = sorting_param == 'created_at asc' ? 'ASC' : 'DESC'
      query.order("created_at #{created_at_order}")
    when 'likes asc', 'likes desc'
      likes_order = sorting_param == 'likes asc' ? 'ASC' : 'DESC'
      apply_likes_order(query, likes_order)
    when 'bookmarks asc', 'bookmarks desc'
      bookmarks_order = sorting_param == 'bookmarks asc' ? 'ASC' : 'DESC'
      apply_bookmarks_order(query, bookmarks_order)
    else
      query
    end
  end

  private
  def apply_likes_order(query, order)
    query.left_joins(:likes)
          .group('posts.id')
          .order(Arel.sql("COALESCE(COUNT(likes.id), 0) #{order}"))
  end

  def apply_bookmarks_order(query, order)
    query.left_joins(:bookmarks)
          .group('posts.id')
          .order(Arel.sql("COALESCE(COUNT(bookmarks.id), 0) #{order}"))
  end
end
