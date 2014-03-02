Portfolio::Application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  scope "(:locale)" do

    resources :posts do
      resources :comments
    end

    resources :projects do
      resources :comments
    end

    get "welcome/index"

    root "welcome#index"

  end

end
