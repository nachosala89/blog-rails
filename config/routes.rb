Rails.application.routes.draw do
  root 'users#index'
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/posts", to: "posts#index", as: "posts"
  get "/posts/new", to: "posts#new", as: "new_post"
  get "/users/:user_id/posts/:post_id", to: "posts#show"
  post '/posts', to: 'posts#create', as: "create_post"
  get "/posts/:id/comments/new", to: "comments#new", as: "new_comment"
  post '/posts/:id/comments', to: 'comments#create', as: "create_comment"
end
