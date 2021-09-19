Rails.application.routes.draw do
  root to: 'home#index'

  scope '/:locale' do
    get 'sessions/new'

    root to: 'home#index'

    get  '/account', to: 'account#edit'
    post '/account', to: 'account#update'

    namespace :account do
      resources :tips, only: [:index]
    end

    resources :tips do
      resources :comments, only: [:create]
    end

    resources :sessions, only: [:new, :create, :destroy]

    resources :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  end
end
