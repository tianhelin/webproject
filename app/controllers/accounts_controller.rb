class AccountsController < ApplicationController

def index
  @accounts = User.all
end

end
