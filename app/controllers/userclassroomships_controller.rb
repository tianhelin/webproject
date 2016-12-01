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
    @userclassroomship = Userclassroomship.new(:user_id => current_user.id , :classroom_id => params[:id])
    @userclassroomship.save(apply_params)
    redirect_to userclassroomships_path
  end
  

private
  def userclassroomship_params
    params.require(:userclassroomship).permit(:approved)
  end
  
  def apply_params
    params.permit(:id)
  end
end
