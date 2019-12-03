Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  devise_scope :user do
    root :to => "users/sessions#new"
     # root :to => "devise/sessions#new" デフォルトのViewを見ている？
  end

  get 'posts/index'
  patch 'posts/edit' => 'posts#update'
  

  get 'home/top' => "home#top"
  # 検索時用TOP
  post '/' => "home#top"
  get 'home/:bangoId' => "home#setBangoId"

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end 

end

