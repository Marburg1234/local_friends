Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :users, only: %i[index show edit update] do
      collection do
        get 'active_users' => "users#active_users"
        get 'inactive_users' => "users#inactive_users"
      end
     patch '/admin/users/:id/change_status', to: 'admin/users#change_status', as: 'admin_user_change_status'
    end
    resources :trips, only: %i[index show destroy]
    get 'homes/top'
    get 'search' => "searches#search"
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about', to:'homes#about', as:'about'
    # 地図用のルーティング追記
    resources :maps, only: %i[index] do
      member do
        get '/show' => "maps#show"
        get '/region' => "maps#region"
      end
    end
    # 検索のルーティング
    get 'search' => "searches#search"
    resources :chats, only: %i[show index create destroy]
    resources :trips do
      resource :favorite, only: %i[create destroy]
      resources :trip_comments, only: %i[create destroy]
    end
    resources :users, only: %i[edit show update index] do
      resource :relationships, only: %i[create destroy]
      get :follows, on: :member
      get :followers, on: :member
      collection do
        get "/my_page" => "users#my_page"
        patch 'withdraw'
        post "/guest_sign_in" => "users/sessions#guest_sign_in"
      end
      member do
        get "/unsubscribe" => "users#unsubscribe"
        get 'post_index'
        get "/likes" => "users#likes"
      end
    end
  end

  resources :countries, only: [] do
    get 'regions', on: :member
  end

end
