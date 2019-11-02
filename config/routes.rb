Rails.application.routes.draw do
  resources :students, only: [:show]
  resources :courses, only: [:show]
end
