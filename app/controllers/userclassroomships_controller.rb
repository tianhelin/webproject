class UserclassroomshipsController < ApplicationController
  def index
    @classrooms = Classroom.all
  end
  
  def approved
    @userclassroomship = Userclassroomship.where("user_id =? AND classroom_id = ?",params[:userclassroomship][:user_id],params[:userclassroomship][:classroom_id]).first
    @userclassroomship.approved = true
    @userclassroomship.update(userclassroomship_params)
    if params[:userclassroomship][:init] == ""
      redirect_to classrooms_path
    else
      redirect_to userclassroomships_path
    end
  end
  
  def apply
    
  end
  

private
  def userclassroomship_params
    params.require(:userclassroomship).permit(:approved)
  end


end
