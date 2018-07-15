Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }


  resources :users do
    resources :posts
  end

  resources :posts
end
