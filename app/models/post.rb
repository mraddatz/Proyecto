class Post < ApplicationRecord
	#attr_accessor :name, :text, :forum_id, :id
	belongs_to :forum
	has_many :comments, dependent: :destroy
	#:destroy elimina todo lo que depende de un post si este post es eliminado
	belongs_to :user, :optional => true
end
