class Forum < ApplicationRecord
	#attr_accessor :name, :description, :id
	has_many :posts, dependent: :destroy
	#:destroy, explicado en el modelo post.rb
	resourcify
end
