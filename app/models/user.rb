# app/models/user.rb
class User < ApplicationRecord
  # Deviseモジュールの追加
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # フォローしているユーザーとの関連
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  # フォローされているユーザーとの関連
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # ユーザーのフォローを解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # フォローしているかどうかを確認する
  def following?(other_user)
    following.include?(other_user)
  end

  # プロフィール画像アップロード機能の追加
  mount_uploader :avatar, AvatarUploader

  # コメントとの関連を追加
  has_many :comments, dependent: :destroy

  # いいねとの関連を追加
  has_many :likes, dependent: :destroy
  has_many :liked_prototypes, through: :likes, source: :prototype

  # プロトタイプとの関連を追加
  has_many :prototypes, dependent: :destroy

  # serialize_from_session メソッドの追加
  def self.serialize_from_session(key, salt)
    record = to_adapter.get(key)
    record if record && record.authenticatable_salt == salt
  end

  # authenticatable_salt メソッドの追加
  def authenticatable_salt
    encrypted_password[0, 29]
  end
end
