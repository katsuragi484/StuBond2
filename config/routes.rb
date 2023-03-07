Rails.application.routes.draw do
  devise_for :parents
  devise_for :students
  devise_for :teachers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
