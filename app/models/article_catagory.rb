class ArticleCatagory < ActiveRecord::Base
  belongs_to :article
  belongs_to :catagory
end
