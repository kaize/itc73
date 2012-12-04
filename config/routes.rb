Itc73::Application.routes.draw do

  scope module: :web do
    root to: 'welcome#show'

    resources :pages, only: [:show] do
      collection do
        get :contacts
      end
    end

    resources :news, only: [:index]

    resource :user, only: [:new, :create] do
      scope module: :user do
        resource :session, only: [:new, :create, :destroy]
      end
    end

    namespace :admin do
      root to: 'welcome#show'

      resources :courses
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
  end

end
