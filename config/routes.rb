Rails.application.routes.draw do
  resources :places
  resources :professionals do
    get :profile, on: :collection
    post :save_profile, on: :collection
    put :save_profile, on: :collection
    patch :save_profile, on: :collection
    post :send_me, on: :member
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  devise_scope :user do
    authenticated :user do
      root 'redirect#redirect', as: :authenticated_root
    end
    
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get 'redirect', to: 'redirect#redirect', as: 'redirect'

  root to: 'devise/sessions#new'
end
