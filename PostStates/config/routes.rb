Rails.application.routes.draw do
  devise_for :users
	resources :states
  root to: 'states#index'
end
