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
    Classroom.find(@homework.classroom_id).users.each do |user|
      Userhomeworkship.create(:user_id => user.id,:homework_id => @homework.id)
      user.homeworkposts.create(:homework_id => @homework.id)
    end
    redirect_to posts_path
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @homework.update(homework_params)
    redirect_to homework_path(@homework)
  end
  
  def destroy
    @homework.destroy
    redirect_to posts_path
  end
  
private
  def set_homework
    @homework = Homework.find(params[:id])
  end
  
  def homework_params
    params.require(:homework).permit(:title, :describe, :classroom_id)
  end
end
