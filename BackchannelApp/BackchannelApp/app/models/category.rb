class Category < ActiveRecord::Base
  attr_accessible :category_name
  attr_accessor :name
  has_many :posts
  validates :category_name, :presence => true
end
