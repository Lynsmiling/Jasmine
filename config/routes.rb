Rails.application.routes.draw do
  devise_for :users

  resources :kindergartens do
    member do
      put"like",to:"kindergartens#upvote"
    end
    member do
      post :join
      post :quit
    end
    resources :posts
    collection do
      get :search
    end
  end
  root 'welcome#index'

  namespace :admin do
    resources :kindergartens do
      member do
       post :publish
       post :hide
      end
    end
  end
end
