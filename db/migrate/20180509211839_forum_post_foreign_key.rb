class ForumPostForeignKey < ActiveRecord::Migration[5.1]
  def change
  	add_foreign_key :posts, :forums
  end
end
