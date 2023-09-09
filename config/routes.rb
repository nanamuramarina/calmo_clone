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

  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

  devise_for :hotels,skip: [:passwords], controllers: {
  registrations: "hotel/registrations",
  sessions: 'hotel/sessions'
}

  namespace :admin do
    resources :customers, only: [ :index, :create, :show, :edit, :update]
  end

  # scope module: :admin do
  #   get "customer/confirm_withdraw" => "customers#confirm_withdraw", as:"confirm_withdraw"
  #   get "customers/withdraw" => "customers#withdraw", as:"withdraw"
  # end

  scope module: :public do
    get "customer/mypage" => "customers#mypage", as:"mypage"
    get "customer/information" => "customers#edit", as:"information"
    patch "customer/information/update" => "customers#update", as:"information_update"
    get "customer/confirm_withdraw" => "customers#confirm_withdraw", as:"confirm_withdraw"
    get "customers/withdraw" => "customers#withdraw", as:"withdraw"
    patch "/customers/withdraw" => "customers#withdraw"
  end
end
