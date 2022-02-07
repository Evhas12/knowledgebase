Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :users
  resources :categories
  resources :questions do
    collection do
      post :search
    end
  end
  resources :contacts, only: [:new, :create]
  get 'manage', to: 'questions#index'
  get 'contact', to: 'home#contact'
  # get 'autocomplete', to: 'home#autocomplete'
  root 'home#index'
end
