class Users::UsersController < ApplicationController
    
    layout "private_layout"
  
    before_action :authenticate_user!
  
    def index
        @articles = Article.all
    end

    def edit_profile; end
end
