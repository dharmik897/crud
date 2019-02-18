Rails.application.routes.draw do
  resources :student
  
  root 'student#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
