class NoticesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notice, :only => :show
  
  def index
    @notices = Notice.where('recipient_id = ?', current_user.id )
    @notices = @notices.page(params[:page]).per(10)
  end
  
  def create
  end
  
  def show
    if current_user.id != Notice.find(params[:id]).recipient_id
      redirect_to notices_path
    end
    @notice.readed = true
    @notice.save
  end
  
private
  def set_notice
    @notice = Notice.find(params[:id])
  end
  
  def notice_params
    params.require(:notice).permit(:readed)
  end
end
