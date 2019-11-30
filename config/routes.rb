Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'users' => 'users#index'
      put 'users/update' => 'users#update'
      post 'users/sign_up' => 'users#create'
      post 'users/sign_in' => 'user_token#create'
    end
  end
end
