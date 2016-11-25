class AccountsController < ApplicationController
before_action :authenticate_user!, :checkadmin

def index
  @accounts = User.all
  @accounts = @accounts.order('id DESC')
end


def update
  @account = User.find(params[:id])
  @account.adminkey = params[:adminkey]
  @account.update(account_params)
  redirect_to accounts_path
end

private
  def account_params
    params.require(:user).permit(:adminkey)
  end
end
