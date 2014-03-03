class Addvote < ActiveRecord::Migration
  def up

    add_column :posts, :countvotes,  :integer

  end

  def down
    remove_column :posts, :countvotes

  end

end
