Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v0 do
      resources :customers, only: %i[] do
        resources :subscriptions, only: %i[index create destroy]
      end
    end
  end
end