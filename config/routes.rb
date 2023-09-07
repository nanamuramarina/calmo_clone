Rails.application.routes.draw do

  root to: "homes#index"

 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
end
