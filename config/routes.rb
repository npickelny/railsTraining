Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # get 'welcome/index'

  resources :articles do
    resources :comments
  end

  root 'welcome#index'
  # root 'landing#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
