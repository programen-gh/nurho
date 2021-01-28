Rails.application.routes.draw do
  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root to: 'services#index'
  resources :services, only: [:new, :create, :show, :destroy] do
    resources :favorites, only: [:create, :destroy]
    collection do
      get "search"
    end
  end
  resources :users, only: [:show]
  resources :companies, only: [:index]
end
