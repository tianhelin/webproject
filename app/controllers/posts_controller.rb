class PostsController < ApplicationController
  def index
    @post = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
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
  
  def set_params
  end
  
end
