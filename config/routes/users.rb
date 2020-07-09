devise_for :users

namespace :users do
    resources :articles do
        resources :comments
    end
    
    get "/", to: 'users#index', as: "root_path"
    get '/edit_profile/:id', to: 'users#edit_profile', as: 'edit_profile'
end
