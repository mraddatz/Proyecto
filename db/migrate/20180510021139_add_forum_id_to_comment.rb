class AddForumIdToComment < ActiveRecord::Migration[5.1]
  def change
  	add_column :comments, :forum_id, :integer
  end
end
