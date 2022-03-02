Rails.application.routes.draw do
  resources :site_infos
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
    get "/sign_in", to: "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up", to: "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end
  devise_for :users, :skip => [:registrations] 
    as :user do
      get 'users/edit', to: 'devise/registrations#edit', :as => 'edit_user_registration'
      put 'users', to: 'devise/registrations#update', :as => 'user_registration'
    end
  resources :categories
  resources :questions do
    collection do
      post :search
    end
  end
  resources :contacts, only: [:new, :create]
  resource :embed, only: :update
  get 'manage', to: 'questions#index'
  get 'contact', to: 'home#contact'
  root 'home#index'
end
