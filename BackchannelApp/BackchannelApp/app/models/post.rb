class Post < ActiveRecord::Base
  attr_accessible  :text, :title, :user_name, :tag_ids, :tag_list   , :user_id, :category_id, :category_name
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :tags
  has_many :post_votes
  has_many :comments, dependent: :destroy
  validates :title, presence: true    , length: { minimum: 5}
  validates :category, :presence => true
  default_scope :order => 'countvotes DESC'

  def self.search(search , choice)
    if search && choice == 'User'
      find(:all, :conditions => ['user_name LIKE ?',"%#{search}%"])
    elsif search && choice =='Category'
      searchcategory(search)
    elsif search && choice =='Content'
      find(:all, :conditions => ['text LIKE ? OR title LIKE ?',"%#{search}%","%#{search}%"])
    elsif search && choice =='Tag'
               tagged_with(search)
    else
     find(:all)
    end
  end

  def self.tagged_with(name)
    Post.joins(:tags).where("tags.name LIKE ?","%#{name}%")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags= names.split(",").map do |t|
      Tag.where(name: t.strip).first_or_create!
    end
  end

 def self.searchcategory(name)
   Post.joins(:category).where("categories.category_name LIKE ?","%#{name}%")
 end

  def self.by_votes
    select('posts.*, coalesce(value, 0) as votes').
        joins('left join post_votes on post_id=posts.id').
        order('votes desc')
  end

  def votes
    read_attribute(:votes) || post_votes.sum(:value)
  end

end

