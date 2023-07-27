module RansackSearchActions
  extend ActiveSupport::Concern

  def ransack_search
    @q = Post.ransack(params[:q])
    posts = @q.result.includes(:categories).page(params[:page]).per(6)
    if params[:q].present?
      if params[:q][:category_eq].present? && params[:q][:category_eq] != ''
        posts = posts.joins(:categories).where(categories: { name: params[:q][:category_eq] })
      end
      if params[:q][:s] == 'created_at asc' || params[:q][:s] == 'created_at desc'
        created_at_order = params[:q][:s] == 'created_at asc' ? 'ASC' : 'DESC'
        posts = posts.order(created_at: created_at_order)
      elsif params[:q][:s] == 'likes asc' || params[:q][:s] == 'likes desc'
        likes_order = params[:q][:s] == 'likes asc' ? 'ASC' : 'DESC'
        posts = posts.left_joins(:likes).
          group('posts.id').
          order(Arel.sql("COUNT(likes.id) #{likes_order}"))
      end
    end
    @posts = posts
    @selected_option = params.dig(:q, :s).presence || ''
  end
end
