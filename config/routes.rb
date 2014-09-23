Rails.application.routes.draw do

  root to: "home#index"
  
  mount Ckeditor::Engine => '/ckeditor'
  resources :sites

  resources :categories

  # scope :api , defaults: { format: 'json' } do
  resources :themes
  devise_for :users, :controllers => { :registrations => "registrations" }
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
end
