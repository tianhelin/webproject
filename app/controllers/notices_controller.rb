class NoticesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @notices = Notice.where('recipient_id = ?', current_user.id )
    @notices = @notices.page(params[:page]).per(10)
  end
  
  def create
  end
  
  def show
  end
  
private

end
