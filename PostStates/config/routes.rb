Rails.application.routes.draw do
	resources :states
  root to: 'states#index'
end
