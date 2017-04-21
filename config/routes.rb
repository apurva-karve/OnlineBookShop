OnlineBookShop::Application.routes.draw do
  devise_for :users

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  # get "books/new"
  #
  # get "books/create"

  resources :books do
    get "books/new"
    get "books/create"
    get "books/show"
  end

  resources :posts do
   resources :comments
  end


  root :to => 'home#index'
end
