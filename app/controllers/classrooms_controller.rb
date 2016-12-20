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
    @classroom.create_posttype(:typename => @classroom.name)
    @apply_path = RQRCode::QRCode.new(userclassroomship_apply_path(Classroom.last.id), size: 4) 
    @notice = current_user.notices.new
    @notice.topic = "新增課程#{@classroom.name}!"
    @notice.content = "<p>已經新增課程#{@classroom.name}了！，申請期限為'#{@classroom.applydeadline}'</p>
                       <p><a href='#{userclassroomship_apply_path(Classroom.last.id)}'>點選我加入課程</a></p>
                       <p>或是透過掃描以下QR code連結至加入頁面：</p>
                       <table class='qr-code'>"
                      @apply_path.modules.each_index do |x|
                        @notice.content << "<tr>"
                        @apply_path.modules.each_index do |y|
                          if @apply_path.dark?(x,y)
                            @notice.content << '<td class="black"/>'
                          else
                            @notice.content << '<td class="white"/>'
                          end
                        end
                        @notice.content << "</tr>"
                      end
    @notice.content<< "</table>"
    @notice.recipient_id = User.first.id
    @notice.save
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
    @classroom.posttype.destroy
    @classroom.destroy
    redirect_to classrooms_path
  end
  
private
  def set_classroom
    @classroom = Classroom.find(params[:id])
  end
  
  def classroom_params
    params.require(:classroom).permit(:name,:applydeadline, :user_id,:introduction)
  end
end
