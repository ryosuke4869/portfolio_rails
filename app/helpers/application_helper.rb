module ApplicationHelper
  extend ActiveSupport::Concern

  def ransack_search
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:categories)

    if params[:category].present? && params[:category] != "指定なし"
      @posts = @posts.joins(:categories).where(categories: { name: params[:category] })
    end

    if params[:sort_by] == "likes"
      @posts = @posts.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC')
    else
      sort_order = params[:sort_order].presence || "desc" # Set a default value if sort_order is empty
      if sort_order == "指定なし"
        @posts = @posts.order(created_at: nil) # Do not apply any specific sorting order
      else
        @posts = @posts.order(created_at: sort_order)
      end
    end
  end
end
