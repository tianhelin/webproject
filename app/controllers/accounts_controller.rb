class AccountsController < ApplicationController
before_action :authenticate_user!, :checkadmin

def index
  @accounts = User.all
  @accounts = @accounts.order('id ASC')
end

def create
  if params[:adminset] != nil
    @adminset = params[:adminset]
    @adminset.each do |user_id,adminkey|
      if adminkey != ""
        @user = User.find(user_id)
        @user.adminkey_id = adminkey
        @user.save(account_params)
      end
    end
  end
  redirect_to accounts_path
end

private
  def account_params
    params.permit(:adminset)
  end
end

