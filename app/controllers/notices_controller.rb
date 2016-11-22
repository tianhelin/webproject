class NoticesController < ApplicationController
  before_action :authenticate_user!
  
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
  end
  
end
