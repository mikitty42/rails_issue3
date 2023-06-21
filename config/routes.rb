Rails.application.routes.draw do
  resources :favorites, only: [:index,:create,:destroy]
  resources :users,only: [:new,:create,:show,:edit,:update]
  resources :sessions,only: [:new,:create,:destroy]
  resources :pictures do
      collection do
          post :confirm
        end
    end
end
