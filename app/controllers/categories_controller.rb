class CategoriesController < ApplicationController
  def index
    if params[:category_id].present?
      #presentメソッドでparams[:category_id]に値が含まれているか確認 => trueの場合下記を実行
      @category = Category.find(params[:category_id])
      @posts = @category.posts
    end
  end

end
