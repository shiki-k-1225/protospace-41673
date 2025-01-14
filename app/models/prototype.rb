class Prototype < ApplicationRecord
  has_many :notifications, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy  
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  belongs_to :user

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  # タグを設定するメソッド
  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  # いいね数を取得するメソッド
  def likes_count
    likes.count
  end

  # 画像アップロード機能の追加
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end
