Rails.application.routes.draw do

  resources :comments
  root to: 'main#index'
  get 'my_posts', to: 'main#my_posts'
  devise_for :users
  resources :posts do
    resources :comments, :only => :create
  end

end
