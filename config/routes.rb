Rails.application.routes.draw do
  resources :students, only: [:show]

  resources :courses, only: [:show]

  post '/courses/:id', to: 'course_students#create'
  delete '/courses/:id', to: 'course_students#destroy'
end
