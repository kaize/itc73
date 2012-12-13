Itc73::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  scope module: :web do
    root to: 'welcome#show'

    resources :courses, only: [:index, :show]
    resources :pages, only: [:show] do
      collection do
        get :contacts
      end
    end

    resources :news, only: [:index, :show]

    resource :user, only: [:new, :create] do
      scope module: :user do
        resource :session, only: [:new, :create, :destroy]
      end
    end

    namespace :admin do
      root to: 'welcome#show'

      resources :courses
      resources :course_kinds
      resources :course_levels
      resources :organizers
      resources :tasks
      resources :materials
      resources :pages
      resources :news
      resources :users do
        member do
          put :trigger_state_event
        end
      end
    end
  end

  namespace :api do
    resources :organizers do
      collection do
        put :mass_update_order
      end
    end
  end

end
