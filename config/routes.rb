Rails.application.routes.draw do
  resources :students, only: [:show]

  resources :courses, only: [:show]

  delete '/courses/:id', to: 'course_students#destroy'
end
