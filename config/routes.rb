Refinery::Application.routes.draw do
  resources :real_estates, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :real_estates, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :categories, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :categories, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
