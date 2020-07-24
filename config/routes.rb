Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :profiles
  devise_for :users
  get 'home/welcome'  
  resources :student_infos, only: [:index] do
    member do
      get "get_branches"      
    end
    collection do
      post "get_standards"
      post "get_students"
      post "get_teachers"
    end
  end
  resources :schools, only: [:index]
  resources :branches, only: [:index]
  resources :standards, only: [:index]
  resources :students, only: [:index, :show]
  resources :teachers, only: [:index]
  root "home#welcome"
end
