class HomeworksController < ApplicationController
  before_action :authenticate_user!
  before_action :checkadmin, :only => [:new,:create,:edit,:update,:destroy]
  before_action :set_homework, :only => [:show,:edit,:update,:destroy]
  
  def index
  end
  
  def new
    @homework = Homework.new
  end
  
  def create
    @homework = Homework.new(homework_params)
    @homework.save
    Userhomeworkship.create(:user_id => current_user.id,:homework_id => @homework.id)
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
  def set_homework
    @homework = Homework.find(params[:id])
  end
  
  def homework_params
    params.require(:homework).permit(:title, :describe, :classroom_id)
  end
end
