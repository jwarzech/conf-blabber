ConfBlabber::Application.routes.draw do
  root :to => "home#index"
  resources :tweets, :only => [:index]
end
