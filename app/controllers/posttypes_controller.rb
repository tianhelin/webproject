class PosttypesController < ApplicationController
before_action :authenticate_user!, :checkadmin

def index
  @posttypes = Posttype.all
  @posttype = Posttype.new
end

def create
  @posttype = Posttype.new(posttype_params)
  @posttype.save(posttype_params)
  redirect_to posttypes_path
end


def destroy
  @posttype = Posttype.find(params[:id])
  @posttype.destroy
  redirect_to posttypes_path
end

private
  def posttype_params
    params.require(:posttype).permit(:typename, :user_id)
  end
end
