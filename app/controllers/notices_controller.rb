class NoticesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notice, :only => :show
  before_action :checkadmin, :only => [:create, :new]
  
  def index
    @notices = Notice.where('recipient_id = ?', current_user.id )
    @notices = @notices.order('readed ASC')
    @notices = @notices.order('created_at DESC')
    @notices = @notices.page(params[:page]).per(10)
  end
  
  def new
    @notice = Notice.new
  end
  
  def create
    if params[:commit] == "送出全站通知"
      @recipient = User.all.ids
      @recipient.each do |r|
          @notice = current_user.notices.new(notice_params)
          @notice[:recipient_id] = r
          @notice.save
      end
    else
      if params[:recipient_id] != nil
        @recipient = params[:recipient_id]
        @recipient.each do |r|
          @notice = current_user.notices.new(notice_params)
          @notice[:recipient_id] = r
          @notice.save
        end
      end
      if params[:classroom_id] != nil
        @classroom = params[:classroom_id]
        @classroom.each do |c|
          @recipient = Classroom.find(c).users.ids
          @recipient.each do |r|
            @notice = current_user.notices.new(notice_params)
            @notice[:recipient_id] = r
            @notice.save
          end
        end
      end
    end
    redirect_to notices_path
  end
      
  
  def show
    if current_user.id != Notice.find(params[:id]).recipient_id
      redirect_to notices_path
    end
    @notice.readed = true
    @notice.save
  end
  
  def transfer_edit
  end
  
  def trans_create
  end
  
private
  def set_notice
    @notice = Notice.find(params[:id])
  end
  
  def notice_params
    params.require(:notice).permit(:topic,:content,:user_id,:recipient_id,:readed)
  end
end
