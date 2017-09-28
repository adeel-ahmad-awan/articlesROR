class Catagory < ActiveRecord::Base

  has_many :article_catagories
  has_many :articles, through: :article_catagories

  validates :name, presence: true, length: {minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
end
