Rails.application.routes.draw do
  
  devise_for :users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get "/stories/:story_id/comments/new", :to => "comments#new"

  delete "/stories/:story_id/votes/downvote", :to => "votes#destroy"

  resources :stories do
  	resources :comments, only: [:new, :create, :edit, :update]
  	resources :votes, only: [:create]
  end

  root "stories#index"
end
