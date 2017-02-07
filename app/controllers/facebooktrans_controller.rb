class FacebooktransController < ApplicationController
	def code
		User.where(uid: params[:uid]).first_or_create do |user|
      user.email = params[:email]
      user.password = Devise.friendly_token[0,20]
      user.accountname = params[:uid]
      user.name = params[:name]
      user.uid = params[:uid]
      user.provider = 'facebook'
      user.save!(user_params)
      if user.persisted?
      	sign_in(User.where(uid: params[:uid]).first, scope: :user)
        redirect_to posts_path
      else
        redirect_to new_user_registration_url
      end
    end		
	end

	private
  def user_params
    params.permit(:uid,:email,:name)
  end


end
  