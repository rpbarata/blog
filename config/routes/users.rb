devise_for :users

namespace :users do
    get "/", to: 'users#index', as: "root_path"
    # get "/", to: 'users#edit_profile', as: "edit_profile"
    get 'profile/edit_profile'
end
