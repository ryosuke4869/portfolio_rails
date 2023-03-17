class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :body, presence: true # 空白のデータ保存禁止
end
