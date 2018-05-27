class AddForumIdToPost < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :forum_id, :integer
    add_index  :posts, :forum_id
  end
end
