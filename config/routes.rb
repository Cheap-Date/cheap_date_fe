Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "welcome#index"
  
  get "/login", to: "users#login_form"
  post "/login", to: "users#login_user"
  delete "/users/logout", to: "users#logout_user"
  
  get "/register", to: "users#new"
  
  get "/users/:id", to: "users#show"
  post "/users", to: "users#create"
  get "/users/:id/edit", to: "users#edit"
  patch "/users/:id", to: "users#update"
  
  get "/users/:id/meetups", to: "dates#index"
  get "/users/:id/dates/new", to: "dates#new"
  post "/users/:id/meetups", to: "dates#create"
  get "/users/:id/meetups/:meetup_id/edit", to: "dates#edit"

  get "/users/:id/events/new", to: "events#new"

  get "/users/:id/foods/new", to: "foods#new"
end
