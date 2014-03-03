class RemoveCategory < ActiveRecord::Migration
  def up
    remove_column :posts, :post_category, :string
  end

  def down
  end
end
