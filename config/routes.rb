Rails.application.routes.draw do
  resources :students, only: [:show]
end
