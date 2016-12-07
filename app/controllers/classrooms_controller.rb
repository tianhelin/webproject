class ClassroomsController < ApplicationController
  before_action :set_classroom, :only => [:edit,:update,:destroy]
  before_action :authenticate_user!
  before_action :checkadmin, :only => [:new,:create,:edit,:update,:destroy]

  def index
    @classrooms = current_user.classrooms.order('approved DESC')
  end
  
  def new
    @classroom = Classroom.new
  end
  
  def create
    @classroom = current_user.classrooms.create(classroom_params)
    redirect_to userclassroomship_approved_path(:userclassroomship => {:user_id => current_user.id,:classroom_id => Classroom.last.id,:init => "new"})
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @classroom.update(classroom_params)
    redirect_to classrooms_path
  end
  
  def destroy
    @classroom.destroy
    redirect_to classrooms_path
  end
  
private
  def set_classroom
    @classroom = Classroom.find(params[:id])
  end
  
  def classroom_params
    params.require(:classroom).permit(:name,:applydeadline, :user_id)
  end
end
