Rails.application.routes.draw do

  root 'pages#index'

  get 'pages/portfolio', as: 'portfolio_page'

  resources :users, path: "signup", only: [:new, :create]

  resources :articles, path: "blog" do
    resources :commments
  end

  resources :sessions, path: "signin", only: [:new, :create]

  get '/sessions/delete', to: "sessions#destroy"
end
