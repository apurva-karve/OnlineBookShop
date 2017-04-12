OnlineBookShop::Application.routes.draw do
  get "home/index"

  get "/", to: 'welcome#index'
  root :to => 'welcome#index'
end
