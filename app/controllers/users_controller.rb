class UsersController < ApplicationController
	  #before_action :get_forum

  def show
  	@user = current_user
  	@user_posts = @user.posts
  	@forums = Forum.all
  	@forum_exists = false
  	#@post = @forum.posts.find(params[:id])

  end

  private
    def forum_params
      params.require(:forum).permit(:name, :description)
    end
end
