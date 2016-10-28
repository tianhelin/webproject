class PostsController < ApplicationController
 before_action :set_post, :only => [:show,:edit,:update,:destroy]
  def index
    @post = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.save
    
    redirect_to posts_path
  end
  
  def show
  end
  
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end

private
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:topic, :content, :user_id)
  end
  
end
