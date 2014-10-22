Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :faqs do
    resources :faqs, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :faqs, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :faqs, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
