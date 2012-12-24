Itc73::Application.routes.draw do

  #get "users/new"

  #get "users/create"

  


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
    resources :users, only: [:new, :create]

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
      resources :graduates
      resources :materials
      resources :organizers
      resources :pages
      resources :news
      resources :tasks
      resources :users do
        member do
          put :trigger_state_event
        end
      end
    end
  end

  namespace :api do
    resources :course_levels, only: [] do
      collection do
        put :mass_update_order
      end
    end

    resources :course_kinds, only: [] do
      collection do
        put :mass_update_order
      end
    end

    resources :organizers, only: [] do
      collection do
        put :mass_update_order
      end
    end

    resources :graduates, only: [] do
      collection do
        put :mass_update_order
      end
    end
  end

end
