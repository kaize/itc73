Itc73::Application.routes.draw do

  scope module: :web do
    root to: 'welcome#show'

    resources :pages, only: [:show] do
      collection do
        get :contacts
      end
    end

    resource :user, only: [:new, :create] do
      scope module: :user do
        resource :session, only: [:new, :create, :destroy]
      end
    end

    namespace :admin do
      root to: 'welcome#show'

      resources :pages
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
