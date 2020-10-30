Rails.application.routes.draw do
  root to: 'entries#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users do
    member do
      get :hoshi50
      get :hoshi45
      get :hoshi42
      get :hoshi40
    end
  end
  resources :entries do
    resources :images, controller: "entry_images" do
      patch :move_higher, :move_lower, on: :member
    end
    resource :evaluation
  end
end
