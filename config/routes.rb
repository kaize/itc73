Itc73::Application.routes.draw do

  scope module: :web do
    root to: 'welcome#show'

    resources :pages, only: [:show]
    resource :contacts, only: [:show]

    namespace :admin do
      root to: 'welcome#show'

      resources :pages
      resources :users do
      end
    end
  end

  namespace :api do
  end

end
