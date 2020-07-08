devise_for :users

namespace :users do
    resources :articles
    
    get "/", to: 'users#index', as: "root_path"
    get 'edit_profile', to: 'users#edit_profile'


end
