class Post < ApplicationRecord
  
  belongs_to :user
  attachment :image
  
  has_many :comments, dependent: :destroy
# vaildates :contents, presence: true

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search(search)
    if search
      Post.where(['contents LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
  
  
end
