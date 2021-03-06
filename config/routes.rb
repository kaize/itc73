Itc73::Application.routes.draw do

  match "/404", :to => "web/errors#not_found"
  match "/500", :to => "web/errors#internal_error"
  mount Ckeditor::Engine => '/ckeditor'
  get '/auth/:action/callback' => 'web/social_networks'
  get '/auth/failure' => 'web/social_networks#failure'
  scope module: :web do
    root to: 'welcome#show'
    resource :social_network, :only => [] do
      member do 
        get :failure
        get :facebook
        get :vkontakte
        get :twitter
        get :github
      end
    end

    resources :search, :only => [:index]
    resources :courses, only: [:index, :show] do
      collection do
        get :track
      end
    end
    resources :pages, only: [:show] do
      collection do
        get :contacts
      end
    end

    resources :news, only: [:index, :show]
    resources :users, only: [:new, :create] 
    resource :session, only: [:new, :create, :destroy]
    resource :remind_password, only: [:new, :create]
    resource :account, only: [:edit, :update] do
      scope :module => :account do  
        resource :password, only: [:edit, :update]
        resources :courses, only: [:index]
        resource :user do
          get :activate
        end
      end
    end

    resource :user, only: [:index, :new, :create] do
      member do
        put :subscribe_course
        put :unscribe_course
      end
    end

    resource :social_network, :only => [] do 
      get :authorization, :on => :member
    end

    namespace :admin do
      root to: 'welcome#show'

      resources :courses do
        member do
          put :subscribe_state_event
        end
      end
      resources :course_kinds
      resources :course_levels
      resources :graduates
      resources :materials
      resources :organizers
      resources :partners
      resources :news
      resources :tasks
      resources :users do
        member do
          put :trigger_state_event
        end
      end
      resources :pages do
        member do
          put :publish_state_event
        end
      end
      resources :timepad_items, only: [] do
        collection do
          put :export
        end
      end
    end
  end

  namespace :api do
    resources :users, only: [:index]
    resources :universities, only: [:index]
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

    resources :partners, only: [] do
      collection do
        put :mass_update_order
      end
    end

    resources :graduates, only: [] do
      collection do
        put :mass_update_order
      end
    end

    resources :timepad_maillists, only: [] do
      collection do
        put :import
      end
    end

  end

end
