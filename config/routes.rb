Rails.application.routes.draw do

  root to: "homes#index"
  get "about" => "homes#about"
  get "admin" => "admin/homes#top"

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

  devise_for :hotels,skip: [:passwords], controllers: {
  registrations: "hotel/registrations",
  sessions: 'hotel/sessions'
}

  namespace :admin do
    resources :customers, only: [ :index, :create, :show, :edit, :update]
    resources :hotels, only: [ :index, :create, :show, :edit, :update]
  end

  namespace :hotel do
    resources :menus, only: [:new, :create, :index, :show, :edit, :update]
    resources :reservations, only: [:index, :show, :update]
  end

  namespace :public do
    resources :reservations, only: [:index, :show]
    resources :menus do
      resources :reservations, only: [:new, :create]
    end
  end



  scope module: :public do
    get "customer/mypage" => "customers#mypage", as:"mypage"
    get "customer/information" => "customers#edit", as:"information"
    patch "customer/information/update" => "customers#update", as:"information_update"
    get "customer/confirm_withdraw" => "customers#confirm_withdraw", as:"confirm_withdraw"
    get "customers/withdraw" => "customers#withdraw", as:"withdraw"
    patch "/customers/withdraw" => "customers#withdraw"
  end

  scope module: :hotel do
    get "hotel/mypage" => "hotels#mypage", as:"hotel_mypage"
    get "hotel/information" => "hotels#edit", as:"hotel_information"
    patch "hotel/information/update" => "hotels#update", as:"hotel_information_update"
    get "hotel/confirm_withdraw" => "hotels#confirm_withdraw", as:"hotel_confirm_withdraw"
    get "hotels/withdraw" => "hotels#hotel_withdraw", as:"hotel_withdraw"
    patch "/hotels/withdraw" => "hotels#hotel_withdraw"
    delete "menus/:id" => "menus#destroy", as:"destroy_menu"
    get 'customer/confirmations' => "customers#confirmations"

  end

end
