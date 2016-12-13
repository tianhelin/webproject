class HomeworkpostsController < ApplicationController
before_action :set_homeworkpost,:authenticate_user!
  def edit
  end
  
  def update
    @homeworkpost.handin = true
    @homeworkpost.update(homeworkpost_params)
    redirect_to homework_path(@homeworkpost.homework_id)
  end

private
  def set_homeworkpost
    @homeworkpost = Homeworkpost.find(params[:id])
  end
  
  def homeworkpost_params
    params.require(:homeworkpost).permit(:content,:handin)
  end
end
