Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "welcome#index"
  get "/login", to: "users#login_form"
  post "/login", to: "users#login_user"
  get "/register", to: "users#new"
  get "/users/:id", to: "users#show"
  post "/users", to: "users#create"
  get "/users/:id/edit", to: "users#edit"
  get "/users/:id/dates/new", to: "dates#new"
  get "/users/:id/events/new", to: "events#new"
  get "/users/:id/foods/new", to: "foods#new"
  delete "/users/logout", to: "users#logout_user"
end
