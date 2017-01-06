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
          Classroom.find(params[:userclassroomship][:classroom_id].first).homeworks.each do |homework|
            Userhomeworkship.create(:user_id => user_id,:homework_id => homework.id)
            Homeworkpost.create(:user_id => user_id,:homework_id => homework.id)
        end
          redirect_to userclassroomship_mngindex_path
        end
      end
    end
  end
  
  def apply
    if Classroom.find(params[:id]).applydeadline <= Time.now
      redirect_to userclassroomships_path, :alert => "已經超過申請期限！"
    else
      @userclassroomship = Userclassroomship.new(:user_id => current_user.id , :classroom_id => params[:id])
      @userclassroomship.save(apply_params)
      @notice = Notice.new :topic => "使用者#{current_user.name}申請課程#{Classroom.find(params[:id]).name}!", :content => "課程有新申請，請前往<a href='#{userclassroomship_path(params[:id])}'>審核頁面</a>確認！",:user_id => current_user.id, :recipient_id => '1'
      @notice.save(notice_params)
      redirect_to userclassroomships_path
    end
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
  
  def notice_params
    params.permit(:id)
  end
end
