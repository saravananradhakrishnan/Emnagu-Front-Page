Rails.application.routes.draw do

  root to: "home#index"

  
  mount Ckeditor::Engine => '/ckeditor'
  resources :sites

  

  namespace :api, defaults: {format: :json} do
    devise_scope :user do
      resource :session, only: [:create, :destroy]
    end
    resources :categories
  end


  # scope :api , defaults: { format: 'json' } do
  resources :themes
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", registrations: "registrations"}
  resources :jobs do
    resources :applicants
  end

  resources :posts do
    member do
      get :published
      get :unpublished
      get :user_profile
      put :like
      put :dislike
    end
    collection do
      get :blog_posts
    end
    resources :contacts
    resources :comments
  end
  resources :portfolios
end
