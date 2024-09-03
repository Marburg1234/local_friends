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
    resources :users, only: %i[index show edit update]
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about', to:'homes#about', as:'about'
    resources :trips
    resources :users, only: %i[edit show update] do
      collection do

        patch 'withdraw'
      end
      member do
        get "/unsubscribe" => "users#unsubscribe"
        get 'post_index'
      end
    end

  end



end
