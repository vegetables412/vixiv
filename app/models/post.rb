class Post < ApplicationRecord

belongs_to :user
has_many :tags, dependent: :destroy
accepts_nested_attributes_for :tags, allow_destroy: true
has_many :comments, dependent: :destroy
has_many :favorites, dependent: :destroy

attachment :image

enum restriction: { age: 0, erotic: 1, glo: 2 }

def favorited_by?(user)
	favorites.where(user_id: user.id).exists?
end

end
