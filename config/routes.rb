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
     patch '/admin/users/:id/change_status', to: 'admin/users#change_status', as: 'admin_user_change_status'
    end
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about', to:'homes#about', as:'about'
    resources :trips do
      resource :favorite, only: %i[create destroy]
      resources :trip_comments, only: %i[create destroy]
    end
    resources :users, only: %i[edit show update] do
      collection do
        get "/my_page" => "users#my_page"
        patch 'withdraw'
      end
      member do
        get "/unsubscribe" => "users#unsubscribe"
        get 'post_index'
        get "/likes" => "users#likes"
      end
    end
  end
end
