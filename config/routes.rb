Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :exercises_and_code do
      resources :students, only: :index, defaults: {format: :json}
    end
  end
end
