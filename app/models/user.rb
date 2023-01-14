class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts

  has_one_attached :avatar

  #いいね機能のアソシエーション処理
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post

  #コメント機能のアソシエーション処理
  has_many :comments, dependent: :destroy
  has_many :comment_posts, through: :comments, source: :post

  #ブックマーク機能のアソシエーション
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
