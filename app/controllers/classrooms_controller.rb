class ClassroomsController < ApplicationController
  before_action :set_classroom, :only => [:edit,:update,:destroy]
  before_action :authenticate_user!
  before_action :checkadmin, :only => [:new,:create,:edit,:update,:destroy]

  def index
    @classrooms = Classroom.all
  end
  
  def new
    @classroom = Classroom.new
  end
  
  def create
    @classroom = current_user.classrooms.new(classroom_params)
    @classroom.save
    redirect_to classrooms_path
  end
  
  def edit
  end
  
  def update
    @classroom.update(classroom_params)
    redirect_to classrooms_path
  end
  
  def destroy
  end

private
  def set_classroom
    @classroom = Classroom.find(params[:id])
  end
  
  def classroom_params
    params.require(:classroom).permit(:name,:applydeadline, :user_id)
  end
end
