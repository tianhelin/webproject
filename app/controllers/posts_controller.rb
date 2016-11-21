class PostsController < ApplicationController
 before_action :set_post, :only => [:show,:edit,:update,:destroy]
 before_action :authenticate_user!, :only => [:new,:create,:edit,:update,:destroy]
 
  def index
    @posts = Post.all
    if params[:sort] == "class"
      @posts = @posts.order( 'posttype_id ASC' )
      @posts = @posts.page(params[:page]).per(5)
    else
      @posts = @posts.order( 'updated_at DESC' )
      @posts = @posts.page(params[:page]).per(5)
    end
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    @post.save
    
    redirect_to posts_path
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path
  end

private
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:topic, :content, :user_id, :posttype_id)
  end
  
end
