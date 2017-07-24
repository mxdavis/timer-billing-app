Rails.application.routes.draw do
  
  namespace :api do 
    namespace :v1 do
      resources :users do
        get '/unbilled_tasks' => 'tasks#unbilled'
        get '/billed_tasks' => 'tasks#billed'
        resources :tasks, :clients
      end
    end
  end
end
