Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :newsarticles do
    resources :newsarticles, :path => '', :only => [:index, :show] do
      collection do
        get :events
      end
    end
  end

  # Admin routes
  namespace :newsarticles, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :newsarticles, :except => :show do
        collection do
          post :update_positions          
        end        
      end
    end
  end

end
