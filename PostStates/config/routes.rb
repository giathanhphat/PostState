Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
	resources :states do
		resources :comments
	end
  root to: 'states#index'
end
