class Comment < ApplicationRecord
  validates :body, presence: true #空白のデータ保存禁止
  belongs_to :user
  belongs_to :post
end
