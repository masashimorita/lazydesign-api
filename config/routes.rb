Rails.application.routes.draw do
  namespace :api do
    namespace :admin do
      # Admin API
      get 'admins/me' => 'admins#show'
      put 'admins/update' => 'admins#update'
      post 'admins/sign_up' => 'admins#create'
      post 'admins/sign_in' => 'admin_token#create'

      # System Master API
      resources :product_types, except: [:new, :edit]
    end

    namespace :v1 do
      # User API
      get 'users/me' => 'users#show'
      put 'users/update' => 'users#update'
      post 'users/sign_up' => 'users#create'
      post 'users/sign_in' => 'user_token#create'

      # System Master API
      resources :product_types, only: [:index, :show]
    end
  end
end
