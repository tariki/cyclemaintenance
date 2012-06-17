Cyclemaintenance::Application.routes.draw do
  devise_for :users 
  resources :users, :only => ["index", "show", "destroy"]
  resources :bikes, :only => ["new", "show", "create", "edit", "update", "destroy"] do
    member do
      get :screen
      get :thumbnail
    end
    resources :components, :only => ["new", "create", "destroy"]
    resources :records, :only => ["new", "create", "destroy"]
  end

  resources :infos, :only => ["index", "new", "create", "destroy"]
  resources :questions, :only => ["index", "new", "create", "destroy"]
  match '/about' => 'pages#about', :as => :about
  match '/contact' => 'pages#contact', :as => :contact
  match '/terms' => 'pages#terms', :as => :terms
  root :to => "pages#home"
  match '/:controller(/:action(/:id))'
end
