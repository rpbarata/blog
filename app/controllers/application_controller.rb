class ApplicationController < ActionController::Base
   before_action :set_application_presenter

   private

   def set_application_presenter
    @application_presenter = ApplicationPresenter.new
   end

   def after_sign_in_path_for(resource)
    users_root_path_url
   end

end
