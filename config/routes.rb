Rails.application.routes.draw do
  resources :users, except: [:destroy]
  resources :sessions, only: [:create, :destroy]

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'signup',  to: 'users#new', as: 'signup'

  root 'static#home'

  # root 'welcome#index'

  # Example resource route (maps HTTP verbs to controller actions
  # automatically):
  #   resources :products

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end
end
