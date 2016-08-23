Rails.application.routes.draw do
  get 'welcome/index'

  resources :categories, only: [:index, :show]

  namespace :dashboard do
    get '/' => "base#index"
    get 'base/index'
    get 'setting' => "setting#index"
    resources :categories do
      member do
        get :conditions_list
      end
    end
    resources :conditions
    resources :condition_values
    resources :accessories
    resources :users do
      member do
        patch :toggle_visible
      end
    end
  end

  namespace :plugin do
    get '/' => 'base#index'
  end

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:create] do
      post :login, on: :collection
      delete :sign_out, on: :collection
    end
  end

  resource :session, controller: :session
  resource :registration, only: [:new, :create], controller: :registration


  root 'welcome#index'


end
