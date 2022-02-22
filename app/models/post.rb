class Post < ApplicationRecord
  
  belongs_to :user
  attachment :image
  
  has_many :comments, dependent: :destroy
# vaildates :contents, presence: true

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search(search,word)
    if search
      @post = Post.where(['contents LIKE ?', "%#{search}%"])
    else
      @post = Post.all
    end
  end
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
end
