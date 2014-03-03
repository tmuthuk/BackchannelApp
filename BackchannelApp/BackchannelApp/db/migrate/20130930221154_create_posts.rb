class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.string :post_category
      t.string :user_name

      t.timestamps
    end
  end
end
