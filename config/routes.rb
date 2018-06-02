Rails.application.routes.draw do
  resources :forums do
    resources :posts do
      resources :comments
    end
  end

  resources :comments do
    resources :comments
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'pages/about'

  get 'pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :articles
  resources :users

  #mount Thredded::Engine => '/forum'

  #get 'pages/home', to: 'pages#home'
  #get 'pages/about', to: 'pages#about'
  # Se menciona el path con get, lo lleva a folder#file_name contenido dentro de app/views

end
