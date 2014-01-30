Portfolio::Application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :posts do
    resources :comments
  end

  resources :projects

  get "welcome/index"

  root "welcome#index"

end
