class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  rolify :before_add => :before_add_method
	has_many :posts
  def before_add_method(role)
  	# do something before it gets added
  end
  
end
