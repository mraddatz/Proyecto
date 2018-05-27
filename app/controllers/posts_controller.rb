class PostsController < ApplicationController
  before_action :set_user
  before_action :get_forum
  before_action :set_post, only: [:show, :edit, :update, :destroy]



  # GET /posts
  # GET /posts.json
  def index
    #@forum = Forum.find(params[:forum_id])
    @comments = Comment.all

     if params[:search]
      @posts = @forum.posts.where('name ILIKE ? OR text ILIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @posts = @forum.posts
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    #@forum = Forum.find(params[:forum_id])
    @post = @forum.posts.find(params[:id])
    @comments = Comment.all
  end

  # GET /posts/new
  def new

    @user = current_user
    @forum = Forum.find(params[:forum_id])
    @post = @forum.posts.build
    @comments = Comment.all
    #@post = Post.new
    #@new=true
    #@post.forum_id = @forum.id
    #@return_to = params["from"]
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @user= current_user
    @post = @forum.posts.create(post_params)
    @post.user_id = @user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to forum_posts_path(@forum, @user), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: [@forum, @post] }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to [@forum, @post], notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: [@forum, @post] }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to @forum, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = current_user
    end

    def get_forum
     @forum = Forum.find(params[:forum_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      @forum = Forum.find(params[:forum_id])
      @user = current_user
      #@forum = Forum.new
      params.require(:post).permit(:name, :text, :forum_id, :user, :search)
    end
end
