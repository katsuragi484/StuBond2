Rails.application.routes.draw do
  # 保護者用
  devise_for :parent, controllers: {
    registrations: "parent/registrations",
    sessions: "parent/sessions"
  }
  namespace :parent do
    root to: "homes#top"
    resource :parents, only: [] do
      get "my_page" => "parents#show"
      get "information/edit" => "parents#edit"
      patch "information" => "parents#update"
      get "unsubscribe" => "parents#unsubscribe"
      patch "withdraw" => "parents#withdraw"
    end
    resources :students, only: [:index, :show, :edit, :update]
    resources :homeworks, only: [:index, :create, :update, :show]
    resources :reports, only: [:index, :show, :edit, :update] do
      patch 'toggle' => 'reports#toggle'
    end
  end

  # 生徒用
  devise_for :student, controllers: {
    registrations: "student/registrations",
    sessions: "student/sessions"
  }
  namespace :student do
    root to: "homes#top"
    resource :students, only: [] do
      get "my_page" => "students#show"
      get "information/edit" => "students#edit"
      patch "information" => "students#update"
      get "unsubscribe" => "students#unsubscribe"
      patch "withdraw" => "students#withdraw"
    end
    resources :chats, only: [:create]
    resources :chatrooms, only: [:index, :show]
    resources :homeworks, only: [:show, :update]
    resources :reports, only: [:index, :show]
  end

  # 講師用
  devise_for :teacher, controllers: {
    registrations: "teacher/registrations",
    sessions: "teacher/sessions"
  }
  namespace :teacher do
    root to: "homes#top"
    resource :teachers, only: [] do
      get "my_page" => "teachers#show"
      get "information/edit" => "teachers#edit"
      patch "information" => "teachers#update"
      get "unsubscribe" => "teachers#unsubscribe"
      patch "withdraw" => "teachers#withdraw"
    end
    resources :reports, only: [:new, :create, :index, :show, :edit, :update]
    resources :chats, only: [:create]
    resources :chatrooms, only: [:index, :show]
    resources :students, only: [:index, :show, :edit, :update]
    resources :homeworks, only: [:index, :show]
  end

  # 管理者用
  devise_for :admin, skip: [:registraions, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: "homes#top"
    resources :homeworks, only: [:index, :show]
    resources :reports, only: [:index, :show]
    resources :subjects, only: [:index, :create, :edit, :update]
    resources :students, only: [:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
