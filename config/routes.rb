Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  resources :users

  resources :products do
    resources :comments
  end
  
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  post 'simple_pages/thank_you'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy'
  end
end
