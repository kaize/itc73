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
    resources :users, only: [:new, :create] 

    resource :session, only: [:new, :create, :destroy]
    resource :remind_password, only: [:new, :create]

    namespace :account do
      resource :password, only: [:edit, :update]
      resource :user, only: [] do
        collection do
          get :activate
        end
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
