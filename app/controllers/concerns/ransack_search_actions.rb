module RansackSearchActions
  extend ActiveSupport::Concern

  def ransack_search
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:categories).page(params[:page]).per(6)
    if params[:q].present?
      if params[:q][:category_eq].present? && params[:q][:category_eq] != ''
        @posts = @posts.joins(:categories).where(categories: { name: params[:q][:category_eq] })
      end
      if params[:q][:s] == "likes"
        sort_order = params[:q][:s_sort_order] == "asc" ? "ASC" : "DESC"
        @posts = @posts.left_joins(:likes).group(:id).order(Arel.sql("COUNT(likes.id) #{sort_order}"))
      else
        sort_order = params[:q][:s_sort_order].presence || "desc"
        if sort_order == "指定なし"
          @posts = @posts.order(created_at: nil)
        else
          @posts = @posts.order(created_at: sort_order)
        end
      end
    end
  end
end
