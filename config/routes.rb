Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :vehicles do
      collection do
        get :all_makes
      end
      member do
        get :get_models_for_make
        get 'get_models_for_make_year/:year', action: 'get_models_for_make_year'
      end
    end
  end

end
