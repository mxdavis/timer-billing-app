Rails.application.routes.draw do
  
  namespace :api do 
    namespace :v1 do
      resources :users do
        resources :tasks, only: [:index]
        resources :clients do 
          resources :tasks, except: [:index]
          end
      end

    end
  end
end
