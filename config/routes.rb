Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users
  resources :entries do
    resources :images, controller: "entry_images" do
      patch :move_higher, :move_lower, on: :member
    end
  end
end
