class HomeworksController < ApplicationController
  before_action :authenticate_user!
  before_action :checkadmin, :only => [:new,:create,:edit,:update,:destroy]
  before_action :set_homework, :only => [:show,:edit,:update,:destroy]
  
  def index
  end
  
  
  def new
  end
  
  def create
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
private
  def set_homework
    @homework = Homework.find(params[:id])
  end
  
  def homework_params
    
  end
end
