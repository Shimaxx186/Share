class Post < ApplicationRecord
  belongs_to :user
  attachment :image

  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(searches, words)
    if searches == "perfect_match"
      @post = Post.where("contents LIKE ?", "#{words}")
    else
      @post = Post.where("contents LIKE ?", "%#{words}%")
    end
  end

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
