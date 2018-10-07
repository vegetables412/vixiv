Rails.application.routes.draw do
devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
devise_for :vtubers, controllers: {
  sessions:      'vtubers/sessions',
  passwords:     'vtubers/passwords',
  registrations: 'vtubers/registrations'
}

# devise_scope :user do
# 	root :to => "devise/sessions#new"
# end

root 'posts#top'
get '/home' => "posts#home"
get '/admin_password_edit/:id' => "admins#admin_password_edit", as:'admin_password_edit'
get '/user_password_edit/:id' => "users#user_password_edit", as:'user_password_edit'
get '/vtuber_password_edit/:id' => "vtubers#vtuber_password_edit", as:'vtuber_password_edit'
get '/user_posts_index/:id' => "users#user_posts_index", as:'user_posts_index'


resources :posts do
	resource :favorites, only: [:create, :destroy]
	resource :comments, only: [:create, :destroy]
end
resources :contacts, only: [:index, :show, :new, :create, :destroy]
resources :admins
resources :users do
	member do
		get :following, :followers
	end
end
resources :relationships, only: [:create, :destroy]
resources :vtubers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
