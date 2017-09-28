class Article < ActiveRecord::Base

  belongs_to :user

  has_many :article_catagories
  has_many :catagories, through: :article_catagories

  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 13, maximum: 500}
  validates :user_id, presence: true

end
