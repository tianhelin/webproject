class UserclassroomshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :checkadmin, :only => [:approved,:mngindex]
  before_action :set_userclassroomship, :only => :show
  def index
    @classrooms = Classroom.all
  end
  
  def approved
    if params[:userclassroomship][:init] == "new"
      @userclassroomship = Userclassroomship.where("user_id =? AND classroom_id = ?",params[:userclassroomship][:user_id],params[:userclassroomship][:classroom_id]).first
      @userclassroomship.approved = true
      @userclassroomship.update(userclassroomship_params)
      redirect_to classrooms_path
    else
      params[:userclassroomship][:user_id].each do |user_id|
        @userclassroomship = Userclassroomship.where('user_id =? AND classroom_id=?', user_id,params[:userclassroomship][:classroom_id]).first
        if user_id != ""
          @userclassroomship.approved = true
          @userclassroomship.update(userclassroomship_params)
        else
          redirect_to userclassroomship_mngindex_path
        end
      end
    end
  end
  
  def apply
    @userclassroomship = Userclassroomship.new(:user_id => current_user.id , :classroom_id => params[:id])
    @userclassroomship.save(apply_params)
    redirect_to userclassroomships_path
  end
  
  def mngindex
    @classrooms = Classroom.all
  end
  
  def show
  end

private
  def userclassroomship_params
    params.require(:userclassroomship).permit(:approved,:user_id)
  end
  
  def apply_params
    params.permit(:id)
  end
  
  def set_userclassroomship
    @classroom = Classroom.find(params[:id])
  end
end
