class ClassroomsController < ApplicationController
  before_action :set_classroom, :only => [:edit,:update,:destroy,:show]
  before_action :authenticate_user!
  before_action :checkadmin, :only => [:new,:create,:edit,:update,:destroy]

  def index
    @classrooms = current_user.classrooms.order(created_at: :DESC)
  end
  
  def new
    @classroom = Classroom.new
  end
  
  def create
    @classroom = current_user.classrooms.create(classroom_params)
    @classroom.create_posttype(:typename => @classroom.name)
    @apply_path = RQRCode::QRCode.new(userclassroomship_apply_path(Classroom.last.id), size: 4) 
    @recipient = params[:recipient_id]
    @recipient.each do |uid|
      @notice = current_user.notices.new
      @notice.topic = "新增課程#{@classroom.name}!"
      @notice.content = "<p>已經新增課程#{@classroom.name}了！，申請期限為'#{@classroom.applydeadline}'</p>
                         <p>點選連結進入：<a href='#{userclassroomship_apply_path(Classroom.last.id)}'>#{userclassroomship_apply_url(Classroom.last.id)}</a></p>
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
      @notice.recipient_id = uid
      @notice.save
    end
    if params[:classroom_id] != nil
      @classrooms = params[:classroom_id]
      @classrooms.each do |c|
        @recipient = Classroom.find(c).users.ids
        @recipient.each do |r|
          @notice = current_user.notices.new
          @notice.topic = "新增課程#{@classroom.name}!"
          @notice.content = "<p>已經新增課程#{@classroom.name}了！，申請期限為'#{@classroom.applydeadline}'</p>
                             <p>點選連結進入：<a href='#{userclassroomship_apply_path(Classroom.last.id)}'>#{userclassroomship_apply_url(Classroom.last.id)}</a></p>
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
          @notice.recipient_id = r
          @notice.save
        end
      end
    end
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
  
  def delete
    if params[:post_id] != nil
      @posts = params[:post_id]
      @posts.each do |post|
        @post = Post.find(post)
        @post.posttype_id = 2
        @post.save
      end
    end
    @classroom = Classroom.find(params[:id])
    @classroom.posttype.destroy
    @classroom.destroy
    redirect_to classrooms_path
  end

  def destroy
  end
  
private
  def set_classroom
    @classroom = Classroom.find(params[:id])
  end
  
  def classroom_params
    params.require(:classroom).permit(:name,:applydeadline, :user_id,:introduction)
  end
end
