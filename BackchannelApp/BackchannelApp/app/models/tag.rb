class Tag < ActiveRecord::Base
  attr_accessible :name , :post_ids
  has_and_belongs_to_many :posts

end
