Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "welcome#index"

  # OAuth Callback Route
  get '/auth/:provider/callback', to: 'sessions#omniauth_log_in'
  
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
  patch "/users/:id/meetups/:meetup_id", to: "dates#update"

  get "/users/:id/events", to: "events#index"
  get "/users/:id/events/new", to: "events#new"
  get "/users/:id/foods/new", to: "foods#new"
end
