Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    authenticated :user do
      root 'stories#index', as: :root
    end

    unauthenticated :user do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users, only: [] do
    resource :profile
    resources :albums
  end
  resources :stories do
    resources :comments
  end


  resources :friends
end
