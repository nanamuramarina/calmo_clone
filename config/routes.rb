Rails.application.routes.draw do

  root to: "homes#index"

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
end
