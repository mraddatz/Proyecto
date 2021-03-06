class CommentsController < ApplicationController
  before_action :set_user
  before_action :get_post
  before_action :get_forum
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def model_name
  end
  # GET /comments
  # GET /comments.json
  def index
    #@comments = Comment.all
    @comments = @post.comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = @post.comments.find(params[:id])
  end

  # GET /comments/new
  def new
    #@comment = Comment.new
    #@comment = Comment.new(comment_params)
    #@commment = @post.comments.build
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @post.comments.create(comment_params)


    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@forum, @post], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: [@forum, @post] }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@forum, @post], notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: [@forum, @post] }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to [@forum, @post], notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = current_user
    end

    def get_post
      @post = Post.find(params[:post_id])
    end

    def get_forum
      @forum = Forum.find(params[:forum_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:name, :comment, :post_id, :forum_id)
    end
end
