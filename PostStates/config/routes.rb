Rails.application.routes.draw do
  devise_for :users
	resources :states do
		resources :comments
	end
  root to: 'states#index'
end
