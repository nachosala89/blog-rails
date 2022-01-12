Rails.application.routes.draw do
  root 'users#index'
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/posts", to: "posts#index"
  get "/users/:user_id/posts/:post_id", to: "posts#show"
end
