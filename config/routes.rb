Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'users/me' => 'users#show'
      put 'users/update' => 'users#update'
      post 'users/sign_up' => 'users#create'
      post 'users/sign_in' => 'user_token#create'

      # System Master API
      resources :product_types, except: [:new, :edit]
    end
  end
end
