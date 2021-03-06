# -*- encoding : utf-8 -*-
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]  

  # GET /posts
  # GET /posts.json
  def index
    if params[:topic]
      @posts = Post.where(:topic_id=>params[:topic])
    else
      @posts = Post.all
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = Comment.where(:post_id=>@post.id).order(created_at: :asc)
    @new_comment = Comment.new
    @new_comment.post_id = @post.id
  end

  # GET /posts/new
  def new
    @post = Post.new
    if params[:topic]
      @post.topic_id = params[:topic]
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :user_id, :topic_id)
    end
end
