class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :active_relationships,class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :active_relationships,class_name:  "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :following
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  attachment :profile_image

# ユーザーをフォローする
def follow(other_user)
	active_relationships.create(following_id: other_user.id)
end

# ユーザーをアンフォローする
def unfollow(other_user)
	active_relationships.find_by(following_id: other_user.id).destroy
end

# 現在のユーザーがフォローしてたらtrueを返す
def following?(other_user)
	following.include?(other_user)
end

end
