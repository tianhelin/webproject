class PostsController < ApplicationController
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
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end

private
  def set_post
  end
  
  def post_params
    params.require(:post).permit(:topic, :content, :user_id)
  end
  
end
