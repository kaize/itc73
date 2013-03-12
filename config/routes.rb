Itc73::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  get '/auth/facebook/callback' => 'web/auth#facebook'
  get '/auth/github/callback' => 'web/auth#github'
  get '/auth/vkontakte/callback' => 'web/auth#vkontakte'
  get '/auth/twitter/callback' => 'web/auth#twitter'
  scope module: :web do
    root to: 'welcome#show'
    resource :auth, :only => [] do
      member do 
        get :failure
        put :authorization_finish
        get :facebook
        get :twitter
        get :vkontakte
        get :github
      end
    end

    resources :search, :only => [:index]
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
