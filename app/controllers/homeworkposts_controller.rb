class HomeworkpostsController < ApplicationController
before_action :set_homeworkpost,:authenticate_user!,:only => [:edit, :update]
before_action :checkadmin,:only => [:returnhomework,:sendnotice]

  def edit
  end
  
  def update
    @homeworkpost.handin = true
    @homeworkpost.update(homeworkpost_params)
    redirect_to homework_path(@homeworkpost.homework_id)
  end
  
  def returnhomework
    @notice = Notice.new(:recipient_id => Homeworkpost.find(params[:id]).user_id)
  end
  
  def sendnotice
    @notice = current_user.notices.new(notice_params)
    @notice.topic = "所繳交作業：#{Homework.find(params[:homework][:homework_id]).title}被退件，請再修改後交出。"
    @notice.content << "<p><a href='#{homework_path(params[:homework][:homework_id])}'>作業連結</a></p>"
    @notice.save
    @homeworkpost = Homeworkpost.find(params[:homework][:homeworkpost_id])
    @homeworkpost.handin = false
    @homeworkpost.save
    redirect_to homework_path(params[:homework][:homework_id])
  end

private
  def set_homeworkpost
    @homeworkpost = Homeworkpost.find(params[:id])
  end
  
  def homeworkpost_params
    params.require(:homeworkpost).permit(:content,:handin)
  end
  
  def notice_params
    params.require(:notice).permit(:content,:recipient_id)
  end
end
