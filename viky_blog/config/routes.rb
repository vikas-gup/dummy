Rails.application.routes.draw do
	root 'home#index'

	devise_for :users, path: 'auth', controllers: {
			confirmations: 'users/confirmations',
			passwords: 'users/passwords',
			registrations: 'users/registrations',
			sessions: 'users/sessions',
	}

	devise_scope :user do
		get 'sign_out' => 'users/sessions#destroy'
		#get 'sign_in' => 'users/sessions#new'
		#get 'sign_up' => 'users/registrations#new'
		post 'users' => 'users/registrations#create'
		post 'sign_in' => 'users/sessions#create'
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users
	resources :posts
	get 'looged_in_user' => 'users#looged_in_user'
	get '/*path' => 'home#index'
end
