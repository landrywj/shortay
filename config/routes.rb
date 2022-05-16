Rails.application.routes.draw do
  root "application#home"
  resources :bookmarks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
