Rails.application.routes.draw do
  
  namespace :api do 
    namespace :v1 do
      resources :users do
        resources :clients do 
          resources :tasks
          end
      end

    end
  end
end
