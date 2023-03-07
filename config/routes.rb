Rails.application.routes.draw do
  devise_for :parents, controllers: {
    registrations: "parent/registrations",
    sessions: "parent/sessions"
  }
  devise_for :students, controllers: {
    registrations: "student/registrations",
    sessions: "student/sessions"
  }
  devise_for :teachers, controllers: {
    registrations: "teacher/registrations",
    sessions: "teacher/sessions"
  }
  devise_for :admins, skip: [:registraions, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
