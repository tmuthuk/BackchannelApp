class PostVote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :value  , :post, :post_id

  validates_uniqueness_of :post_id, scope: :user_id
  validates_inclusion_of :value , in: [1,0]
 # validate :ensure_not_author

 # def ensure_not_author
  #errors.add :user_id , "is the author of the post"   if Post
  #end

end
