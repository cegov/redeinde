Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :courses do
    resources :courses, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :courses, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :courses, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
