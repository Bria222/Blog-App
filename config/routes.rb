Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  
  root "users#index"
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create]
  end

  resources :posts do
    resources :comments, only: %i[new, create]
    resources :likes, only: %i[create]
  end
  
  if Rails.env.development? 
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end 
end
