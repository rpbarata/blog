class Users::UsersController < ApplicationController
    
    layout "private_layout"
  
    before_action :authenticate_user!
  
    def index; end
end
