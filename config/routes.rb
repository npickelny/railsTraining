Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # get 'welcome/index'

  resources :articles do
    resources :comments
  end

  # root 'welcome#index'
  root 'articles#index'
  # root 'landing#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
