Rails.application.routes.draw do
  # 保護者用
  devise_for :parents, controllers: {
    registrations: "parent/registrations",
    sessions: "parent/sessions"
  }
  namespace :parents do
    root to: "homes#top"
  end

  # 生徒用
  devise_for :students, controllers: {
    registrations: "student/registrations",
    sessions: "student/sessions"
  }
  namespace :students do
    root to: "homes#top"
  end

  # 講師用
  devise_for :teachers, controllers: {
    registrations: "teacher/registrations",
    sessions: "teacher/sessions"
  }
  namespace :teachers do
    root to: "homes#top"
  end

  # 管理者用
  devise_for :admin, skip: [:registraions, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: "homes#top"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
