class Users::UsersController < ApplicationController
    
    layout "private_layout"
  
    before_action :authenticate_user!
  
    def index
        @articles = Article.all
    end


    def edit_profile
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if @artiusercle.update(user_params)
            redirect_to users_root_path_url
        else
          render 'edit_profile'
        end
    end

    private

    def user_params
        params.require(:user).permit(:usermame)
    end
end
