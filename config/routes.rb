Rails.application.routes.draw do
  resources :users
  get 'signup', { to: 'users#new', as: 'signup' }

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
